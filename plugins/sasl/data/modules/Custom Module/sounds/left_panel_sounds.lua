defineProperty("wiper", globalPropertyf("tu154b2/custom/switchers/wiper_left"))
defineProperty("sgu", globalPropertyf("sim/custom/other/sgu"))

defineProperty("transponder_mode", globalPropertyi("tu154b2/custom/switchers/ovhd/transponder_mode"))
defineProperty("transponder_control", globalPropertyi("tu154b2/custom/buttons/ovhd/transponder_control"))
defineProperty("transponder_sign", globalPropertyi("tu154b2/custom/buttons/ovhd/transponder_sign"))
defineProperty("transponder_but_1", globalPropertyi("tu154b2/custom/buttons/ovhd/transponder_but_1"))
defineProperty("transponder_but_2", globalPropertyi("tu154b2/custom/buttons/ovhd/transponder_but_2"))
defineProperty("transponder_but_3", globalPropertyi("tu154b2/custom/buttons/ovhd/transponder_but_3"))
defineProperty("transponder_but_4", globalPropertyi("tu154b2/custom/buttons/ovhd/transponder_but_4"))
defineProperty("transponder_emerg", globalPropertyi("tu154b2/custom/buttons/ovhd/transponder_emerg"))

defineProperty("co70_mode", globalPropertyi("sim/custom/co70_mode"))
defineProperty("co70_pwr", globalPropertyi("sim/custom/co70_pwr"))
defineProperty("co70_sign", globalPropertyi("sim/custom/co70_sign"))
defineProperty("co70_control", globalPropertyi("sim/custom/co70_control"))
defineProperty("co70_mch", globalPropertyi("sim/custom/co70_mch"))
defineProperty("co70_sqwk_1", globalPropertyi("sim/custom/co70_sqwk_1"))
defineProperty("co70_sqwk_2", globalPropertyi("sim/custom/co70_sqwk_2"))
defineProperty("co70_sqwk_3", globalPropertyi("sim/custom/co70_sqwk_3"))
defineProperty("co70_sqwk_4", globalPropertyi("sim/custom/co70_sqwk_4"))
defineProperty("co70_sel", globalPropertyi("sim/custom/co70_sel"))

defineProperty("co63_mode2", globalPropertyi("sim/custom/co63_mode2"))
defineProperty("co63_mch", globalPropertyi("sim/custom/co63_mch"))
defineProperty("co63_sqwk_1", globalPropertyi("sim/custom/co63_sqwk_1"))
defineProperty("co63_sqwk_2", globalPropertyi("sim/custom/co63_sqwk_2"))
defineProperty("co63_sqwk_3", globalPropertyi("sim/custom/co63_sqwk_3"))
defineProperty("co63_sqwk_4", globalPropertyi("sim/custom/co63_sqwk_4"))
defineProperty("co63_mode", globalPropertyi("sim/custom/co63_mode"))
defineProperty("co63_pwr", globalPropertyi("sim/custom/co63_pwr"))
defineProperty("co63_sign", globalPropertyi("sim/custom/co63_sign"))
defineProperty("co63_control", globalPropertyi("sim/custom/co63_control"))
defineProperty("co63_emerg", globalPropertyi("sim/custom/co63_emerg"))


defineProperty("spu", globalPropertyf("tu154b2/custom/switchers/spu_1_source"))
defineProperty("pedal", globalPropertyf("sim/custom/other/pedal_left_sw"))
defineProperty("bp_1", globalPropertyf("sim/custom/vyzov_bp_button1"))
defineProperty("bp_2", globalPropertyf("sim/custom/vyzov_bp_button2"))
defineProperty("siv", globalPropertyf("sim/custom/misc/siv1"))
defineProperty("vhf2", globalPropertyf("sim/custom/radios/vhf2_3_switch"))

defineProperty("pilot_Z", globalPropertyf("sim/aircraft/view/acf_peZ"))
defineProperty("pilot_X", globalPropertyf("sim/aircraft/view/acf_peX"))
defineProperty("pilot_head", globalPropertyi("sim/graphics/view/pilots_head_psi"))

local rotary_sound_L = loadSample(moduleDirectory .. '/Custom Sounds/plastic_switch_L.wav')
local rotary_sound_2_L = loadSample(moduleDirectory .. '/Custom Sounds/rot_click_L.wav')
local switcher_sound_L = loadSample(moduleDirectory .. '/Custom Sounds/metal_switch_L.wav')
local switcher_sound_2_L= loadSample(moduleDirectory .. '/Custom Sounds/metal_switch2_L.wav')
local button_sound_L = loadSample(moduleDirectory .. '/Custom Sounds/plastic_btn_L.wav')

local rotary_sound_R = loadSample(moduleDirectory .. '/Custom Sounds/plastic_switch_R.wav')
local rotary_sound_2_R = loadSample(moduleDirectory .. '/Custom Sounds/rot_click_R.wav')
local switcher_sound_R = loadSample(moduleDirectory .. '/Custom Sounds/metal_switch_R.wav')
local switcher_sound_2_R= loadSample(moduleDirectory .. '/Custom Sounds/metal_switch2_R.wav')
local button_sound_R = loadSample(moduleDirectory .. '/Custom Sounds/plastic_btn_R.wav')

local panel_x=-0.87550735
local panel_z=-22.569996
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


local changes_sw_prev=0
local changes_sw2_prev=0
local changes_but_prev=0
local changes_rot_prev=0
local changes_rot2_prev=0

function update()

	local changes_sw  = get(wiper)+get(co70_pwr)+get(co70_mch)+get(co70_sel)+get(co63_pwr)+get(co63_mch)+get(siv)+get(vhf2)
	local changes_sw2 = get(pedal)
	local changes_but = get(transponder_but_1)+get(transponder_but_2)+get(transponder_but_3)+get(transponder_but_4)+get(transponder_emerg)+get(transponder_sign)+get(transponder_control)+get(bp_1)+get(bp_2)
	changes_but=changes_but+get(co70_sign)+get(co70_control)+get(co63_sign)+get(co63_control)+get(co63_emerg)
	local changes_rot = get(sgu)+get(spu)+get(transponder_mode)+get(co63_sqwk_1)+get(co63_sqwk_2)+get(co63_sqwk_3)+get(co63_sqwk_4)+get(co70_mode)+get(co63_mode)+get(co63_mode)+get(co63_mode2)
	local changes_rot2 = get(co70_sqwk_1)+get(co70_sqwk_2)+get(co70_sqwk_3)+get(co70_sqwk_4)
	if changes_sw_prev~=changes_sw then 		
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
	
	if changes_sw2_prev~=changes_sw2 then 		
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
	
	if changes_rot_prev~=changes_rot then 		
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
		setSampleGain(rotary_sound_L,gain_L*dist)
		setSampleGain(rotary_sound_R,gain_R*dist)
		playSample(rotary_sound_L, false)
		playSample(rotary_sound_R, false)
	end
	
	if changes_rot2_prev~=changes_rot2 then 		
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
		setSampleGain(rotary_sound_2_L,gain_L*dist)
		setSampleGain(rotary_sound_2_R,gain_R*dist)
		playSample(rotary_sound_2_L, false)
		playSample(rotary_sound_2_R, false)
	end

	changes_sw_prev=changes_sw
    changes_sw2_prev=changes_sw2
    changes_but_prev=changes_but
	changes_rot_prev=changes_rot
	changes_rot2_prev=changes_rot2

end