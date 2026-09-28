-- Draws red DME distance, e.g. "23.4" ("---.-" if no valid signal, blank if unpowered)
-- Converts NM->KM using the same factor and switch as course_mp.lua
-- (tu154b2/custom/switchers/nav_1/2_mile_km, 1 = km, matching B/M donor).
-- Power gated on the real Kurs-MP unit's own power condition (curs_np_on_1/2 + buses).

defineProperty("distNm", 0)
defineProperty("mileKm", 1)
defineProperty("powered", true)

font = loadFont("digital7.ttf")

-- "No data" display: "---.-" in the fixed digit cells of an XXX.X readout.
-- The real unit is a digits-only display: it has 4 digit cells + 1 decimal-point
-- cell spread across the whole screen, so each dash sits in its own digit cell
-- and the point sits in the point cell. Same font, size, height and colour as the
-- digits. Each character is centred in its cell (TEXT_ALIGN_CENTER), so no text
-- measuring is needed. Fixed pixel layout for the 215 px wide device:
--   [ digit ][ digit ][ digit ][.][ digit ]
local DASH_MARGIN = 4            -- px free at each screen edge
local POINT_CELL = 16            -- px width of the decimal-point cell
local DIGIT_CELL = (215 - 2 * DASH_MARGIN - POINT_CELL) / 4
local DASH_CELLS = {
	{ "-", DASH_MARGIN + DIGIT_CELL * 0.5 },
	{ "-", DASH_MARGIN + DIGIT_CELL * 1.5 },
	{ "-", DASH_MARGIN + DIGIT_CELL * 2.5 },
	{ ".", DASH_MARGIN + DIGIT_CELL * 3 + POINT_CELL * 0.5 },
	{ "-", DASH_MARGIN + DIGIT_CELL * 3.5 + POINT_CELL },
}

local function drawDashes()
	for _, cell in ipairs(DASH_CELLS) do
		drawText(font, cell[2], 10, cell[1], 62, true, false, TEXT_ALIGN_CENTER, {1, 0, 0, 1})
	end
end

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

	local dist = get(distNm)
	if get(mileKm) == 1 then
		dist = dist * 1.852  -- nm -> km, same factor as course_mp.lua
	end

	if dist <= 0 then
		drawDashes()
		return
	end

	local text = string.format("%.1f", dist)
	drawText(font, 90, 10, text, 62, true, false, TEXT_ALIGN_LEFT, {1, 0, 0, 1})
end
