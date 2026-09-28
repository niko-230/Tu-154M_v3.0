-- Draws a 7-character digital frequency readout (e.g. "134.050"), same
-- character-by-character digital7.ttf technique already proven working in
-- radio_display.lua, packaged as a reusable component for an avionicsDevice.
-- Offsets scaled to match this device's real physical aspect ratio
-- (3.39:1, remeasured after the screen quad was resized) so nothing stretches.
--
-- Font size (40->80) and all x-offsets scaled 2x to match vhf2_display.lua's
-- reverted 2x canvas (220x65 -> 440x130) -- see that file for why the 4x
-- version was rolled back. Color {0.2,1,0.2,1} confirmed to exactly match
-- donor's own VHF color (vhf.lua line ~497).

defineProperty("freqHz", 0)
defineProperty("powered", function() return true end)
defineProperty("color", {0.2, 1, 0.2, 1})

font = loadFont("digital7.ttf")

local function split(str)
	if #str > 0 then return str:sub(1,1), split(str:sub(2)) end
end

function draw()
	local str
	if get(powered) then
		-- same formula already confirmed correct in vhf.lua: freq/1000 with 3 decimals
		str = string.format("%.3f", get(freqHz)/1000)
		while #str < 7 do str = str .. " " end
	else
		str = "       "
	end

	local chars = {split(str)}
	drawText(font, 30.0,  24, chars[1], 80, true, true, TEXT_ALIGN_LEFT, get(color))
	drawText(font, 89.0,  24, chars[2], 80, true, true, TEXT_ALIGN_LEFT, get(color))
	drawText(font, 148.0, 24, chars[3], 80, true, true, TEXT_ALIGN_LEFT, get(color))
	drawText(font, 197.0, 24, chars[4], 80, true, true, TEXT_ALIGN_LEFT, get(color))
	drawText(font, 218.8, 24, chars[5], 80, true, true, TEXT_ALIGN_LEFT, get(color))
	drawText(font, 287.8, 24, chars[6], 80, true, true, TEXT_ALIGN_LEFT, get(color))
	drawText(font, 356.8, 24, chars[7], 80, true, true, TEXT_ALIGN_LEFT, get(color))
end
