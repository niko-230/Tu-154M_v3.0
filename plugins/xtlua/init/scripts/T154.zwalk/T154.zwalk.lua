function deferred_dataref(name,type,notifier)
	print("Deffered dataref: "..name)
	dref=XLuaCreateDataRef(name, type,"yes",notifier)
	return wrap_dref_any(dref,type) 
end
   
simDR_pilot_head_x = find_dataref("sim/graphics/view/pilots_head_x")
simDR_pilot_head_y = find_dataref("sim/graphics/view/pilots_head_y")
simDR_pilot_head_z = find_dataref("sim/graphics/view/pilots_head_z")
simDR_pilot_head_phi = find_dataref("sim/graphics/view/pilots_head_phi")
simDR_pilot_head_psi = find_dataref("sim/graphics/view/pilots_head_psi")
simDR_pilot_head_the = find_dataref("sim/graphics/view/pilots_head_the")

simDR_startuprunning = find_dataref("sim/operation/prefs/startup_running")
simDR_total_ft = find_dataref("sim/time/total_flight_time_sec")
simDR_door1_open = find_dataref("sim/cockpit2/switches/custom_slider_on[4]")
simDR_sliders_rat = find_dataref("sim/flightmodel2/misc/custom_slider_ratio[4]")
simDR_ladder1_call = find_dataref("tu154b2/custom/anim/ladder_1_call")
simDR_ladder1 = find_dataref("tu154b2/custom/anim/ladder_1")



position_kvs = deferred_dataref("sim/custom/t154_camera/kvs_pos", "number")
position_2p = deferred_dataref("sim/custom/t154_camera/2p_pos", "number")
position_shtur = deferred_dataref("sim/custom/t154_camera/shtur_pos", "number")
position_eng = deferred_dataref("sim/custom/t154_camera/eng_pos", "number")
position_rad = deferred_dataref("sim/custom/t154_camera/rad_pos", "number")

walk_loc = deferred_dataref("sim/custom/t154_camera/walk", "number")
walk_spd = deferred_dataref("sim/custom/t154_camera/walk_spd", "number")
in_plane = deferred_dataref("sim/custom/t154_camera/in_plane", "number")

simDR_external_view = find_dataref("sim/graphics/view/view_is_external")


left_seat_pos = find_dataref("sim/custom/other/left_seat_pos")
right_seat_pos = find_dataref("sim/custom/other/right_seat_pos")
left_seat_move = find_dataref("sim/custom/other/left_seat_move")
right_seat_move = find_dataref("sim/custom/other/right_seat_move")
eng_seat_move = find_dataref("sim/custom/other/eng_seat_move")
navi_seat_move = find_dataref("sim/custom/other/navi_seat_move")
radio_seat_move = find_dataref("sim/custom/other/radio_seat_move")

simDR_door_1 = find_dataref("tu154b2/custom/anim/pax_door_1")
simDR_door_2 = find_dataref("tu154b2/custom/anim/pax_door_2")
simDR_door_3 = find_dataref("tu154b2/custom/anim/pax_door_3")

simDR_ladder1 = find_dataref("tu154b2/custom/anim/ladder_1")
simDR_ladder2 = find_dataref("tu154b2/custom/anim/ladder_2")
simDR_ladd1 = find_dataref("sim/custom/t154gnd/ladd1")
simDR_ladd2 = find_dataref("sim/custom/t154gnd/ladd2")
simDR_stremya1 = find_dataref("sim/custom/t154gnd/stremya1")
simDR_stremya2 = find_dataref("sim/custom/t154gnd/stremya2")
simDR_autoladder = find_dataref("sim/custom/t154gnd/autoladd")

enable_walk = deferred_dataref("sim/custom/t154_camera/enable_walk", "number")


simDR_oil_qty_cap = find_dataref("sim/custom/gauges/eng/oil_qty_cap")

local walk_disable = 0
local aircraft_loaded = 1
local kvsseat={}
kvsseat[0]=-0.486062
kvsseat[1]=0.426766
kvsseat[2]=-20.838146+(0.242563*left_seat_pos)-1.62
kvsseat[3]=1
kvsseat[4]=0.000004




local foseat={}
foseat[0]=0.506074
foseat[1]=0.426766
foseat[2]=-20.753925-1.62
foseat[3]=1
foseat[4]=0.000004




local shturseat={}
shturseat[0]=0.012037
shturseat[1]=0.426766
shturseat[2]=-20.237663-1.62
shturseat[3]=1
shturseat[4]=0.000004


local radioseat={}
radioseat[0]=-0.794214
radioseat[1]=0.487224
radioseat[2]=-19.899605-1.62
radioseat[3]=40
radioseat[4]=-1.166672

local engseat={}
engseat[0]=-0.007769
engseat[1]=0.403167
engseat[2]=-19.620485-1.62
engseat[3]=90.0
engseat[4]=-3.666672

moveto={}
local moving_on = 0
local walk_counter = 0
local diffX = 0
local diffY = 0
local diffY2 = 0
local diffZ = 0
local diffPsi = 0
local diffThe = 0
local head_pos = 0


function move_to()

    

    if simDR_startuprunning < 1 and aircraft_loaded > 0 and simDR_total_ft > 1 then
        simDR_pilot_head_x = -6.661125
        simDR_pilot_head_y = 0.87
        simDR_pilot_head_z = -17.455349-1.62
        simDR_pilot_head_psi = 90
        aircraft_loaded = 0
        in_plane = 0
        walk_loc = 1
    end

    if left_seat_move > 0 then
        kvsseat[0]=-0.564752
        kvsseat[2]=-20.544615-1.62
    else
        kvsseat[0]=-0.486062
        kvsseat[2]=-20.838146+(0.242563*left_seat_pos)-1.62
    end
    
    if right_seat_move > 0 then
        foseat[0]=0.519656
        foseat[2]=-20.624556-1.62
    else
        foseat[0]=0.506074
        foseat[1]=0.426766
        foseat[2]=-20.838146+(0.242563*right_seat_pos)-1.62
    end
    
    shturseat[2]=-20.309763+(0.242563*navi_seat_move)-1.62
    engseat[0]=0.333085-(0.5*eng_seat_move)
    radioseat[0]=-0.983106+(0.242563*radio_seat_move)



    if position_kvs > 0 then
        moveto = kvsseat
        moving_on = 1
        walk_loc = 0
    end
    if position_2p > 0 then
        moveto = foseat
        moving_on = 1
        walk_loc = 0
    end
    if position_shtur > 0 then
        moveto = shturseat
        moving_on = 1
        walk_loc = 0
    end
    if position_rad > 0 then
        moveto = radioseat
        moving_on = 1
        walk_loc = 0
    end
    if position_eng > 0 then
        moveto = engseat
        moving_on = 1
        walk_loc = 0
    end
    if moving_on > 0 then
        diffX = moveto[0]-simDR_pilot_head_x
        diffY = moveto[1]-simDR_pilot_head_y
        diffZ = moveto[2]-simDR_pilot_head_z
        if simDR_pilot_head_psi > 180 then
            diffPsi = moveto[3]-simDR_pilot_head_psi+360
        else
            diffPsi = simDR_pilot_head_psi-moveto[3]
        end
        if moveto[3]-simDR_pilot_head_psi > 180 then
            diffPsi = moveto[3]-simDR_pilot_head_psi
        else
            diffPsi = moveto[3]-simDR_pilot_head_psi
        end
        diffThe = moveto[4]-simDR_pilot_head_the

        

        
        simDR_pilot_head_x=simDR_pilot_head_x+(moveto[0]-simDR_pilot_head_x)*SIM_PERIOD*5
        simDR_pilot_head_y=simDR_pilot_head_y+(moveto[1]-simDR_pilot_head_y)*SIM_PERIOD*5
        simDR_pilot_head_z=simDR_pilot_head_z+(moveto[2]-simDR_pilot_head_z)*SIM_PERIOD*5
        simDR_pilot_head_psi=simDR_pilot_head_psi+(moveto[3]-simDR_pilot_head_psi)*SIM_PERIOD*5
        simDR_pilot_head_the=simDR_pilot_head_the+(moveto[4]-simDR_pilot_head_the)*SIM_PERIOD*5

    end
    if moving_on > 0 and math.abs(diffX)+math.abs(diffY)+math.abs(diffZ)+math.abs(diffPsi*0.1)+math.abs(diffThe*0.1) < 0.4 then
        moving_on = 0
    end
end

function walk()


    if simDR_external_view > 0 then
        walk_loc = 0
    end

    if simDR_pilot_head_z > -19.1 and walk_loc < 1 then
        walk_counter = walk_counter +2 *SIM_PERIOD
    elseif simDR_pilot_head_z > -19.176 and simDR_pilot_head_psi > 150 and simDR_pilot_head_psi < 210 and walk_loc < 1 then
        walk_counter = walk_counter +2 *SIM_PERIOD
    elseif simDR_pilot_head_y > 0.81 and simDR_pilot_head_psi > 150 and simDR_pilot_head_psi < 210 then
        walk_counter = walk_counter +2 *SIM_PERIOD
    else
        walk_counter = 0
    end

    --if walk_spd == 0 and walk_loc > 0 then
    --     walk_disable = walk_disable +2*SIM_PERIOD
    --    if walk_disable > 2 then
    --         walk_disable = 0
    --          walk_loc = 0
    --     end
    -- end

    if simDR_pilot_head_z+1.62 > -19.1 and walk_counter > 1 and walk_loc < 1 then
        if walk_spd > 0 then
            walk_loc = 1
        end
        if math.abs(simDR_pilot_head_x) < 1.78 then
            in_plane = 1
        else
            in_plane = 0
        end
    elseif simDR_pilot_head_y > 0.81 and walk_counter > 3 and walk_loc < 1  then
        if walk_spd > 0 then
            walk_loc = 1
        end
        if math.abs(simDR_pilot_head_x) < 1.78 then
            in_plane = 1
        else
            in_plane = 0
        end
    elseif  simDR_pilot_head_z+1.62 > -19.496889 and simDR_pilot_head_psi > 150 and simDR_pilot_head_psi < 210 and walk_counter > 1 and walk_loc < 1   then
        if walk_spd > 0 then
            walk_loc = 1
        end
        if math.abs(simDR_pilot_head_x) < 1.78 then
            in_plane = 1
        else
            in_plane = 0
        end
    end

    if walk_loc == 1 then
        if in_plane == 0 then
            if simDR_oil_qty_cap > 0 and simDR_pilot_head_x > -1.75 and simDR_pilot_head_x < -0.9 and simDR_pilot_head_z+1.62 > 11.5 and simDR_pilot_head_z+1.62 < 12.406537 then
                head_pos = -1.63866
            elseif math.abs(simDR_pilot_head_x) < 1 and simDR_pilot_head_z+1.62 > -25 and simDR_pilot_head_z+1.62 < 12 then
                head_pos = -2.5
            else
                head_pos = -2.286266
            end
            if simDR_stremya1 == 20 then
                if simDR_pilot_head_x > -3.13 and simDR_pilot_head_x < -2.4 and simDR_pilot_head_z+1.62 > -17.8 and simDR_pilot_head_z+1.62 < -17.3 then
                    in_plane = 1
                end
            end
            if simDR_ladd1 == 0 then
                if simDR_pilot_head_x > -7.13 and simDR_pilot_head_x < -6.4 and simDR_pilot_head_z+1.62 > -17.8 and simDR_pilot_head_z+1.62 < -17.3 then
                    in_plane = 1
                end
            end
            if simDR_ladder1 == 0 then
                if simDR_pilot_head_x > -10.13 and simDR_pilot_head_x < -8.4 and simDR_pilot_head_z+1.62 > -17.8 and simDR_pilot_head_z+1.62 < -17.3 then
                    in_plane = 1
                end
            end
            if simDR_stremya2 == 20 then
                if simDR_pilot_head_x > -3.13 and simDR_pilot_head_x < -2.4 and simDR_pilot_head_z+1.62 > -7 and simDR_pilot_head_z+1.62 < -6.3 then
                    in_plane = 1
                end
            end
            if simDR_autoladder == 20 then
                if simDR_pilot_head_x > -4.8 and simDR_pilot_head_x < -4.5 and simDR_pilot_head_z+1.62 > -7 and simDR_pilot_head_z+1.62 < -6.3 then
                    in_plane = 1
                end
            end
            if simDR_ladd2 == 0 then
                if simDR_pilot_head_x > -7.13 and simDR_pilot_head_x < -6.4 and simDR_pilot_head_z+1.62 > -7 and simDR_pilot_head_z+1.62 < -6.3 then
                    in_plane = 1
                end
            end
            if simDR_ladder2 == 0 then
                if simDR_pilot_head_x > -10.13 and simDR_pilot_head_x < -8.4 and simDR_pilot_head_z+1.62 > -7 and simDR_pilot_head_z+1.62 < -6.3 then
                    in_plane = 1
                end
            end
        end
        if in_plane == 1 then
            if simDR_pilot_head_z+1.62 > -18.3 and simDR_pilot_head_z+1.62 < -17 then 
                if simDR_door_1 == 1 and simDR_ladder1 == 0 then
                    if simDR_pilot_head_x < -2.2 then
                        if simDR_pilot_head_z+1.62 > -17.4 then
                            simDR_pilot_head_z = -17.4-1.62
                        elseif simDR_pilot_head_z+1.62 < -17.7 then
                            simDR_pilot_head_z = -17.7 -1.62
                        end
                    end
                elseif simDR_door_1 == 1 and simDR_ladd1 == 0 then
                    if simDR_pilot_head_x < -2.2 then
                        if simDR_pilot_head_z+1.62 > -17.4 then
                            simDR_pilot_head_z = -17.4-1.62
                        elseif simDR_pilot_head_z+1.62 < -17.7 then
                            simDR_pilot_head_z = -17.7-1.62
                        end
                    end
                elseif simDR_door_1 == 1 and simDR_stremya1 == 20 then
                    if simDR_pilot_head_x < -2.2 then
                        if simDR_pilot_head_z+1.62 > -17.4 then
                            simDR_pilot_head_z = -17.4-1.62
                        elseif simDR_pilot_head_z+1.62 < -17.7 then
                            simDR_pilot_head_z = -17.7 -1.62
                        end
                    end
                else
                    if simDR_pilot_head_x < -0.88 then
                        simDR_pilot_head_x  = -0.88
                    end
                end
            elseif simDR_pilot_head_z+1.62 > -7 and simDR_pilot_head_z+1.62 < -6.3 then 
                if simDR_door_2 == 1 and simDR_ladder2 == 0 then
                    if simDR_pilot_head_x < -2.2 then
                        if simDR_pilot_head_z+1.62 > -6.5 then
                            simDR_pilot_head_z = -6.5-1.62
                        elseif simDR_pilot_head_z+1.62 < -6.75 then
                            simDR_pilot_head_z = -6.75-1.62
                        end
                    end
                elseif simDR_door_2 == 1 and simDR_ladd2 == 0 then
                    if simDR_pilot_head_x < -2.2 then
                        if simDR_pilot_head_z+1.62 > -6.5 then
                            simDR_pilot_head_z = -6.5-1.62
                        elseif simDR_pilot_head_z+1.62 < -6.75 then
                            simDR_pilot_head_z = -6.75-1.62
                        end
                    end
                elseif simDR_door_2 == 1 and simDR_stremya2 == 20 then
                    if simDR_pilot_head_x < -2.2 then
                        if simDR_pilot_head_z+1.62 > -6.5 then
                            simDR_pilot_head_z = -6.5-1.62
                        elseif simDR_pilot_head_z+1.62 < -6.75 then
                            simDR_pilot_head_z = -6.7-1.62
                        end
                    end
                elseif simDR_door_2 == 1 and simDR_autoladder == 20 then
                    if simDR_pilot_head_x < -2.2 then
                        if simDR_pilot_head_z+1.62 > -6.5 then
                            simDR_pilot_head_z = -6.5-1.62
                        elseif simDR_pilot_head_z+1.62 < -6.75 then
                            simDR_pilot_head_z = -6.75-1.62
                        end
                    end
                else
                    if simDR_pilot_head_x < -0.88 then
                        simDR_pilot_head_x  = -0.88
                    end
                end
            end
            if math.abs(simDR_pilot_head_x) > 0.45 and simDR_pilot_head_z+1.62 > -16.849638 and simDR_pilot_head_z+1.62 < -8.625565 or math.abs(simDR_pilot_head_x) > 0.45 and simDR_pilot_head_z+1.62 > -5.699145 and simDR_pilot_head_z+1.62 < 7.215559 then
                head_pos = 0.44045
                walk_spd = 0
            elseif simDR_pilot_head_x < -2.2 and simDR_pilot_head_z+1.62 > -17.8 and simDR_pilot_head_z+1.62 < -17.3 then
                if simDR_ladder1 == 0 then
                    if (0.87-math.abs(2.2+simDR_pilot_head_x)*0.4) > -2.286266 then
                        head_pos = 0.87-math.abs(2.2+simDR_pilot_head_x)*0.4
                    else
                        head_pos = -2.286266
                        if simDR_pilot_head_x < -10.13 then
                          in_plane = 0
                        end
                    end
                elseif simDR_ladd1 == 0 then
                    if (0.87-math.abs(2.2+simDR_pilot_head_x)*0.8) > -2.286266 then
                        head_pos = 0.87-math.abs(2.2+simDR_pilot_head_x)*0.8
                    else
                        head_pos = -2.286266
                        if simDR_pilot_head_x < -7.13 then
                          in_plane = 0
                        end
                    end
                elseif simDR_stremya1 == 20 then
                    if (0.87-math.abs(2.2+simDR_pilot_head_x)*3) > -2.286266 then
                        head_pos = 0.87-math.abs(2.2+simDR_pilot_head_x)*3
                    else
                        head_pos = -2.286266
                        if simDR_pilot_head_x < -3.13 then
                          in_plane = 0
                        end
                    end
                end
            elseif simDR_pilot_head_x < -2.2 and simDR_pilot_head_z+1.62 > -7 and simDR_pilot_head_z+1.62 < -6.3 then
                if simDR_ladder2 == 0 then
                    if (0.87-math.abs(2.2+simDR_pilot_head_x)*0.4) > -2.286266 then
                        head_pos = 0.87-math.abs(2.2+simDR_pilot_head_x)*0.4
                    else
                        head_pos = -2.286266
                        if simDR_pilot_head_x < -10.13 then
                          in_plane = 0
                        end
                    end
                elseif simDR_ladd2 == 0 then
                    if (0.87-math.abs(2.2+simDR_pilot_head_x)*0.8) > -2.286266 then
                        head_pos = 0.87-math.abs(2.2+simDR_pilot_head_x)*0.8
                    else
                        head_pos = -2.286266
                        if simDR_pilot_head_x < -7.13 then
                          in_plane = 0
                        end
                    end
                elseif simDR_stremya2 == 20 then
                    if (0.87-math.abs(2.2+simDR_pilot_head_x)*3) > -2.286266 then
                        head_pos = 0.87-math.abs(2.2+simDR_pilot_head_x)*3
                    else
                        head_pos = -2.286266
                        if simDR_pilot_head_x < -3.13 then
                          in_plane = 0
                        end
                    end
                elseif simDR_autoladder == 0 then
                    if (0.87-math.abs(2.2+simDR_pilot_head_x)*1.3) > -2.286266 then
                        head_pos = 0.87-math.abs(2.2+simDR_pilot_head_x)*1.3
                    else
                        head_pos = -2.286266
                        if simDR_pilot_head_x < -5 then
                          in_plane = 0
                        end
                    end
                end
            else
                head_pos = 0.87
            end
            if simDR_pilot_head_z+1.62 < -20.2 then
                simDR_pilot_head_z = -20.2-1.62
            end
        end
    
        diffY2 = head_pos-simDR_pilot_head_y
        if diffY2 > 0.01 then
            simDR_pilot_head_y=simDR_pilot_head_y+math.abs(diffY2)*SIM_PERIOD*11
        elseif diffY2 < -0.01 then
            simDR_pilot_head_y=simDR_pilot_head_y-math.abs(diffY2)*SIM_PERIOD*11
        else
            simDR_pilot_head_y=head_pos
        end
    else

    end
end

function after_physics()
    if enable_walk > 0 then
        move_to()
        walk()
    end
end
