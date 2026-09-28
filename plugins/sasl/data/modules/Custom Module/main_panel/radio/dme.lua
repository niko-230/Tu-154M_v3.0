-- this is DME indicators
size = {215, 70}

-- DataRefs
defineProperty("frame_time", globalPropertyf("tu154b2/custom/time/frame_time")) -- flight time

defineProperty("vor_dme", globalPropertyf("tu154b2/custom/radio/vor_dme_1")) -- distance

defineProperty("sd75_on", globalPropertyi("tu154b2/custom/switchers/ovhd/sd75_1_on")) -- switch on

defineProperty("nav_mile_km", globalPropertyi("tu154b2/custom/switchers/nav_1_mile_km")) -- режим мили - км

-- lamps
defineProperty("dme_mile_lit", globalPropertyf("tu154b2/custom/lights/small/dme_mile_left")) -- mile lamp
defineProperty("dme_km_lit", globalPropertyf("tu154b2/custom/lights/small/dme_km_left")) -- km lamp

-- power
defineProperty("bus27_volt", globalPropertyf("tu154b2/custom/elec/bus27_volt_left"))
defineProperty("bus115_volt", globalPropertyf("tu154b2/custom/elec/bus115_1_volt"))

defineProperty("fail", globalPropertyi("sim/operation/failures/rel_dme")) -- fail
defineProperty("dme_fail", globalPropertyi("tu154b2/custom/failures/dme1_fail")) -- fail

local text_font = loadBitmapFont(moduleDirectory .. '/Custom Module/digital7_it.fnt')

local dist_text = "888.8"

local power = false

local dist_now = 0
local dist_show = 0

function update()
	
	power = get(sd75_on) == 1 and get(bus27_volt) > 13 and get(bus115_volt) and get(dme_fail) == 0
	
	local passed = get(frame_time)
	
	if power then
		local dist = get(vor_dme)
		
		dist_now = dist
		
	else	
		dist_now = 0
	
	end

	-- lamps
	local mode = get(nav_mile_km)
	
	if power then
		set(dme_mile_lit, bool2int(mode == 0))
		set(dme_km_lit, bool2int(mode == 1))
	else
		set(dme_mile_lit, 0)
		set(dme_km_lit, 0)
	end
	
	
	
	
	
	
	
end



