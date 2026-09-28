--[[
    stb_stitch - Image stitching library for PA-3 map tiles

    Wraps stb_image_write via LuaJIT FFI to write large images
    that exceed GPU texture dimension limits.

    Usage:
        local stitch = require("stb_stitch")
        stitch.writePNG("output.png", pixel_data, width, height, 4)
        stitch.stitchTiles("output.png", tiles, tile_width, tile_height)
]]

local ffi = require("ffi")

ffi.cdef [[
    int stitch_write_png(const char *filename, int w, int h, int comp, const void *data, int stride);
    int stitch_write_bmp(const char *filename, int w, int h, int comp, const void *data);
    int stitch_write_jpg(const char *filename, int w, int h, int comp, const void *data, int quality);

    unsigned char* stitch_load(const char *filename, int *width, int *height, int *channels, int desired_channels);
    void stitch_free(void *data);
    const char* stitch_failure_reason(void);
]]

local M = {}
local lib = nil

-- Load the appropriate library for current platform
function M.init(base_path)
    if lib then return true end

    local lib_path
    if ffi.os == "Windows" then
        lib_path = sasl.getProjectPath() .. "/3rd-modules/stb_stitch/win64.dll"
    elseif ffi.os == "OSX" then
        lib_path = sasl.getProjectPath() .. "/3rd-modules/stb_stitch/mac.dylib"
    else
        lib_path = sasl.getProjectPath() .. "/3rd-modules/stb_stitch/lin64.so"
    end

    local ok, result = pcall(ffi.load, lib_path)
    if ok then
        lib = result
        return true
    else
        sasl.logWarning("stb_stitch: Failed to load library: " .. tostring(result))
        return false, result
    end
end

-- Write raw pixel data to PNG
-- data: FFI pointer or string of pixel data
-- comp: 3 for RGB, 4 for RGBA
function M.writePNG(filename, data, width, height, comp)
    if not lib then
        return false, "Library not initialized"
    end
    local stride = width * comp
    local result = lib.stitch_write_png(filename, width, height, comp, data, stride)
    return result ~= 0
end

-- Write raw pixel data to BMP
function M.writeBMP(filename, data, width, height, comp)
    if not lib then
        return false, "Library not initialized"
    end
    local result = lib.stitch_write_bmp(filename, width, height, comp, data)
    return result ~= 0
end

-- Write raw pixel data to JPG
-- quality: 1-100
function M.writeJPG(filename, data, width, height, comp, quality)
    if not lib then
        return false, "Library not initialized"
    end
    quality = quality or 90
    local result = lib.stitch_write_jpg(filename, width, height, comp, data, quality)
    return result ~= 0
end

-- Stitch multiple tile pixel arrays into one image
-- tiles: array of {data = ffi_ptr, width = w, height = h}
-- layout: "vertical" (default) or "horizontal"
function M.stitchTiles(filename, tiles, comp, layout)
    if not lib then
        return false, "Library not initialized"
    end

    layout = layout or "vertical"
    comp = comp or 4

    local total_width, total_height = 0, 0

    if layout == "vertical" then
        total_width = tiles[1].width
        for _, tile in ipairs(tiles) do
            total_height = total_height + tile.height
        end
    else
        total_height = tiles[1].height
        for _, tile in ipairs(tiles) do
            total_width = total_width + tile.width
        end
    end

    -- Allocate combined buffer
    local data = ffi.new("uint8_t[?]", total_width * total_height * comp)

    -- Copy tiles into buffer
    local offset = 0
    if layout == "vertical" then
        for _, tile in ipairs(tiles) do
            local tile_size = tile.width * tile.height * comp
            ffi.copy(data + offset, tile.data, tile_size)
            offset = offset + tile_size
        end
    else
        -- Horizontal layout requires row-by-row copying
        for y = 0, total_height - 1 do
            local x_offset = 0
            for _, tile in ipairs(tiles) do
                local src_row = tile.data + (y * tile.width * comp)
                local dst = data + (y * total_width + x_offset) * comp
                ffi.copy(dst, src_row, tile.width * comp)
                x_offset = x_offset + tile.width
            end
        end
    end

    local stride = total_width * comp
    local result = lib.stitch_write_png(filename, total_width, total_height, comp, data, stride)
    return result ~= 0
end

-- Create an empty pixel buffer
function M.createBuffer(width, height, comp)
    comp = comp or 4
    return ffi.new("uint8_t[?]", width * height * comp)
end

-- Stitch SASL render target tiles into one image and save to file
-- render_targets: array of SASL render target IDs (from createRenderTarget)
-- tile_width, tile_height: dimensions of each tile
-- comp: 4 for RGBA (default)
function M.stitchRenderTargets(filename, render_targets, tile_width, tile_height, comp)
    if not lib then
        return false, "Library not initialized"
    end

    comp = comp or 4
    local num_tiles = #render_targets
    local total_height = tile_height * num_tiles
    local row_bytes = tile_width * comp

    -- Allocate combined buffer
    local data = ffi.new("uint8_t[?]", tile_width * total_height * comp)

    -- Create a reusable storage for extracting tile data
    local storage_id = sasl.gl.createTextureDataStorage(tile_width, tile_height)
    if not storage_id then
        return false, "Failed to create texture data storage"
    end

    -- Extract and copy each tile (in reverse order for vertical flip)
    for i = num_tiles, 1, -1 do
        local rt = render_targets[i]
        local raw_data = sasl.gl.getRawTextureData(rt, storage_id)

        if raw_data then
            -- Cast userdata to FFI pointer
            local src = ffi.cast("uint8_t*", raw_data)

            -- Destination tile index (flipped)
            local dst_tile_idx = num_tiles - i

            -- Copy rows in reverse order within tile (vertical flip only)
            for row = 0, tile_height - 1 do
                local src_row = tile_height - 1 - row
                local src_offset = src_row * row_bytes
                local dst_offset = (dst_tile_idx * tile_height + row) * row_bytes

                -- Copy row directly (no horizontal flip)
                ffi.copy(data + dst_offset, src + src_offset, row_bytes)
            end
        else
            sasl.logWarning("stb_stitch: Failed to get raw data for tile " .. i)
        end
    end

    -- Cleanup storage
    sasl.gl.deleteTextureDataStorage(storage_id)

    local stride = tile_width * comp
    local result = lib.stitch_write_png(filename, tile_width, total_height, comp, data, stride)
    return result ~= 0
end

-- Load an image file and return raw data with dimensions
-- Returns: data (FFI pointer), width, height, channels or nil, error_message
function M.loadImage(filename, desired_channels)
    if not lib then
        return nil, "Library not initialized"
    end

    desired_channels = desired_channels or 4

    local width = ffi.new("int[1]")
    local height = ffi.new("int[1]")
    local channels = ffi.new("int[1]")

    local data = lib.stitch_load(filename, width, height, channels, desired_channels)

    if data == nil then
        local reason = ffi.string(lib.stitch_failure_reason())
        return nil, "Failed to load image: " .. reason
    end

    return data, width[0], height[0], desired_channels
end

-- Free image data loaded with loadImage
function M.freeImage(data)
    if lib and data then
        lib.stitch_free(data)
    end
end

-- Load an image and split it into SASL render target tiles
-- filename: path to image file
-- render_targets: array of SASL render target IDs to fill
-- tile_width, tile_height: dimensions of each tile
-- Returns: true on success, false and error message on failure
function M.loadToRenderTargets(filename, render_targets, tile_width, tile_height)
    if not lib then
        return false, "Library not initialized"
    end

    local comp = 4
    local row_bytes = tile_width * comp

    -- Load the image
    local img_data, img_width, img_height, img_channels = M.loadImage(filename, comp)
    if not img_data then
        return false, img_width -- img_width contains error message
    end

    -- Verify dimensions
    if img_width ~= tile_width then
        M.freeImage(img_data)
        return false, string.format("Image width %d doesn't match tile width %d", img_width, tile_width)
    end

    local num_tiles = #render_targets
    local expected_height = tile_height * num_tiles

    if img_height > expected_height then
        sasl.logWarning(string.format("stb_stitch: Image height %d exceeds expected %d, truncating", img_height,
            expected_height))
    elseif img_height < expected_height then
        sasl.logWarning(string.format("stb_stitch: Image height %d less than expected %d, padding with black", img_height,
            expected_height))
    end

    -- Create a storage for uploading tile data
    local storage_id = sasl.gl.createTextureDataStorage(tile_width, tile_height)
    if not storage_id then
        M.freeImage(img_data)
        return false, "Failed to create texture data storage"
    end

    -- Get pointer to storage buffer
    local storage_ptr = sasl.gl.getTextureDataPointer(storage_id)
    if not storage_ptr then
        sasl.gl.deleteTextureDataStorage(storage_id)
        M.freeImage(img_data)
        return false, "Failed to get texture data pointer"
    end
    local dst = ffi.cast("uint8_t*", storage_ptr)

    -- Split image into tiles (with vertical flip for OpenGL)
    for i = num_tiles, 1, -1 do
        local rt = render_targets[i]
        local src_tile_idx = num_tiles - i

        -- Clear the tile buffer first (in case image is smaller)
        ffi.fill(dst, tile_width * tile_height * comp, 0)

        -- Copy rows with vertical flip
        for row = 0, tile_height - 1 do
            local src_row_in_image = src_tile_idx * tile_height + row
            if src_row_in_image < img_height then
                -- Flip: read from top of image section, write to bottom of tile
                local dst_row = tile_height - 1 - row
                local src_offset = src_row_in_image * row_bytes
                local dst_offset = dst_row * row_bytes

                ffi.copy(dst + dst_offset, img_data + src_offset, row_bytes)
            end
        end

        -- Upload to render target
        sasl.gl.setRawTextureData(rt, storage_id)
    end

    -- Cleanup
    sasl.gl.deleteTextureDataStorage(storage_id)
    M.freeImage(img_data)

    return true
end

return M
