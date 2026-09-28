
defineProperty("R")
defineProperty("G")
defineProperty("B")
defineProperty("A")
defineProperty("position_x")
defineProperty("position_y")
defineProperty("rad_1")
defineProperty("rad_2")
defineProperty("a_1")
defineProperty("a_2")
function draw(self)
    --drawRectangle(get(position_x), get(position_y), get(position)[3], get(position)[4], get(R), get(G), get(B), get(A))
	drawArc ( get(position_x) ,  get(position_y) , get(rad_1) , get(rad_2) , get(a_1) , get(a_2) , get(R), get(G), get(B), get(A) )

end

