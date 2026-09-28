function deferred_dataref(name,type,notifier)
	print("Deffered dataref: "..name)
	dref=XLuaCreateDataRef(name, type,"yes",notifier)
	return wrap_dref_any(dref,type) 
end

simDR_36v = find_dataref("tu154b2/custom/elec/bus36_volt_left")
simDR_efis_1_wxr = find_dataref("sim/cockpit/switches/EFIS_shows_weather")
simDR_wxr_mode = find_dataref("sim/cockpit2/EFIS/EFIS_weather_mode")
weather_sys = find_dataref("sim/custom/kontur/weather_sys")
kontur_wx_l = find_dataref("sim/custom/kontur/left_wx")
kontur_wx_r = find_dataref("sim/custom/kontur/right_wx")
weather_lit = find_dataref("sim/custom/kontur/weather_lit")
simDRtcasmode = find_dataref("tu154b2/custom/tcas/screen_mode")
simDR_taws_mode = find_dataref("tu154b2/custom/taws/mode_set")
simDR_sw_sound = find_dataref("tu154b2/custom/lights/tech_light_set")
ubs_pow_l = find_dataref("sim/custom/ubs/left_power")
ubs_pow_r = find_dataref("sim/custom/ubs/right_power")
uns1_on = find_dataref("sim/custom/uns1_on")
uns2_on = find_dataref("sim/custom/uns2_on")
srpbz = find_dataref("tu154b2/custom/kontur/srpbz")
rls_test = find_dataref("sim/custom/kontur/left_wx_test")

nodata = deferred_dataref("sim/custom/kontur/nodata", "number")
nodata_r = deferred_dataref("sim/custom/kontur/nodata_r", "number")


local no_swc = 0
local no_rls = 0
local no_tcas = 0
local no_taws = 0
local no_nav_l = 0
local no_nav_r = 0


function ubs_ovhd_onoff_l_CMDhandler(phase, duration)
     if phase == 0 then
        if ubs_pow_l > 0 then
                ubs_pow_l = 0
        else
                ubs_pow_l = 1
        end  
        if simDR_sw_sound > -1 then
            simDR_sw_sound = -1
        else
            simDR_sw_sound = 0
        end
    end    	
end

function ubs_ovhd_onoff_r_CMDhandler(phase, duration)
     if phase == 0 then
        if ubs_pow_r > 0 then
                ubs_pow_r = 0
        else
                ubs_pow_r = 1
        end  
        if simDR_sw_sound > -1 then
            simDR_sw_sound = -1
        else
            simDR_sw_sound = 0
        end
    end    	
end	


UBS_L_ON_func	= create_command("ubs/ovhd_onoff_l", "UBS L OVHD ONOFF", ubs_ovhd_onoff_l_CMDhandler)
UBS_R_ON_func	= create_command("ubs/ovhd_onoff_r", "UBS R OVHD ONOFF", ubs_ovhd_onoff_r_CMDhandler)


function kontur_nodata_items()

    
    if uns1_on < 1 then
        no_nav_l = 1
    else
        no_nav_l = 0
    end
    if uns2_on < 1 then
        no_nav_r = 1
    else
        no_nav_r = 0
    end
    
---- no swc

    if simDR_wxr_mode < 2 and rls_test<1 then
    no_swc = 1
    -- elseif simDR_wxr_mode < 2 and kontur_wx_r > 0 then
    -- no_swc = 1
    else
    no_swc = 0
    end
    
 ----- no rls
    
   if weather_sys == 1 and simDR_36v > 0 then
    no_rls = 0
    weather_lit = 1
    else
    no_rls = 1
    weather_lit = 0
    end
    

 ----- no tcas

    if simDRtcasmode == 100 then
    no_tcas = 1
    else
    no_tcas = 0
    end
    
    
----- no taws
    
    if simDR_taws_mode == 0 then
    no_taws = 1
    elseif simDR_taws_mode == 4 then
    no_taws = 1
    else
    no_taws = 0
    end
    
    
    
    

end


function kontur_nodata_l()

    
    if no_swc == 1 and no_rls == 1 and no_tcas == 1 and no_taws == 1 and no_nav_l == 1 then
      nodata = 15
    end
    
    if no_swc < 1 and no_rls < 1 and no_tcas < 1 and no_taws < 1 and no_nav_l < 1 then
      nodata = 0
    end
    
    if no_swc > 0 and no_rls > 0 and no_tcas > 0 and no_taws > 0 and no_nav_l < 1 then
      nodata = 1
    end
    
    if no_swc == 1 and no_rls < 1 and no_tcas > 0 and no_taws > 0 and no_nav_l < 1 then
      nodata = 2
    end
    
    if no_swc == 1 and no_rls > 0 and no_tcas > 0 and no_taws < 1 and no_nav_l < 1 then
      nodata = 3
    end
    
    if no_swc < 1 and no_rls > 0 and no_tcas > 0 and no_taws > 0 and no_nav_l < 1 then
      nodata = 4
    end
    
    if no_swc == 1 and no_rls < 1 and no_tcas > 0 and no_taws < 1 and no_nav_l < 1 then
      nodata = 5
    end
    
    if no_swc == 1 and no_rls < 1 and no_tcas < 1 and no_taws > 0 and no_nav_l < 1 then
      nodata = 6
    end
    
    if no_swc == 1 and no_rls > 0 and no_tcas < 1 and no_taws < 1 and no_nav_l < 1 then
      nodata = 7
    end
    
    if no_swc < 1 and no_rls > 0 and no_tcas < 1 and no_taws > 0 and no_nav_l < 1 then
      nodata = 8
    end
    
    if no_swc < 1 and no_rls > 0 and no_tcas > 0 and no_taws < 1 and no_nav_l < 1 then
      nodata = 9
    end
    
    if no_swc < 1 and no_rls < 1 and no_tcas > 0 and no_taws > 0 and no_nav_l < 1 then
      nodata = 10
    end
    
    if no_swc == 1 and no_rls < 1 and no_tcas < 1 and no_taws < 1 and no_nav_l < 1 then
      nodata = 11
    end
    
    if no_swc < 1 and no_rls > 0 and no_tcas < 1 and no_taws < 1 and no_nav_l < 1 then
      nodata = 12
    end
    
    if no_swc < 1 and no_rls < 1 and no_tcas > 0 and no_taws < 1 and no_nav_l < 1 then
      nodata = 13
    end
    
    if no_swc < 1 and no_rls < 1 and no_tcas < 1 and no_taws > 0 and no_nav_l < 1 then
      nodata = 14
    end
    
    if no_swc == 1 and no_rls < 1 and no_tcas > 0 and no_taws > 0 and no_nav_l > 0 then
      nodata = 16
    end
    
    if no_swc == 1 and no_rls > 0 and no_tcas > 0 and no_taws < 1 and no_nav_l > 0 then
      nodata = 17
    end
    
    if no_swc < 1 and no_rls > 0 and no_tcas > 0 and no_taws > 0 and no_nav_l > 0 then
      nodata = 18
    end
    
    if no_swc == 1 and no_rls < 1 and no_tcas > 0 and no_taws < 1 and no_nav_l > 0 then
      nodata = 19
    end
    
    if no_swc == 1 and no_rls < 1 and no_tcas < 1 and no_taws > 0 and no_nav_l > 0 then
      nodata = 20
    end
    
    if no_swc == 1 and no_rls > 0 and no_tcas < 1 and no_taws < 1 and no_nav_l > 0 then
      nodata = 21
    end
    
    if no_swc < 1 and no_rls > 0 and no_tcas < 1 and no_taws > 0 and no_nav_l > 0 then
      nodata = 22
    end
    
    if no_swc < 1 and no_rls > 0 and no_tcas > 0 and no_taws < 1 and no_nav_l > 0 then
      nodata = 23
    end
    
    if no_swc < 1 and no_rls < 1 and no_tcas > 0 and no_taws > 0 and no_nav_l > 0 then
      nodata = 24
    end
    
    if no_swc == 1 and no_rls < 1 and no_tcas < 1 and no_taws < 1 and no_nav_l > 0 then
      nodata = 25
    end
    
    if no_swc < 1 and no_rls > 0 and no_tcas < 1 and no_taws < 1 and no_nav_l > 0 then
      nodata = 26
    end
    
    if no_swc < 1 and no_rls < 1 and no_tcas > 0 and no_taws < 1 and no_nav_l > 0 then
      nodata = 27
    end
    
    if no_swc < 1 and no_rls < 1 and no_tcas < 1 and no_taws > 0 and no_nav_l > 0 then
      nodata = 28
    end

    
end

function kontur_nodata_r()

    if no_swc == 1 and no_rls == 1 and no_tcas == 1 and no_taws == 1 and no_nav_r == 1 then
      nodata_r = 15
    end
    
    if no_swc < 1 and no_rls < 1 and no_tcas < 1 and no_taws < 1 and no_nav_r < 1 then
      nodata_r = 0
    end
    
    if no_swc > 0 and no_rls > 0 and no_tcas > 0 and no_taws > 0 and no_nav_r < 1 then
      nodata_r = 1
    end
    
    if no_swc == 1 and no_rls < 1 and no_tcas > 0 and no_taws > 0 and no_nav_r < 1 then
      nodata_r = 2
    end
    
    if no_swc == 1 and no_rls > 0 and no_tcas > 0 and no_taws < 1 and no_nav_r < 1 then
      nodata_r = 3
    end
    
    if no_swc < 1 and no_rls > 0 and no_tcas > 0 and no_taws > 0 and no_nav_r < 1 then
      nodata_r = 4
    end
    
    if no_swc == 1 and no_rls < 1 and no_tcas > 0 and no_taws < 1 and no_nav_r < 1 then
      nodata_r = 5
    end
    
    if no_swc == 1 and no_rls < 1 and no_tcas < 1 and no_taws > 0 and no_nav_r < 1 then
      nodata_r = 6
    end
    
    if no_swc == 1 and no_rls > 0 and no_tcas < 1 and no_taws < 1 and no_nav_r < 1 then
      nodata_r = 7
    end
    
    if no_swc < 1 and no_rls > 0 and no_tcas < 1 and no_taws > 0 and no_nav_r < 1 then
      nodata_r = 8
    end
    
    if no_swc < 1 and no_rls > 0 and no_tcas > 0 and no_taws < 1 and no_nav_r < 1 then
      nodata_r = 9
    end
    
    if no_swc < 1 and no_rls < 1 and no_tcas > 0 and no_taws > 0 and no_nav_r < 1 then
      nodata_r = 10
    end
    
    if no_swc == 1 and no_rls < 1 and no_tcas < 1 and no_taws < 1 and no_nav_r < 1 then
      nodata_r = 11
    end
    
    if no_swc < 1 and no_rls > 0 and no_tcas < 1 and no_taws < 1 and no_nav_r < 1 then
      nodata_r = 12
    end
    
    if no_swc < 1 and no_rls < 1 and no_tcas > 0 and no_taws < 1 and no_nav_r < 1 then
      nodata_r = 13
    end
    
    if no_swc < 1 and no_rls < 1 and no_tcas < 1 and no_taws > 0 and no_nav_r < 1 then
      nodata_r = 14
    end
    
    if no_swc == 1 and no_rls < 1 and no_tcas > 0 and no_taws > 0 and no_nav_r > 0 then
      nodata_r = 16
    end
    
    if no_swc == 1 and no_rls > 0 and no_tcas > 0 and no_taws < 1 and no_nav_r > 0 then
      nodata_r = 17
    end
    
    if no_swc < 1 and no_rls > 0 and no_tcas > 0 and no_taws > 0 and no_nav_r > 0 then
      nodata_r = 18
    end
    
    if no_swc == 1 and no_rls < 1 and no_tcas > 0 and no_taws < 1 and no_nav_r > 0 then
      nodata_r = 19
    end
    
    if no_swc == 1 and no_rls < 1 and no_tcas < 1 and no_taws > 0 and no_nav_r > 0 then
      nodata_r = 20
    end
    
    if no_swc == 1 and no_rls > 0 and no_tcas < 1 and no_taws < 1 and no_nav_r > 0 then
      nodata_r = 21
    end
    
    if no_swc < 1 and no_rls > 0 and no_tcas < 1 and no_taws > 0 and no_nav_r > 0 then
      nodata_r = 22
    end
    
    if no_swc < 1 and no_rls > 0 and no_tcas > 0 and no_taws < 1 and no_nav_r > 0 then
      nodata_r = 23
    end
    
    if no_swc < 1 and no_rls < 1 and no_tcas > 0 and no_taws > 0 and no_nav_r > 0 then
      nodata_r = 24
    end
    
    if no_swc == 1 and no_rls < 1 and no_tcas < 1 and no_taws < 1 and no_nav_r > 0 then
      nodata_r = 25
    end
    
    if no_swc < 1 and no_rls > 0 and no_tcas < 1 and no_taws < 1 and no_nav_r > 0 then
      nodata_r = 26
    end
    
    if no_swc < 1 and no_rls < 1 and no_tcas > 0 and no_taws < 1 and no_nav_r > 0 then
      nodata_r = 27
    end
    
    if no_swc < 1 and no_rls < 1 and no_tcas < 1 and no_taws > 0 and no_nav_r > 0 then
      nodata_r = 28
    end



end


run_at_interval(kontur_nodata_l, 1.5)
run_at_interval(kontur_nodata_r, 1.5)

function after_physics()
    kontur_nodata_items()    
end
