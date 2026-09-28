defineProperty("view", globalPropertyf("sim/graphics/view/pilots_head_y"))
defineProperty("db1", globalPropertyf("tu154b2/custom/controlls/debug1"))
defineProperty("db2", globalPropertyf("tu154b2/custom/controlls/debug2"))
defineProperty("db3", globalPropertyf("tu154b2/custom/controlls/debug3"))
defineProperty("db4", globalPropertyf("tu154b2/custom/controlls/debug4"))
defineProperty("frame_time", globalPropertyf("tu154b2/custom/time/frame_time"))
defineProperty("gs", globalProperty("sim/flightmodel2/position/groundspeed"))
defineProperty("gear1", globalProperty("sim/flightmodel2/gear/tire_vertical_deflection_mtr[0]"))
defineProperty("gear2", globalProperty("sim/flightmodel2/gear/tire_vertical_deflection_mtr[1]"))
defineProperty("gear3", globalProperty("sim/flightmodel2/gear/tire_vertical_deflection_mtr[2]"))
defineProperty("pave", globalPropertyi("sim/flightmodel/ground/surface_texture_type"))
defineProperty("external_view", globalPropertyi("sim/graphics/view/view_is_external")) -- enviroment
defineProperty("vr_outside", globalPropertyi("sim/graphics/VR/teleport_on_ground"))
defineProperty("shake_on", globalPropertyi("sim/custom/t154cfg/brake_heat"))

local tme=0
local tme_2=0
local shk=0
local shk_prev=0
local offst=0
local count=0
local dn = sasl.findCommand ( "sim/general/down_slow" )
local up = sasl.findCommand ( "sim/general/up_slow" )
local shk_speed = {
{-100000, 12},
{0, 12},
{100, 12},
{150, 5},
{250, 5.5},
{8000000, 5.5}
}
local shk_freq = {
{-10000, 1},
{60,0.8},
-- {120, 0.45},
-- {150, 0.35},
{163, 0.2},
{8000, 0.2}
}
--local shk=1
function update()
	local external = 0
	if get(external_view) > 0 or get(vr_outside)==1 then
	   external = 1
    end
	local passed = get(frame_time)
	local speed=get(gs)*3.6
	local def_1=get(gear1)
	local def_2=get(gear2)
	local def_3=get(gear3)
	local asph=get(pave)==3
	if ((speed>60 and (def_1>0.02 or def_2+def_3>0.05)) or count~=0) and external==0 and get(shake_on)>0 then
		tme_2=tme_2+passed
		local rand_1=math.min(0.005556*speed+0.1667,1)
		local rand_2=math.max(-0.005556*speed+1.833,1)
		local shk=interpolate(shk_freq,speed)*math.random(rand_1,rand_2)-- shake occurance frequency, i.e. how often is the shake triggered
		local freq=1+bool2int(asph)*2 --increase the shake frequency with nosewheel off the ground or rolling on ashpalt, this make the shake look less violent
		if def_1<0.02 then
			freq=math.min(freq*2,3) 
		end
		if tme_2>shk*2/freq then
			tme_2=0
			tme=0
		end
		local w=interpolate(shk_speed,speed)*10*freq -- shake frequency
		w=math.min(w,18*10)
		-- shk_prev=shk
		if tme<3*2*math.pi/w then -- running the sine for 2*pi time the frequency--> hitting one bump
			tme=tme+passed
			offst=math.sin(w*tme)
			if tme>3*2*math.pi/w then
				tme=3*2*math.pi/w
				offst=0
			end
		end

		if offst>0 then
			count=count+1
			sasl.commandOnce (dn)
		elseif count>0 then --offst<0 and tme~=3*2*math.pi/w then
			sasl.commandOnce (up)
			count=count-1
		elseif offst==0 and count>0 then
			sasl.commandOnce (up)
			count=count-1
		elseif offst==0 and count<0 then
			sasl.commandOnce (dn)
			count=count+1
		end
	else
		tme_2=0
		tme=0
		count=0
		offst=0
	end
	-- set(db3,offst)
	-- set(db4,count)
end