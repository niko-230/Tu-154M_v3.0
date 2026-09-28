--defineProperty("position", { 0, 0, 600, 350 })

function draw()
    sasl.gl.drawRectangle(get(position)[1], get(position)[2], get(position)[3], get(position)[4], { 0,0,0,0.7 })
    sasl.gl.drawFrame(get(position)[1] + 5, get(position)[2] + 35, get(position)[3]-10, get(position)[4]-30 - 35, { 1,1,1,1 })
    sasl.gl.drawLine(get(position)[3]/1.5, get(position)[2] + 35, get(position)[3]/1.5, get(position)[4]-30, { 1,1,1,1 })
end