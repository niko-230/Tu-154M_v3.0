-- this is cockpit ventilator angle calculations

-- define property table

defineProperty("vent_1", globalPropertyf("tu154b2/custom/anim/cockpit_vent_1"))
defineProperty("vent_2", globalPropertyf("tu154b2/custom/anim/cockpit_vent_2"))
defineProperty("vent_3", globalPropertyf("tu154b2/custom/anim/cockpit_vent_3"))

--[[
tu154b2/custom/anim/cockpit_vent_1
tu154b2/custom/anim/cockpit_vent_2
tu154b2/custom/anim/cockpit_vent_3

--]]

defineProperty("vent_1_sw", globalPropertyi("tu154b2/custom/switchers/ovhd/vent_1"))
defineProperty("vent_2_sw", globalPropertyi("tu154b2/custom/switchers/ovhd/vent_2"))
defineProperty("vent_3_sw", globalPropertyi("tu154b2/custom/switchers/ovhd/vent_3"))

--[[
tu154b2/custom/switchers/ovhd/vent_1
tu154b2/custom/switchers/ovhd/vent_2
tu154b2/custom/switchers/ovhd/vent_3

--]]

defineProperty("bus27_volt_left", globalPropertyf("tu154b2/custom/elec/bus27_volt_left"))
defineProperty("bus27_volt_right", globalPropertyf("tu154b2/custom/elec/bus27_volt_right")) 

defineProperty("frame_time", globalPropertyf("tu154b2/custom/time/frame_time")) -- flight time
defineProperty("cam_in_cockpit", globalPropertyi("sim/graphics/view/view_is_external"))

defineProperty("fan_volume_ratio", globalPropertyf("sim/operation/sound/fan_volume_ratio")) -- 


defineProperty("pilot_Z", globalPropertyf("sim/aircraft/view/acf_peZ"))
defineProperty("pilot_X", globalPropertyf("sim/aircraft/view/acf_peX"))
defineProperty("pilot_head", globalPropertyi("sim/graphics/view/pilots_head_psi"))


local panel1_x=-0.36178827
local panel1_z=-22.697947
local panel2_x=0.33701444
local panel2_z=-22.71383
local panel3_x=0.51166266
local panel3_z=-21.625364
local dist_gain=20

local vent1_sound_L = loadSample(moduleDirectory .. '/Custom Sounds/cockpit_fan_L.wav')
local vent1_sound_R = loadSample(moduleDirectory .. '/Custom Sounds/cockpit_fan_R.wav')
local vent2_sound_L = loadSample(moduleDirectory .. '/Custom Sounds/cockpit_fan_L.wav')
local vent2_sound_R = loadSample(moduleDirectory .. '/Custom Sounds/cockpit_fan_R.wav')
local vent3_sound_L = loadSample(moduleDirectory .. '/Custom Sounds/cockpit_fan_L.wav')
local vent3_sound_R = loadSample(moduleDirectory .. '/Custom Sounds/cockpit_fan_R.wav')

playSample(vent1_sound_L, true) -- fan sound
playSample(vent2_sound_L, true) -- fan sound
playSample(vent3_sound_L, true) -- fan sound
setSampleGain(vent1_sound_L, 0)
setSampleGain(vent2_sound_L, 0)
setSampleGain(vent3_sound_L, 0)
playSample(vent1_sound_R, true)
playSample(vent2_sound_R, true)
playSample(vent3_sound_R, true)
setSampleGain(vent1_sound_R, 0)
setSampleGain(vent2_sound_R, 0)
setSampleGain(vent3_sound_R, 0)


local function inn_balance (src_x, src_z, x, z , cam_hdg)

	local hdg_rad = math.rad(cam_hdg)
	-- local x_s = acf_x + src_x * math.cos(hdg_rad) - src_z * math.sin(hdg_rad)
	-- local z_s = acf_z + src_x * math.sin(hdg_rad) + src_z * math.cos(hdg_rad)
	local dist = math.sqrt(math.pow(src_x - x, 2) + math.pow(src_z - z, 2))
	
	if dist < 1 then dist = 1 end
	
	local angle2source = cam_hdg + math.deg(math.atan2(x - src_x, z - src_z)) -- angle from camera to the source
	while angle2source > 180 do angle2source = angle2source - 360 end
	while angle2source < -180 do angle2source = angle2source + 360 end
	local ch_L = (0.2/math.pow(dist,2) + (1 + math.sin(math.rad(angle2source))) ) 
	local ch_R = (0.2/math.pow(dist,2) + (1 + math.sin(math.rad(-angle2source))) )
	if ch_L > 1 then ch_L = 1 end
	if ch_R > 1 then ch_R = 1 end

	
	-- local ch_L = 0.4 + (1 + math.sin(math.rad(cam_hdg))) * 0.7 * 0.6 + (1 - dist / 20)	
	
	-- local ch_R = 0.4 + (1 + math.sin(math.rad(-cam_hdg))) * 0.7 * 0.6 + (1 - dist / 20)
	
	return ch_L, ch_R
end

local vent1_spd = 0
local vent2_spd = 0
local vent3_spd = 0

local UP_SPD = 500
local DN_SPD = 100
local MAX_SPD = 1500  -- deg per second

function update()
	local passed = get(frame_time)
	local power = get(bus27_volt_left) > 13 or get(bus27_volt_right) > 13
	
	-- vent 1
	if power and get(vent_1_sw) == 1 then vent1_spd = vent1_spd + UP_SPD * passed
	else vent1_spd = vent1_spd - DN_SPD * passed end
	
	if vent1_spd > MAX_SPD then vent1_spd = MAX_SPD
	elseif vent1_spd < 0 then vent1_spd = 0 end
	
	local vent_1_deg = get(vent_1) + vent1_spd * passed
	
	while vent_1_deg > 360 do vent_1_deg = vent_1_deg - 360 end
	
	set(vent_1, vent_1_deg)
	---------

	-- vent 2
	if power and get(vent_2_sw) == 1 then vent2_spd = vent2_spd + UP_SPD * passed
	else vent2_spd = vent2_spd - DN_SPD * passed end
	
	if vent2_spd > MAX_SPD then vent2_spd = MAX_SPD
	elseif vent2_spd < 0 then vent2_spd = 0 end
	
	local vent_2_deg = get(vent_2) + vent2_spd * passed
	while vent_2_deg > 360 do vent_2_deg = vent_2_deg - 360 end
	set(vent_2, vent_2_deg)
	---------	
	
	-- vent 3
	if power and get(vent_3_sw) == 1 then vent3_spd = vent3_spd + UP_SPD * passed
	else vent3_spd = vent3_spd - DN_SPD * passed end
	
	if vent3_spd > MAX_SPD then vent3_spd = MAX_SPD
	elseif vent3_spd < 0 then vent3_spd = 0 end
	
	local vent_3_deg = get(vent_3) + vent3_spd * passed
	while vent_3_deg > 360 do vent_3_deg = vent_3_deg - 360 end
	set(vent_3, vent_3_deg)
	---------


	
	
	-- vent loudness
	local inside = get(cam_in_cockpit) == 0
	
	local vol = get(fan_volume_ratio)
	
	local z_pos=get(pilot_Z)
	local x_pos=get(pilot_X)
	local plt_hdg=get(pilot_head)
	local gain1_L, gain1_R = inn_balance (panel1_x, panel1_z, x_pos, z_pos , plt_hdg)
	local dist1=1
	if z_pos-panel1_z~=0 then
		dist1=math.min(1,1/math.sqrt(math.pow(z_pos-panel1_z,2)+math.pow(x_pos-panel1_x,2))/dist_gain)
	end
	local gain2_L, gain2_R = inn_balance (panel2_x, panel2_z, x_pos, z_pos , plt_hdg)
	local dist2=1
	if z_pos-panel2_z~=0 then
		dist2=math.min(1,1/math.sqrt(math.pow(z_pos-panel2_z,2)+math.pow(x_pos-panel2_x,2))/dist_gain)
	end
	local gain3_L, gain3_R = inn_balance (panel3_x, panel3_z, x_pos, z_pos , plt_hdg)
	local dist3=1
	if z_pos-panel3_z~=0 then
		dist3=math.min(1,1/math.sqrt(math.pow(z_pos-panel3_z,2)+math.pow(x_pos-panel3_x,2))/dist_gain)
	end
	
	if inside then setSampleGain(vent1_sound_L, math.min(vent1_spd * 10*gain1_L*dist1, 1000) * vol*0.7) else setSampleGain(vent1_sound_L, 0) end
	if inside then setSampleGain(vent2_sound_L, math.min(vent2_spd * 10*gain2_L*dist2, 1000) * vol*0.7) else setSampleGain(vent2_sound_L, 0) end
	if inside then setSampleGain(vent3_sound_L, math.min(vent3_spd * 10*gain3_L*dist3, 1000) * vol*0.7) else setSampleGain(vent3_sound_L, 0) end
	
	if inside then setSampleGain(vent1_sound_R, math.min(vent1_spd * 10*gain1_R*dist1, 1000) * vol*0.7) else setSampleGain(vent1_sound_R, 0) end
	if inside then setSampleGain(vent2_sound_R, math.min(vent2_spd * 10*gain1_R*dist2, 1000) * vol*0.7) else setSampleGain(vent2_sound_R, 0) end
	if inside then setSampleGain(vent3_sound_R, math.min(vent3_spd * 10*gain1_R*dist3, 1000) * vol*0.7) else setSampleGain(vent3_sound_R, 0) end
	
	setSamplePitch(vent1_sound_L, vent1_spd * vol)
	setSamplePitch(vent2_sound_L, vent2_spd * vol)
	setSamplePitch(vent3_sound_L, vent3_spd * vol)
	
	setSamplePitch(vent1_sound_R, vent1_spd * vol)
	setSamplePitch(vent2_sound_R, vent2_spd * vol)
	setSamplePitch(vent3_sound_R, vent3_spd * vol)

end


