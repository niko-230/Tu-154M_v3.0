defineProperty("text", "")
defineProperty("font_size", 12)
defineProperty("color", {1,1,1,1})
defineProperty("font", 0)

function draw()
    sasl.gl.drawText(get(font), 0, 0, get(text), get(font_size), false, false, TEXT_ALIGN_LEFT, get(color))
end
