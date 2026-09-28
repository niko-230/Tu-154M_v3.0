-- this is TCAS main screen
size = {200, 200}

defineProperty("text")
defineProperty("font")
-- defineProperty("alt")
-- defineProperty("mode")
--defineProperty("brt")


function draw()
	local f = get(font)
	drawText(f, 10, 154, get(text), 15, true, false, TEXT_ALIGN_LEFT,0.2,0.8,0.86,1)

end