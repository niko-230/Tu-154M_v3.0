-- editor_leg.lua: Horizontal NVU leg editor row

defineProperty("legData", nil)

local label_font = sasl.gl.loadFont("Verdana.ttf")

-- Consistent spacing and width for all fields and button
local spacing = 10
local nameWidth = 170
local sWidth = 75
local zWidth = 70
local dtkWidth = 80
local btnWidth = 48
local fieldHeight = 17
local labelWidth = 48

local y = 2

local x_name = 6
local x_s    = x_name + nameWidth + spacing
local x_z    = x_s + sWidth + spacing
local x_dtk  = x_z + zWidth + spacing
local x_btn  = x_dtk + dtkWidth + spacing
local x_dtk_label = x_dtk + dtkWidth + spacing

local leg_ref = get(legData)

--function draw()
--    sasl.gl.drawFrame(0, 0, get(position)[3], get(position)[4], { 1,1,1,1 })
--end

function update()
    leg_ref = get(legData)
    if leg_ref == nil then
        set(visible, 0)
    else
        set(visible, 1)
    end
end

components = {
    editor_textfield {
        position = { x_name, y, nameWidth, fieldHeight },
        data = function() return leg_ref.NAME end,
        setData = function(v) leg_ref.NAME = v end,
        label = "NAME",
        type = "string",
        max_length = 16,
        color = {0.1, 0.2, 0.4, 1},
    },
    editor_textfield {
        position = { x_s, y, sWidth, fieldHeight },
        data = function() return leg_ref.S end,
        setData = function(v) leg_ref.S = v end,
        label = "S",
        type = "number",
        max_length = 6,
        color = {0.1, 0.5, 0.2, 1},
    },
    editor_textfield {
        position = { x_z, y, zWidth, fieldHeight },
        data = function() return leg_ref.Z end,
        setData = function(v) leg_ref.Z = v end,
        label = "Z",
        type = "number",
        max_length = 6,
        color = {0.2, 0.4, 0.2, 1},
    },
    editor_textfield {
        position = { x_dtk, y, dtkWidth, fieldHeight },
        data = function() return leg_ref.DTK end,
        setData = function(v) leg_ref.DTK = v end,
        label = "DTK",
        type = "number",
        max_length = 5,
        color = {0.4, 0.4, 0.2, 1},
    },
    editor_label {
        position = { x_dtk_label, y, labelWidth, fieldHeight },
        text = function()
            local dtk = leg_ref.DTK
            local degrees = math.floor(dtk)
            local minutes = (dtk - degrees) * 60
            return string.format("ЗПУ = %03d° %02d'", degrees, minutes)
        end,
        font_size = 24,
        font = avia_font,
        color = {0.4, 0.4, 0.2, 1},
    },
    
    --editor_button {
    --    position = { x_btn, y, btnWidth, fieldHeight },
    --    text = "DEL",
    --    color = {0.8, 0, 0, 1},
    --},
}


