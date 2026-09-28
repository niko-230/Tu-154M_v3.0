-- Draws one red ILS/NAV frequency readout, e.g. "108.450"
-- (3 decimal digits, matching this project's own course_mp.lua house style)
--
-- Black background fill first for contrast, then each character is drawn
-- separately, spaced by charSpacing, and the whole block is centered on
-- the 310px-wide screen. Blank (background only) when unpowered.

defineProperty("freqHz", 0)
defineProperty("powered", true)

font = loadFont("digital7.ttf")

local function split(str)
	if #str > 0 then return str:sub(1,1), split(str:sub(2)) end
end

-- Tune these two to taste:
local fontSize = 62
local charSpacing = 38  -- distance between each character's start position

function draw()
	drawRectangle(0, 0, size[1], size[2], 0, 0, 0, 1)  -- black background

	local isPowered
	if type(get(powered)) == "function" then
		isPowered = get(powered)()
	else
		isPowered = get(powered)
	end

	if not isPowered then
		return  -- screen stays fully blank (off), like the real unit with no power
	end

	local hz = get(freqHz)
	local mhz = math.floor(hz / 100)
	local khz_2digit = math.floor(hz - mhz * 100)
	local khz_3digit = khz_2digit * 10
	local text = string.format("%d.%03d", mhz, khz_3digit)

	local chars = {split(text)}
	local totalWidth = (#chars - 1) * charSpacing
	local startX = (310 - totalWidth) / 2

	for i, c in ipairs(chars) do
		drawText(font, startX + (i - 1) * charSpacing, 8, c, fontSize, true, false, TEXT_ALIGN_CENTER, {1, 0, 0, 1})
	end
end
