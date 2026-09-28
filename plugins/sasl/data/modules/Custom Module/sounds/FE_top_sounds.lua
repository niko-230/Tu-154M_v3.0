defineProperty("rt_1", globalPropertyi("sim/custom/b2/rt12_1_dis"))
defineProperty("rt_2", globalPropertyi("sim/custom/b2/rt12_2_dis"))
defineProperty("rt_3", globalPropertyi("sim/custom/b2/rt12_3_dis"))
defineProperty("rt_cap_1", globalPropertyi("sim/custom/b2/rt12_1_dis_cap"))
defineProperty("rt_cap_2", globalPropertyi("sim/custom/b2/rt12_2_dis_cap"))
defineProperty("rt_cap_3", globalPropertyi("sim/custom/b2/rt12_3_dis_cap"))
defineProperty("ard", globalPropertyi("tu154b2/custom/switchers/eng/tail_temp_heat"))

defineProperty("ssos_1", globalPropertyi("sim/custom/ssos_test_btn1"))
defineProperty("ssos_2", globalPropertyi("sim/custom/ssos_test_btn2"))
defineProperty("ssos_3", globalPropertyi("sim/custom/ssos_test_btn3"))

defineProperty("rt_test_1", globalPropertyi("sim/custom/b2/stp_test_1"))
defineProperty("rt_test_2", globalPropertyi("sim/custom/b2/stp_test_2"))
defineProperty("rt_test_3", globalPropertyi("sim/custom/b2/stp_test_3"))

defineProperty("stp_test_1", globalPropertyi("sim/custom/b2/stp_test_4"))
defineProperty("stp_test_2", globalPropertyi("sim/custom/b2/stp_test_5"))
defineProperty("stp_test_3", globalPropertyi("sim/custom/b2/stp_test_6"))

defineProperty("test_cover", globalPropertyi("sim/custom/b2/stp_test_cap"))

defineProperty("gear_fan", globalPropertyi("tu154b2/custom/switchers/eng/gear_fan"))

defineProperty("gear_test", globalPropertyi("tu154b2/custom/buttons/lamp_test_upper_gear"))

defineProperty("sbros_1", globalPropertyi("sim/custom/b2/sbros_push"))
defineProperty("sbros_2", globalPropertyi("sim/custom/b2/sbros_stop"))

defineProperty("temp_1", globalPropertyi("tu154b2/custom/buttons/eng/tail_temp_signal_control_1"))
defineProperty("temp_2", globalPropertyi("tu154b2/custom/buttons/eng/tail_temp_signal_control_2"))

defineProperty("srd_buzz", globalPropertyi("tu154b2/custom/buttons/eng/srd_buzzer_test"))

defineProperty("fuel_buzz", globalPropertyi("tu154b2/custom/switchers/eng/fuel_buzzer"))
defineProperty("fuel_cap", globalPropertyi("tu154b2/custom/switchers/eng/fuel_buzzer_cap"))

defineProperty("lamp", globalPropertyi("sim/custom/eng_light_angle_btn"))
defineProperty("lamp_2", globalPropertyi("sim/custom/eng_light_angle2"))

defineProperty("pilot_Z", globalPropertyf("sim/aircraft/view/acf_peZ"))
defineProperty("pilot_X", globalPropertyf("sim/aircraft/view/acf_peX"))
defineProperty("pilot_head", globalPropertyi("sim/graphics/view/pilots_head_psi"))


local switcher_sound_L = loadSample(moduleDirectory .. '/Custom Sounds/metal_switch_L.wav')
local switcher_sound_2_L= loadSample(moduleDirectory .. '/Custom Sounds/metal_switch2_L.wav')
local cap_sound_L = loadSample(moduleDirectory .. '/Custom Sounds/cap_L.wav')
local button_sound_L = loadSample(moduleDirectory .. '/Custom Sounds/plastic_btn_L.wav')
local lamp_sound_L = loadSample(moduleDirectory .. '/Custom Sounds/new_snds/lustra_L.wav')
local skrip_sound_L = loadSample(moduleDirectory .. '/Custom Sounds/new_snds/lustra_skrip_L.wav')

local switcher_sound_R = loadSample(moduleDirectory .. '/Custom Sounds/metal_switch_R.wav')
local switcher_sound_2_R= loadSample(moduleDirectory .. '/Custom Sounds/metal_switch2_R.wav')
local cap_sound_R = loadSample(moduleDirectory .. '/Custom Sounds/cap_R.wav')
local button_sound_R = loadSample(moduleDirectory .. '/Custom Sounds/plastic_btn_R.wav')
local lamp_sound_R = loadSample(moduleDirectory .. '/Custom Sounds/new_snds/lustra_R.wav')
local skrip_sound_R = loadSample(moduleDirectory .. '/Custom Sounds/new_snds/lustra_skrip_R.wav')

local panel_x=0.5363198
local panel_z=-20.964985
local panel2_x=0.52685744
local panel2_z=-21.232027
local dist_gain=5


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


local changes_sw_prev =0
local changes_sw2_prev =0
local changes_but_prev =0
local changes_cap_prev =0
local changes_cap2_prev=0
local changes_lamp_prev=0
function update()

	local changes_sw  = get(rt_1)+get(rt_2)+get(rt_3)+get(ard)+get(gear_fan)+get(fuel_buzz)
	local changes_sw2 = get(rt_test_1)+get(rt_test_2)+get(rt_test_3)+get(stp_test_1)+get(stp_test_2)+get(stp_test_3)
	local changes_but = get(temp_1)+get(temp_2)+get(ssos_1)+get(ssos_2)+get(ssos_3)+get(srd_buzz)+get(gear_test)+get(sbros_1)+get(sbros_2)
	local changes_cap = get(rt_cap_1)+get(rt_cap_2)+get(rt_cap_3)+get(fuel_cap)
	local changes_cap2= get(test_cover)
	local changes_lamp=get(lamp_2)

	if changes_sw ~= changes_sw_prev then 		
		local z_pos=get(pilot_Z)
		local z_pos=get(pilot_Z)
		local x_pos=get(pilot_X)
		local plt_hdg=get(pilot_head)
		local gain_L, gain_R = inn_balance (panel_x, panel_z, x_pos, z_pos , plt_hdg)
		gain_L=gain_L*1000
		gain_R=gain_R*1000
		local dist=1
		if z_pos-panel_z~=0 then
			dist=math.min(1,1/math.sqrt(math.pow(z_pos-panel_z,2)+math.pow(x_pos-panel_x,2))/dist_gain)
		end
		setSampleGain(switcher_sound_L,gain_L*dist)
		setSampleGain(switcher_sound_R,gain_R*dist)
		playSample(switcher_sound_L, false)
		playSample(switcher_sound_R, false)
	end
	if changes_sw2 ~= changes_sw2_prev then 		
		local z_pos=get(pilot_Z)
		local z_pos=get(pilot_Z)
		local x_pos=get(pilot_X)
		local plt_hdg=get(pilot_head)
		local gain_L, gain_R = inn_balance (panel_x, panel_z, x_pos, z_pos , plt_hdg)
		gain_L=gain_L*1000
		gain_R=gain_R*1000
		local dist=1
		if z_pos-panel_z~=0 then
			dist=math.min(1,1/math.sqrt(math.pow(z_pos-panel_z,2)+math.pow(x_pos-panel_x,2))/dist_gain)
		end
		setSampleGain(switcher_sound_2_L,gain_L*dist)
		setSampleGain(switcher_sound_2_R,gain_R*dist)
		playSample(switcher_sound_2_L, false)
		playSample(switcher_sound_2_R, false)
	end
	
	if changes_but_prev~=changes_but then 		
		local z_pos=get(pilot_Z)
		local z_pos=get(pilot_Z)
		local x_pos=get(pilot_X)
		local plt_hdg=get(pilot_head)
		local gain_L, gain_R = inn_balance (panel_x, panel_z, x_pos, z_pos , plt_hdg)
		gain_L=gain_L*1000
		gain_R=gain_R*1000
		local dist=1
		if z_pos-panel_z~=0 then
			dist=math.min(1,1/math.sqrt(math.pow(z_pos-panel_z,2)+math.pow(x_pos-panel_x,2))/dist_gain)
		end
		setSampleGain(button_sound_L,gain_L*dist)
		setSampleGain(button_sound_R,gain_R*dist)
		playSample(button_sound_L, false)
		playSample(button_sound_R, false)
	end
	
	if changes_cap_prev~=changes_cap  then 		
		local z_pos=get(pilot_Z)
		local z_pos=get(pilot_Z)
		local x_pos=get(pilot_X)
		local plt_hdg=get(pilot_head)
		local gain_L, gain_R = inn_balance (panel_x, panel_z, x_pos, z_pos , plt_hdg)
		gain_L=gain_L*1000
		gain_R=gain_R*1000
		local dist=1
		if z_pos-panel_z~=0 then
			dist=math.min(1,1/math.sqrt(math.pow(z_pos-panel_z,2)+math.pow(x_pos-panel_x,2))/dist_gain)
		end
		setSampleGain(cap_sound_L,gain_L*dist)
		setSampleGain(cap_sound_R,gain_R*dist)
		playSample(cap_sound_L, false)
		playSample(cap_sound_R, false)
	end
	
	if changes_cap2_prev~=changes_cap2 then 		
		local z_pos=get(pilot_Z)
		local z_pos=get(pilot_Z)
		local x_pos=get(pilot_X)
		local plt_hdg=get(pilot_head)
		local gain_L, gain_R = inn_balance (panel_x, panel_z, x_pos, z_pos , plt_hdg)
		gain_L=gain_L*700
		gain_R=gain_R*700
		local dist=1
		if z_pos-panel_z~=0 then
			dist=math.min(1,1/math.sqrt(math.pow(z_pos-panel_z,2)+math.pow(x_pos-panel_x,2))/dist_gain)
		end
		setSampleGain(skrip_sound_L,gain_L*dist)
		setSampleGain(skrip_sound_R,gain_R*dist)
		playSample(skrip_sound_L, false)
		playSample(skrip_sound_R, false)
	end
	
	if changes_lamp_prev~=changes_lamp then 		
		local z_pos=get(pilot_Z)
		local z_pos=get(pilot_Z)
		local x_pos=get(pilot_X)
		local plt_hdg=get(pilot_head)
		local gain_L, gain_R = inn_balance (panel2_x, panel2_z, x_pos, z_pos , plt_hdg)
		gain_L=gain_L*700
		gain_R=gain_R*700
		local dist=1
		if z_pos-panel2_z~=0 then
			dist=math.min(1,1/math.sqrt(math.pow(z_pos-panel2_z,2)+math.pow(x_pos-panel2_x,2))/dist_gain)
		end
		setSampleGain(skrip_sound_L,gain_L*dist)
		setSampleGain(skrip_sound_R,gain_R*dist)
		playSample(skrip_sound_L, false)
		playSample(skrip_sound_R, false)
	end

	if get(lamp)>0 then
		local z_pos=get(pilot_Z)
		local z_pos=get(pilot_Z)
		local x_pos=get(pilot_X)
		local plt_hdg=get(pilot_head)
		local gain_L, gain_R = inn_balance (panel2_x, panel2_z, x_pos, z_pos , plt_hdg)
		gain_L=gain_L*700
		gain_R=gain_R*700
		local dist=1
		if z_pos-panel2_z~=0 then
			dist=math.min(1,1/math.sqrt(math.pow(z_pos-panel2_z,2)+math.pow(x_pos-panel2_x,2))/dist_gain)
		end
		setSampleGain(lamp_sound_L,gain_L*dist)
		setSampleGain(lamp_sound_R,gain_R*dist)
		if not isSamplePlaying(lamp_sound_L) then
			playSample(lamp_sound_L, false)
			playSample(lamp_sound_R, false)
		end
	end

	changes_sw_prev  =changes_sw  
	changes_sw2_prev =changes_sw2 
	changes_but_prev =changes_but 
	changes_cap_prev =changes_cap 
	changes_cap2_prev=changes_cap2
	changes_lamp_prev=changes_lamp

end