-- editor_textfield.lua: Basic text field widget for NVU editor

-- Local properties for SASL 3 style
--defineProperty("position", {0, 0, 60, 28})
defineProperty("data", nil)
defineProperty("hover", 0)
defineProperty("focused", false)
defineProperty("label", "")
defineProperty("setData", nil)

defineProperty("type", "string")
defineProperty("max_length", 16)
defineProperty("color", { 0.85, 0.85, 0.85, 1 })

-- note to self: cursor is an internal property of SASL that's used in handling mouse events
-- never override it
defineProperty("field_cursor", 0) -- cursor position (0 = before first char, #text = after last)
time = globalPropertyf("sim/time/local_time_sec")

defaultTextColor = { 1, 1, 1, 1 }
text = ""

-- Track last active state to detect focus changes
local lastFocused = false

function update()
    -- On focus gain: initialize text from data
    local focusedNow = get(focused)
    if focusedNow == true and lastFocused ~= true then
        local d = get(data)
        if d ~= nil then
            text = tostring(d)
        else
            text = ""
        end
        set(field_cursor, #text)
    end
    -- On focus lost: write back to data if changed
    if get(focused) == false and lastFocused == true then
        if get(type) == "number" then
            if get(data) ~= tonumber(text) then
                setData(tonumber(text))
            end
        else
            if get(data) ~= text then
                setData(text)
            end
        end
        
        set(field_cursor, 0)
        set(hover, 0)
    end
    lastFocused = focusedNow
end

function draw()
    update()
    local pos = get(position)
    local col = get(color)
    local t
    if get(focused) == true then
        t = text
    else
        local d = get(data)
        t = d ~= nil and tostring(d) or ""
    end
    local cur = get(field_cursor)
    -- Background
    if get(focused) == true then
        sasl.gl.drawRectangle(0, 0, pos[3], pos[4], { col[1] * 1.3, col[2] * 1.3, col[3] * 1.3, col[4] })
    elseif get(hover) == 1 then
        sasl.gl.drawRectangle(0, 0, pos[3], pos[4], { col[1] * 1.1, col[2] * 1.1, col[3] * 1.1, col[4] })
    else
        sasl.gl.drawRectangle(0, 0, pos[3], pos[4], col)
    end

    -- Label and separator
    local labelText = get(label)
    local labelW = 0
    local textX = 3
    if labelText ~= "" then
        sasl.gl.drawText(avia_font, 3, (pos[4] / 2) - 4, labelText, 16, false, false, TEXT_ALIGN_LEFT, defaultTextColor)
        labelW = sasl.gl.measureText(font, labelText, 16, false, false)
        -- Draw vertical separator line after label
        local sepX = 3 + labelW + 6
        sasl.gl.drawRectangle(sepX, 0, 1, pos[4], { 1, 1, 1, 1 })
        textX = sepX + 3
    end

    -- Border
    sasl.gl.drawFrame(0, 0, pos[3], pos[4], { 1, 1, 1, 1 })
    -- Text (shifted by label+separator)
    sasl.gl.drawText(avia_font, textX, (pos[4] / 2) - 4, t, 16, false, false, TEXT_ALIGN_LEFT, defaultTextColor)
    -- Cursor (blinking, only if active)
    if get(focused) == true then
        local timeVal = get(time)
        if math.floor(timeVal * 1) % 2 == 0 then -- ~1Hz blink
            -- Cursor position: after cur chars
            local left = string.sub(t, 1, cur)
            local textW = sasl.gl.measureText(avia_font, left, 16, false, false)
            local cx = textX + textW + 1
            local cy = (pos[4] / 2) - 8
            sasl.gl.drawRectangle(cx, cy, 2, 16, { 1, 1, 1, 1 })
        end
    end
end

function onMouseMove(component, x, y, button)
    return true
end

function onMouseEnter()
    set(hover, 1)
    return true
end

function onMouseLeave()
    set(hover, 0)
    return true
end

function onMouseDown(component, x, y, button)
    if button == MB_LEFT then
        set(focused, true)
        set(hover, 1)
        -- Move cursor to end
        set(field_cursor, #text)
        return true
    end
    return false
end

function onMouseUp(component, x, y, button)
    return true
end

function onKeyDown(component, char, key, shDown, ctrlDown, altOptDown)
    if get(focused) ~= true then return false end
    local t = text
    local cur = get(field_cursor)
    local maxLen = get(max_length) or 16
    -- Left arrow (key code 37)
    if key == 37 then
        if cur > 0 then set(field_cursor, cur - 1) end
        return true
    end
    -- Right arrow (key code 39)
    if key == 39 then
        if cur < #t then set(field_cursor, cur + 1) end
        return true
    end
    -- Delete (key code 46)
    if key == 46 then
        if cur < #t then
            text = string.sub(t, 1, cur) .. string.sub(t, cur + 2)
        end
        return true
    end
    -- Backspace (key code 8)
    if key == 8 then
        if cur > 0 then
            text = string.sub(t, 1, cur - 1) .. string.sub(t, cur + 1)
            set(field_cursor, cur - 1)
        end
        return true
    end
    -- Enter key (defocus field)
    if key == 13 then
        set(focused, false)
        return true
    end
    -- Printable or non-ASCII input
    local typ = get(type) or "string"
    local ch = string.char(char)
    -- Helper to count UTF-8 characters
    local function utf8len(s)
        local _, count = string.gsub(s, '[^\128-\193]', '')
        return count
    end
    if (char >= 32 or char < 0) then
        if typ == "number" then
            if #t < maxLen then
                -- Allow digits always
                if ch:match("[0-9]") then
                    text = string.sub(t, 1, cur) .. ch .. string.sub(t, cur + 1)
                    set(field_cursor, cur + 1)
                -- Allow minus only at start and only once
                elseif ch == "-" and cur == 0 and not t:find("-") then
                    text = "-" .. t
                    set(field_cursor, cur + 1)
                -- Allow dot only once and not as first char (unless minus is present)
                elseif ch == "." and not t:find("%.") and cur > 0 and not (cur == 1 and string.sub(t,1,1)=="-") then
                    text = string.sub(t, 1, cur) .. "." .. string.sub(t, cur + 1)
                    set(field_cursor, cur + 1)
                end
            end
        else
            -- string: allow any printable or non-ASCII
            local newText = string.sub(t, 1, cur) .. ch .. string.sub(t, cur + 1)
            if utf8len(newText) <= maxLen then
                text = newText
                set(field_cursor, cur + 1)
            end
        end
    end
    return true
end

function onModuleInit()

end

