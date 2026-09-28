function deferred_dataref(name,type,notifier)
	print("Deffered dataref: "..name)
	dref=XLuaCreateDataRef(name, type,"yes",notifier)
	return wrap_dref_any(dref,type) 
end

simDR_bus27left = find_dataref("tu154b2/custom/elec/bus27_volt_left")
simDR_bus27right = find_dataref("tu154b2/custom/elec/bus27_volt_right")
simDR_arm406 = find_dataref("tu154b2/custom/switchers/ovhd/arm406")
simDR_arm406_dejur_contr_lit = find_dataref("tu154b2/custom/lights/button/dejur_contr")
simDR_arm406_sound_off_lit = find_dataref("tu154b2/custom/lights/button/sound_off")
simDR_but_sound = find_dataref("tu154b2/custom/buttons/srpbz/but_down")

arm406_test = deferred_dataref("sim/custom/arm406_test", "number")
dejur_contr = deferred_dataref("sim/custom/arm406_dejur_contr", "number")
sound_off = deferred_dataref("sim/custom/arm406_sound_off", "number")
otkaz_lit = deferred_dataref("sim/custom/arm406_otkaz_lit", "number")
avariya_lit = deferred_dataref("sim/custom/arm406_avariya_lit", "number")
arm_lit = deferred_dataref("sim/custom/arm406_arm_lit", "number")

local bus27 = 0
local test = 0
local pressed = 0

function arm()

    
    if dejur_contr > 0 then
        simDR_but_sound = 1
        pressed = 1
    end
    if dejur_contr < 1 and pressed > 0 then
        simDR_but_sound = 0
        pressed = 0
    end

    if simDR_bus27left+simDR_bus27right > 13 then
        bus27 = 1
    else
        bus27 = 0
    end 

    if test > 2 and test < 3.4 then
        arm406_test = 1
    else
        arm406_test = 0
    end

    if bus27 and simDR_arm406 > 0 then
        if dejur_contr > 0 and test < 0.5 then
            test = 5
        end
        if test > 0 then
            test = test - 0.5*SIM_PERIOD
            arm_lit = 0
            simDR_arm406_dejur_contr_lit = 0
            simDR_arm406_sound_off_lit = 0
        else
            avariya_lit =0
            arm_lit = 1
            simDR_arm406_dejur_contr_lit = 1
            simDR_arm406_sound_off_lit = 1
        end     
    else
        test = 5
        avariya_lit = 0
        arm_lit = 0
        simDR_arm406_dejur_contr_lit = 0
        simDR_arm406_sound_off_lit = 0
    end

    if test > 3 and test < 4 then
        otkaz_lit = 1
    else
        otkaz_lit = 0
    end
    if test > 1.4 then
        if test < 4.8 and test > 4 then
            avariya_lit = 1
        elseif test < 3.5 and test > 2.7 then
            avariya_lit = 1
        elseif test < 2.2 and test > 1.7 then
            avariya_lit = 1
        else
            avariya_lit = 0
        end
    elseif test > 0 then
            avariya_lit = 1
    end


end



function after_physics()
    arm()
end
