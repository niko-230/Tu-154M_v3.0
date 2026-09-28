defineProperty("frame_time", globalPropertyf("tu154b2/custom/time/frame_time")) -- flight time
-- power
defineProperty("bus27_volt_L", globalPropertyf("tu154b2/custom/elec/bus27_volt_left"))
defineProperty("bus27_volt_R", globalPropertyf("tu154b2/custom/elec/bus27_volt_right"))
defineProperty("bus36_volt_L", globalPropertyf("tu154b2/custom/elec/bus36_volt_left"))
defineProperty("bus36_volt_R", globalPropertyf("tu154b2/custom/elec/bus36_volt_right"))
defineProperty("wiper_swtch_left", globalPropertyf("tu154b2/custom/switchers/wiper_left")) -- 
defineProperty("wiper_swtch_right", globalPropertyf("tu154b2/custom/switchers/wiper_right")) -- 

defineProperty("seat1", globalPropertyf("sim/custom/other/left_seat_move"))
defineProperty("seat2", globalPropertyf("sim/custom/other/right_seat_move"))
defineProperty("arm1", globalProperty("sim/flightmodel2/misc/custom_slider_ratio[10]"))
defineProperty("arm2", globalProperty("sim/flightmodel2/misc/custom_slider_ratio[11]"))
defineProperty("arm3", globalPropertyf("sim/custom/anim/rise_chair_arm_eng"))

defineProperty("cockpit_door", globalPropertyf("tu154b2/custom/anim/cockpit_door")) --
defineProperty("slider_8", globalProperty("sim/cockpit2/switches/custom_slider_on[7]")) -- sim slider on
defineProperty("table_move", globalPropertyf("sim/custom/eng_table_move")) --

defineProperty("pilot_Z", globalPropertyf("sim/aircraft/view/acf_peZ"))
defineProperty("pilot_X", globalPropertyf("sim/aircraft/view/acf_peX"))
defineProperty("pilot_head", globalPropertyi("sim/graphics/view/pilots_head_psi"))



local wiper_L_sl_sound_L = loadSample(moduleDirectory .. '/Custom Sounds/new_snds/wiper_slow_L.wav') --
local wiper_L_fst_sound_L = loadSample(moduleDirectory .. '/Custom Sounds/new_snds/wiper_fast_L.wav') --
local wiper_L_eng_L = loadSample(moduleDirectory .. '/Custom Sounds/new_snds/wiper_eng_L.wav')
local wiper_L_off_L = loadSample(moduleDirectory .. '/Custom Sounds/new_snds/wiper_off_L.wav')
local wiper_L_sl_sound_R = loadSample(moduleDirectory .. '/Custom Sounds/new_snds/wiper_slow_R.wav') --
local wiper_L_fst_sound_R = loadSample(moduleDirectory .. '/Custom Sounds/new_snds/wiper_fast_R.wav') --
local wiper_L_eng_R = loadSample(moduleDirectory .. '/Custom Sounds/new_snds/wiper_eng_R.wav')
local wiper_L_off_R = loadSample(moduleDirectory .. '/Custom Sounds/new_snds/wiper_off_R.wav')

local wiper_R_sl_sound_L = loadSample(moduleDirectory .. '/Custom Sounds/new_snds/wiper_slow_L.wav') --
local wiper_R_fst_sound_L = loadSample(moduleDirectory .. '/Custom Sounds/new_snds/wiper_fast_L.wav') --
local wiper_R_eng_L = loadSample(moduleDirectory .. '/Custom Sounds/new_snds/wiper_eng_L.wav')
local wiper_R_off_L = loadSample(moduleDirectory .. '/Custom Sounds/new_snds/wiper_off_L.wav')
local wiper_R_sl_sound_R = loadSample(moduleDirectory .. '/Custom Sounds/new_snds/wiper_slow_R.wav') --
local wiper_R_fst_sound_R = loadSample(moduleDirectory .. '/Custom Sounds/new_snds/wiper_fast_R.wav') --
local wiper_R_eng_R = loadSample(moduleDirectory .. '/Custom Sounds/new_snds/wiper_eng_R.wav')
local wiper_R_off_R = loadSample(moduleDirectory .. '/Custom Sounds/new_snds/wiper_off_R.wav')


local seat_L_move_sound_L = loadSample(moduleDirectory .. '/Custom Sounds/new_snds/seat_move_L.wav')
local seat_L_move_sound_R = loadSample(moduleDirectory .. '/Custom Sounds/new_snds/seat_move_R.wav')
local seat_R_move_sound_L = loadSample(moduleDirectory .. '/Custom Sounds/new_snds/seat_move_L.wav')
local seat_R_move_sound_R = loadSample(moduleDirectory .. '/Custom Sounds/new_snds/seat_move_R.wav')
local arm_L_move_sound_L = loadSample(moduleDirectory .. '/Custom Sounds/new_snds/arm_L.wav')
local arm_L_move_sound_R = loadSample(moduleDirectory .. '/Custom Sounds/new_snds/arm_R.wav')
local arm_R_move_sound_L = loadSample(moduleDirectory .. '/Custom Sounds/new_snds/arm_L.wav')
local arm_R_move_sound_R = loadSample(moduleDirectory .. '/Custom Sounds/new_snds/arm_R.wav')
local arm_M_move_sound_L = loadSample(moduleDirectory .. '/Custom Sounds/new_snds/arm_L.wav')
local arm_M_move_sound_R = loadSample(moduleDirectory .. '/Custom Sounds/new_snds/arm_R.wav')

local door_open_L = loadSample(moduleDirectory .. '/Custom Sounds/new_snds/door_open_L.wav') --
local door_close_L = loadSample(moduleDirectory .. '/Custom Sounds/new_snds/door_close_L.wav') --
local door_open_R = loadSample(moduleDirectory .. '/Custom Sounds/new_snds/door_open_R.wav') --
local door_close_R = loadSample(moduleDirectory .. '/Custom Sounds/new_snds/door_close_R.wav') --

local table_sound_L = loadSample(moduleDirectory .. '/Custom Sounds/new_snds/table_L.wav') --
local table_sound_R = loadSample(moduleDirectory .. '/Custom Sounds/new_snds/table_R.wav') --
local seat_L_last=0
local seat_R_last=0

local arm_L_last=0
local arm_R_last=0
local arm_M_last=0

local table_move_last=0

local seat_L_x=-0.490728
local seat_L_z=-22.561953
local seat_R_x=0.490728
local seat_R_z=-22.561953
local seat_FE_x=0.102207
local seat_FE_z=-21.221266
local wiper_L_x=-0.5593857
local wiper_L_z=-23.334754
local wiper_R_x=0.5593857
local wiper_R_z=-23.334754
local door_x=0.16225632
local door_z=-20.738304
local dist_gain=5


local wiper_L_eng_vol=0
local wiper_R_eng_vol=0

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


function update()
	local passed = get(frame_time)
	
	local run = bool2int(passed ~= 0)
	-- if get(external_view) > 0 or math.abs(get(pilot_X)) > 1.41 or get(pilot_Y) < -0.4 or get(vr_outside) ==1 then
	   -- external = 1
    -- else
	   -- external = 0
    -- end
	local z_pos=get(pilot_Z)
	local x_pos=get(pilot_X)
	local plt_hdg=get(pilot_head)

	local power = get(bus27_volt_L) > 13 or get(bus27_volt_R) > 13    
    local power_36 = get(bus36_volt_L) > 15 or get(bus36_volt_R) > 15 
    ---wipers-----
    
	local wiper_l_swtch = get(wiper_swtch_left)
    
    local wiper_r_swtch = get(wiper_swtch_right)	
	
    if power_36 and wiper_l_swtch == 1 then
		local gain_wip_L_L, gain_wip_L_R = inn_balance (wiper_L_x, wiper_L_z, x_pos, z_pos , plt_hdg)
		gain_wip_L_L=gain_wip_L_L*700
		gain_wip_L_R=gain_wip_L_R*700
		local dist_wip_L=1
		if z_pos-wiper_L_z~=0 then
			dist_wip_L=math.min(1,1/math.sqrt(math.pow(z_pos-wiper_L_z,2)+math.pow(x_pos-wiper_L_x,2))/dist_gain)
		end
		setSampleGain(wiper_L_fst_sound_L,gain_wip_L_L*dist_wip_L)
		setSampleGain(wiper_L_fst_sound_R,gain_wip_L_R*dist_wip_L)
		if not isSamplePlaying(wiper_L_fst_sound_L) then
		  playSample(wiper_L_fst_sound_L, false) 
		  playSample(wiper_L_fst_sound_R, false) 
		end
    elseif power_36 and wiper_l_swtch == -1 then
		local gain_wip_L_L, gain_wip_L_R = inn_balance (wiper_L_x, wiper_L_z, x_pos, z_pos , plt_hdg)
		gain_wip_L_L=gain_wip_L_L*700
		gain_wip_L_R=gain_wip_L_R*700
		local dist_wip_L=1
		if z_pos-wiper_L_z~=0 then
			dist_wip_L=math.min(1,1/math.sqrt(math.pow(z_pos-wiper_L_z,2)+math.pow(x_pos-wiper_L_x,2))/dist_gain)
		end
		setSampleGain(wiper_L_sl_sound_L,gain_wip_L_L*dist_wip_L)
		setSampleGain(wiper_L_sl_sound_R,gain_wip_L_R*dist_wip_L)
			
		if not isSamplePlaying(wiper_L_sl_sound_L) then 
          playSample(wiper_L_sl_sound_L, false) 
		  playSample(wiper_L_sl_sound_R, false) 
        end
    else
		stopSample(wiper_L_fst_sound_L)
		stopSample(wiper_L_sl_sound_L)
		stopSample(wiper_L_fst_sound_R)
		stopSample(wiper_L_sl_sound_R)
    end
    
    if power_36 and wiper_r_swtch == 1 then
		local gain_wip_R_L, gain_wip_R_R = inn_balance (wiper_R_x, wiper_R_z, x_pos, z_pos , plt_hdg)
		gain_wip_R_L=gain_wip_R_L*700
		gain_wip_R_R=gain_wip_R_R*700
		local dist_wip_R=1
		if z_pos-wiper_R_z~=0 then
			dist_wip_R=math.min(1,1/math.sqrt(math.pow(z_pos-wiper_R_z,2)+math.pow(x_pos-wiper_R_x,2))/dist_gain)
		end
		setSampleGain(wiper_R_fst_sound_L,gain_wip_R_L*dist_wip_R)
		setSampleGain(wiper_R_fst_sound_R,gain_wip_R_R*dist_wip_R)
		if not isSamplePlaying(wiper_R_fst_sound_L) then
		  playSample(wiper_R_fst_sound_L, false) 
		  playSample(wiper_R_fst_sound_R, false) 
		end
    elseif  power_36 and wiper_r_swtch == -1 then
		local gain_wip_R_L, gain_wip_R_R = inn_balance (wiper_R_x, wiper_R_z, x_pos, z_pos , plt_hdg)
		gain_wip_R_L=gain_wip_R_L*700
		gain_wip_R_R=gain_wip_R_R*700
		local dist_wip_R=1
		if z_pos-wiper_R_z~=0 then
			dist_wip_R=math.min(1,1/math.sqrt(math.pow(z_pos-wiper_R_z,2)+math.pow(x_pos-wiper_R_x,2))/dist_gain)
		end
		setSampleGain(wiper_R_sl_sound_L,gain_wip_R_L*dist_wip_R)
		setSampleGain(wiper_R_sl_sound_R,gain_wip_R_R*dist_wip_R)
			
		if not isSamplePlaying(wiper_R_sl_sound_L) then 
          playSample(wiper_R_sl_sound_L, false) 
		  playSample(wiper_R_sl_sound_R, false) 
        end
    else
		stopSample(wiper_R_fst_sound_L)
		stopSample(wiper_R_sl_sound_L)
		stopSample(wiper_R_fst_sound_R)
		stopSample(wiper_R_sl_sound_R)
    end
    
    if power_36 and math.abs(wiper_l_swtch) > 0 then
		local gain_wip_L_L, gain_wip_L_R = inn_balance (wiper_L_x, wiper_L_z, x_pos, z_pos , plt_hdg)
		gain_wip_L_L=gain_wip_L_L*700
		gain_wip_L_R=gain_wip_L_R*700
		local dist_wip_L=1
		if z_pos-wiper_L_z~=0 then
			dist_wip_L=math.min(1,1/math.sqrt(math.pow(z_pos-wiper_L_z,2)+math.pow(x_pos-wiper_L_x,2))/dist_gain)
		end
		setSampleGain(wiper_L_eng_L,gain_wip_L_L*dist_wip_L*wiper_L_eng_vol)
		setSampleGain(wiper_L_eng_R,gain_wip_L_R*dist_wip_L*wiper_L_eng_vol)
		if not isSamplePlaying(wiper_L_eng_L) then 
			playSample(wiper_L_eng_L, false) 
			playSample(wiper_L_eng_R, false) 
		end
		if wiper_L_eng_vol < 1 then
		wiper_L_eng_vol = wiper_L_eng_vol +3*passed
		end
    else
		local gain_wip_L_L, gain_wip_L_R = inn_balance (wiper_L_x, wiper_L_z, x_pos, z_pos , plt_hdg)
		gain_wip_L_L=gain_wip_L_L*700
		gain_wip_L_R=gain_wip_L_R*700
		local dist_wip_L=1
		if z_pos-wiper_L_z~=0 then
			dist_wip_L=math.min(1,1/math.sqrt(math.pow(z_pos-wiper_L_z,2)+math.pow(x_pos-wiper_L_x,2))/dist_gain)
		end
		setSampleGain(wiper_L_eng_L,gain_wip_L_L*dist_wip_L*wiper_L_eng_vol)
		setSampleGain(wiper_L_eng_R,gain_wip_L_R*dist_wip_L*wiper_L_eng_vol)
        if wiper_L_eng_vol > 0 then
            wiper_L_eng_vol = wiper_L_eng_vol -3*passed
			setSampleGain(wiper_L_off_L,gain_wip_L_L*dist_wip_L*wiper_L_eng_vol)
			setSampleGain(wiper_L_off_R,gain_wip_L_R*dist_wip_L*wiper_L_eng_vol)
            if not isSamplePlaying(wiper_L_off_L) then 
                playSample(wiper_L_off_L, false) 
				playSample(wiper_L_off_R, false) 
            end
        else
            wiper_L_eng_vol = 0
            stopSample(wiper_L_eng_L)
            stopSample(wiper_L_off_L)
			stopSample(wiper_L_eng_R)
            stopSample(wiper_L_off_R)
        end
    end
    
	if power_36 and math.abs(wiper_r_swtch) > 0 then
		local gain_wip_R_L, gain_wip_R_R = inn_balance (wiper_R_x, wiper_R_z, x_pos, z_pos , plt_hdg)
		gain_wip_R_L=gain_wip_R_L*700
		gain_wip_R_R=gain_wip_R_R*700
		local dist_wip_R=1
		if z_pos-wiper_R_z~=0 then
			dist_wip_R=math.min(1,1/math.sqrt(math.pow(z_pos-wiper_R_z,2)+math.pow(x_pos-wiper_R_x,2))/dist_gain)
		end
		setSampleGain(wiper_R_eng_L,gain_wip_R_L*dist_wip_R*wiper_R_eng_vol)
		setSampleGain(wiper_R_eng_R,gain_wip_R_R*dist_wip_R*wiper_R_eng_vol)
		if not isSamplePlaying(wiper_R_eng_L) then 
			playSample(wiper_R_eng_L, false) 
			playSample(wiper_R_eng_R, false) 
		end
		if wiper_R_eng_vol < 1 then
		wiper_R_eng_vol = wiper_R_eng_vol +3*passed
		end
    else
		local gain_wip_R_L, gain_wip_R_R = inn_balance (wiper_R_x, wiper_R_z, x_pos, z_pos , plt_hdg)
		gain_wip_R_L=gain_wip_R_L*700
		gain_wip_R_R=gain_wip_R_R*700
		local dist_wip_R=1
		if z_pos-wiper_R_z~=0 then
			dist_wip_R=math.min(1,1/math.sqrt(math.pow(z_pos-wiper_R_z,2)+math.pow(x_pos-wiper_R_x,2))/dist_gain)
		end
		setSampleGain(wiper_R_eng_L,gain_wip_R_L*dist_wip_R*wiper_R_eng_vol)
		setSampleGain(wiper_R_eng_R,gain_wip_R_R*dist_wip_R*wiper_R_eng_vol)
        if wiper_R_eng_vol > 0 then
            wiper_R_eng_vol = wiper_R_eng_vol -3*passed
			setSampleGain(wiper_R_off_L,gain_wip_R_L*dist_wip_R*wiper_R_eng_vol)
			setSampleGain(wiper_R_off_R,gain_wip_R_R*dist_wip_R*wiper_R_eng_vol)
            if not isSamplePlaying(wiper_R_off_L) then 
                playSample(wiper_R_off_L, false) 
				playSample(wiper_R_off_R, false) 
            end
        else
            wiper_R_eng_vol = 0
            stopSample(wiper_R_eng_L)
            stopSample(wiper_R_off_L)
			stopSample(wiper_R_eng_R)
            stopSample(wiper_R_off_R)
        end
    end
	-------- seats ---------
	local seat_L = get(seat1)
	local seat_R = get(seat2)
	
	if seat_L ~= seat_L_last then 
		local gain_seat_L_L, gain_seat_L_R = inn_balance (seat_L_x-0.2, seat_L_z, x_pos, z_pos , plt_hdg)
		local gain_seat_L_L2, gain_seat_L_R2 = inn_balance (seat_L_x+0.2, seat_L_z, x_pos, z_pos , plt_hdg)
		local gain_seat_L_L=math.max(gain_seat_L_L,gain_seat_L_L2)
		local gain_seat_L_R=math.max(gain_seat_L_R,gain_seat_L_R2)
		gain_seat_L_L=gain_seat_L_L*700
		gain_seat_L_R=gain_seat_L_R*700
		local dist_seat_L=1
		if z_pos-seat_L_z~=0 then
			dist_seat_L=math.min(1,1/math.sqrt(math.pow(z_pos-seat_L_z,2)+math.pow(x_pos-seat_L_x,2))/dist_gain)
		end
		setSampleGain(seat_L_move_sound_L,gain_seat_L_L*dist_seat_L)
		setSampleGain(seat_L_move_sound_R,gain_seat_L_R*dist_seat_L)
        if not isSamplePlaying(seat_L_move_sound_L) then 
			playSample(seat_L_move_sound_L, false) 
			playSample(seat_L_move_sound_R, false) 
		end
    end
	
	seat_L_last = seat_L
	
	if seat_R ~= seat_R_last then 
		local gain_seat_R_L, gain_seat_R_R = inn_balance (seat_R_x-0.2, seat_R_z, x_pos, z_pos , plt_hdg)
		local gain_seat_R_L2, gain_seat_R_R2 = inn_balance (seat_R_x+0.2, seat_R_z, x_pos, z_pos , plt_hdg)
		local gain_seat_R_L=math.max(gain_seat_R_L,gain_seat_R_L2)
		local gain_seat_R_R=math.max(gain_seat_R_R,gain_seat_R_R2)
		gain_seat_R_L=gain_seat_R_L*700
		gain_seat_R_R=gain_seat_R_R*700
		local dist_seat_R=1
		if z_pos-seat_R_z~=0 then
			dist_seat_R=math.min(1,1/math.sqrt(math.pow(z_pos-seat_R_z,2)+math.pow(x_pos-seat_R_x,2))/dist_gain)
		end
		setSampleGain(seat_R_move_sound_L,gain_seat_R_L*dist_seat_R)
		setSampleGain(seat_R_move_sound_R,gain_seat_R_R*dist_seat_R)
        if not isSamplePlaying(seat_R_move_sound_L) then 
			playSample(seat_R_move_sound_L, false) 
			playSample(seat_R_move_sound_R, false) 
		end
    end
	
	seat_R_last = seat_R
	
	-------armrests
    local arm_L = get(arm1)
	local arm_R = get(arm2)
	local arm_M = get(arm3)
	if arm_L>0 and arm_L<1 then
		local gain_arm_L_L, gain_arm_L_R = inn_balance (seat_L_x-0.2, seat_L_z, x_pos, z_pos , plt_hdg)
		local gain_arm_L_L2, gain_arm_L_R2 = inn_balance (seat_L_x+0.2, seat_L_z, x_pos, z_pos , plt_hdg)
		local gain_arm_L_L=math.max(gain_arm_L_L,gain_arm_L_L2)
		local gain_arm_L_R=math.max(gain_arm_L_R,gain_arm_L_R2)
		gain_arm_L_L=gain_arm_L_L*700
		gain_arm_L_R=gain_arm_L_R*700
		local dist_arm_L=1
		if z_pos-seat_L_z~=0 then
			dist_arm_L=math.min(1,1/math.sqrt(math.pow(z_pos-seat_L_z,2)+math.pow(x_pos-seat_L_x,2))/dist_gain)
		end
		setSampleGain(arm_L_move_sound_L,gain_arm_L_L*dist_arm_L)
		setSampleGain(arm_L_move_sound_R,gain_arm_L_R*dist_arm_L)
		if math.abs(arm_L-arm_L_last) > 0.2 then 
			if not isSamplePlaying(arm_L_move_sound_L) then 
				playSample(arm_L_move_sound_L, false) 
				playSample(arm_L_move_sound_R, false) 
			end
		end
		arm_L_last = arm_L
	end	
		
	if arm_R>0 and arm_R<1 then
		local gain_arm_R_L, gain_arm_R_R = inn_balance (seat_R_x-0.2, seat_R_z, x_pos, z_pos , plt_hdg)
		local gain_arm_R_L2, gain_arm_R_R2 = inn_balance (seat_R_x+0.2, seat_R_z, x_pos, z_pos , plt_hdg)
		local gain_arm_R_L=math.max(gain_arm_R_L,gain_arm_R_L2)
		local gain_arm_R_R=math.max(gain_arm_R_R,gain_arm_R_R2)
		gain_arm_R_L=gain_arm_R_L*700
		gain_arm_R_R=gain_arm_R_R*700
		local dist_arm_R=1
		if z_pos-seat_R_z~=0 then
			dist_arm_R=math.min(1,1/math.sqrt(math.pow(z_pos-seat_R_z,2)+math.pow(x_pos-seat_R_x,2))/dist_gain)
		end
		setSampleGain(arm_R_move_sound_L,gain_arm_R_L*dist_arm_R)
		setSampleGain(arm_R_move_sound_R,gain_arm_R_R*dist_arm_R)
		if math.abs(arm_R-arm_R_last) > 0.2 then 
			if not isSamplePlaying(arm_R_move_sound_L) then 
				playSample(arm_R_move_sound_L, false) 
				playSample(arm_R_move_sound_R, false) 
			end
		end	
		arm_R_last = arm_R
	end
	
	if arm_M>0 and arm_M<0.6 then
		local gain_arm_M_L, gain_arm_M_R = inn_balance (seat_FE_x, seat_FE_z+0.1, x_pos, z_pos , plt_hdg)
		gain_arm_M_L=gain_arm_M_L*700
		gain_arm_M_R=gain_arm_M_R*700
		local dist_arm_M=1
		if z_pos-seat_FE_z~=0 then
			dist_arm_M=math.min(1,1/math.sqrt(math.pow(z_pos-seat_FE_z,2)+math.pow(x_pos-seat_FE_x,2))/dist_gain)
		end
		setSampleGain(arm_M_move_sound_L,gain_arm_M_L*dist_arm_M)
		setSampleGain(arm_M_move_sound_R,gain_arm_M_R*dist_arm_M)
		if arm_M_last ~= arm_M then 
			if not isSamplePlaying(arm_M_move_sound_L) then 
				playSample(arm_M_move_sound_L, false) 
				playSample(arm_M_move_sound_R, false) 
			end
		end	
		arm_M_last = arm_M
	end
	-------Door--------
	local door_butt = get(slider_8)
    local door_anim = get(cockpit_door)
	if door_anim >0 and door_anim <1 then
		local gain_door_L, gain_door_R = inn_balance (door_x, door_z, x_pos, z_pos , plt_hdg)
		gain_door_L=gain_door_L*800
		gain_door_R=gain_door_R*800
		local dist_door=1
		if z_pos-door_z~=0 then
			dist_door=math.min(1,1/math.sqrt(math.pow(z_pos-door_z,2)+math.pow(x_pos-door_x,2))/dist_gain)
		end
		setSampleGain(door_open_L,gain_door_L*dist_door)
		setSampleGain(door_open_R,gain_door_R*dist_door)
		setSampleGain(door_close_L,gain_door_L*dist_door)
		setSampleGain(door_close_R,gain_door_R*dist_door)
		if door_anim >= 0.01 and door_anim <= 0.3 then
			if door_butt == 1 then
				if not isSamplePlaying(door_open_L) then
				  playSample(door_open_L, false)
				  playSample(door_open_R, false)
				end
			else
				if not isSamplePlaying(door_close_L) then
				  playSample(door_close_L, false)
				  playSample(door_close_R, false)
				end
			end
		end
	end
	--------FE Table--------
	local table_moving = get(table_move)
    if table_moving >0 and table_moving <1 then
		local gain_table_L, gain_table_R = inn_balance (seat_FE_x+0.3, seat_FE_z, x_pos, z_pos , plt_hdg)
		gain_table_L=gain_table_L*800
		gain_table_R=gain_table_R*800
		local dist_table=1
		if z_pos-seat_FE_z~=0 then
			dist_table=math.min(1,1/math.sqrt(math.pow(z_pos-seat_FE_z,2)+math.pow(x_pos-seat_FE_x+0.3,2))/dist_gain)
		end
		setSampleGain(table_sound_L,gain_table_L*dist_table)
		setSampleGain(table_sound_R,gain_table_R*dist_table)

		if math.abs(table_moving - table_move_last) > 0.2 then 
			if not isSamplePlaying(table_sound_L) then 
				playSample(table_sound_L, false) 
				playSample(table_sound_R, false) 
			end
		end
			
		table_move_last = table_moving
	end
end