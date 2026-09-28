--defineProperty("position", {0, 0, 100, 50})
defineProperty("text", "Button")
defineProperty("hover", 0)
defineProperty("pressed", 0)
defineProperty("color", {0.8, 0.8, 0.8, 1})
defineProperty("onMouseClick", nil)


function update()
    -- Nothing needed for now
end

function draw()
    local pos = get(position)
    local col = get(color)
    if get(hover) == 1 then
        sasl.gl.drawRectangle(0, 0, pos[3], pos[4], {col[1]*1.2, col[2]*1.2, col[3]*1.2, col[4]})
    else
        sasl.gl.drawRectangle(0, 0, pos[3], pos[4], col)
    end
    if get(pressed) == 1 then
        sasl.gl.drawRectangle(0, 0, pos[3], pos[4], {col[1]*1.5, col[2]*1.5, col[3]*1.5, col[4]})
    end
    sasl.gl.drawFrame(0, 0, pos[3], pos[4], {1,1,1,1})
    sasl.gl.drawText(avia_font, pos[3]/2, (pos[4]/2) - 4, get(text), 12, false, false, TEXT_ALIGN_CENTER, {1,1,1,1})
end

function onMouseMove(component, x, y, button)
    return true
end

function onMouseEnter()
    if get(hover) == 0 then set(hover, 1) end
end

function onMouseLeave()
    if get(hover) == 1 then set(hover, 0) end
end

function onMouseDown(component, x, y, button)
    if button == MB_LEFT then
        set(pressed, 1)
        if get(onMouseClick) ~= nil then
            get(onMouseClick)()
        end
    end
    return true
end

function onMouseUp(component, x, y, button)
    if button == MB_LEFT then
        set(pressed, 0)
    end
    return true
end

