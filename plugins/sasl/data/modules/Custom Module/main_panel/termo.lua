-- termometers
-- sources
defineProperty("thermo", globalPropertyf("sim/cockpit2/temperature/outside_air_LE_temp_degc")) -- outside temperature

defineProperty("bus27_volt_left", globalPropertyf("tu154b2/custom/elec/bus27_volt_left")) -- напряжение сети 27
defineProperty("bus27_volt_right", globalPropertyf("tu154b2/custom/elec/bus27_volt_right")) -- напряжение сети 27
-- time
defineProperty("frame_time", globalPropertyf("tu154b2/custom/time/frame_time")) -- flight time


-- results
defineProperty("thermo_outside", globalPropertyf("tu154b2/custom/gauges/misc/thermo_outside")) -- термометр наружного воздуха

local tme=0
local tme_lk=0
local termENG_act = -55
local power27_R_prev=0
function update()
	if get(bus27_volt_right)-power27_R_prev>12 then -- jitter from power switch
		tme=0
		tme_lk=0
	end
	power27_R_prev=get(bus27_volt_right)

	local passed = get(frame_time)
	local therm = -55
	if get(bus27_volt_right) > 13 then
		therm = get(thermo)
	end
	-- set limits
	if therm > 115 then therm = 115
	elseif therm < -55 then therm = -55 end
	--- needle jitter
	if tme<4 then
		tme=tme+passed*tme_lk
	end
	if math.abs(therm - termENG_act)<5 then
		tme_lk=1
	end
	local needle_jit=math.cos(10.5*tme)*math.exp(-4.8*tme)
	therm=therm+10*needle_jit
	termENG_act = termENG_act + (therm - termENG_act) * passed * 5
	
	
	
	set(thermo_outside, termENG_act)
	
	
end
