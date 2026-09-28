--replace create_command
function deferred_command(name,desc,realFunc)
	return replace_command(name,realFunc)
end
--replace deferred_dataref
function deferred_dataref(name,nilType,callFunction)
  if callFunction~=nil then
    --print("WARN:" .. name .. " is trying to wrap a function to a dataref -> use xlua")
    end
    return find_dataref(name)
end

walk_loc = deferred_dataref("sim/custom/t154_camera/walk", "number")
walk_spd = deferred_dataref("sim/custom/t154_camera/walk_spd", "number")
in_plane = deferred_dataref("sim/custom/t154_camera/in_plane", "number")
enable_walk = deferred_dataref("sim/custom/t154_camera/enable_walk", "number")

simCMD_ql0					= find_command("sim/view/quick_look_0")
simCMD_ql1					= find_command("sim/view/quick_look_1")
simCMD_ql2					= find_command("sim/view/quick_look_2")
simCMD_ql3					= find_command("sim/view/quick_look_3")
simCMD_ql4					= find_command("sim/view/quick_look_4")
simCMD_ql5					= find_command("sim/view/quick_look_5")
simCMD_ql6					= find_command("sim/view/quick_look_6")
simCMD_ql7					= find_command("sim/view/quick_look_7")
simCMD_ql8					= find_command("sim/view/quick_look_8")
simCMD_ql9					= find_command("sim/view/quick_look_9")
simCMD_ql10					= find_command("sim/view/quick_look_10")
simCMD_ql11					= find_command("sim/view/quick_look_11")
simCMD_ql12					= find_command("sim/view/quick_look_12")
simCMD_ql13					= find_command("sim/view/quick_look_13")
simCMD_ql14					= find_command("sim/view/quick_look_14")
simCMD_ql15					= find_command("sim/view/quick_look_15")
simCMD_ql16					= find_command("sim/view/quick_look_16")
simCMD_ql17					= find_command("sim/view/quick_look_17")
simCMD_ql18					= find_command("sim/view/quick_look_18")
simCMD_ql19				    = find_command("sim/view/quick_look_19")


simCMD_3d_view				    = find_command("sim/view/3d_cockpit")
simCMD_track_weapon				    = find_command("sim/view/track_weapon")

simCMD_fast_fwd = find_command("sim/general/forward_fast")
simCMD_fast_bwd = find_command("sim/general/backward_fast")
simCMD_fast_left = find_command("sim/general/left_fast")
simCMD_fast_right = find_command("sim/general/right_fast")


function ql_beforCMDhandler(phase, duration) 
	if phase == 0 then
    walk_loc = 0
    in_plane = 1
	end		
end
function ql_afterCMDhandler0(phase, duration)
  if phase == 2 and enable_walk > 0 and walk_loc > 0 then
    simCMD_ql0:once()
  end		
end
function ql_afterCMDhandler1(phase, duration)
  if phase == 2 and enable_walk > 0 and walk_loc > 0 then
    simCMD_ql1:once()
  end		
end
function ql_afterCMDhandler2(phase, duration)
  if phase == 2 and enable_walk > 0 and walk_loc > 0 then
    simCMD_ql2:once()
  end		
end
function ql_afterCMDhandler3(phase, duration)
  if phase == 2 and enable_walk > 0 and walk_loc > 0 then
    simCMD_ql3:once()
  end		
end
function ql_afterCMDhandler4(phase, duration)
  if phase == 2 and enable_walk > 0 and walk_loc > 0 then
    simCMD_ql4:once()
  end		
end
function ql_afterCMDhandler5(phase, duration)
  if phase == 2 and enable_walk > 0 and walk_loc > 0 then
    simCMD_ql5:once()
  end		
end
function ql_afterCMDhandler6(phase, duration)
  if phase == 2 and enable_walk > 0 and walk_loc > 0 then
    simCMD_ql6:once()
  end		
end
function ql_afterCMDhandler7(phase, duration)
  if phase == 2 and enable_walk > 0 and walk_loc > 0 then
    simCMD_ql7:once()
  end		
end
function ql_afterCMDhandler8(phase, duration)
  if phase == 2 and enable_walk > 0 and walk_loc > 0 then
    simCMD_ql8:once()
  end		
end
function ql_afterCMDhandler9(phase, duration)
  if phase == 2 and enable_walk > 0 and walk_loc > 0 then
    simCMD_ql9:once()
  end		
end
function ql_afterCMDhandler10(phase, duration)
  if phase == 2 and enable_walk > 0 and walk_loc > 0 then
    simCMD_ql10:once()
  end		
end
function ql_afterCMDhandler11(phase, duration)
  if phase == 2 and enable_walk > 0 and walk_loc > 0 then
    simCMD_ql11:once()
  end		
end
function ql_afterCMDhandler12(phase, duration)
  if phase == 2 and enable_walk > 0 and walk_loc > 0 then
    simCMD_ql12:once()
  end		
end
function ql_afterCMDhandler13(phase, duration)
  if phase == 2 and enable_walk > 0 and walk_loc > 0 then
    simCMD_ql13:once()
  end		
end
function ql_afterCMDhandler14(phase, duration)
  if phase == 2 and enable_walk > 0 and walk_loc > 0 then
    simCMD_ql14:once()
  end		
end
function ql_afterCMDhandler15(phase, duration)
  if phase == 2 and enable_walk > 0 and walk_loc > 0 then
    simCMD_ql15:once()
  end		
end
function ql_afterCMDhandler16(phase, duration)
  if phase == 2 and enable_walk > 0 and walk_loc > 0 then
    simCMD_ql16:once()
  end		
end
function ql_afterCMDhandler17(phase, duration)
  if phase == 2 and enable_walk > 0 and walk_loc > 0 then
    simCMD_ql17:once()
  end		
end
function ql_afterCMDhandler18(phase, duration)
  if phase == 2 and enable_walk > 0 and walk_loc > 0 then
    simCMD_ql18:once()
  end		
end
function ql_afterCMDhandler19(phase, duration)
  if phase == 2 and enable_walk > 0 and walk_loc > 0 then
    simCMD_ql19:once()
  end		
end


function thrdview_afterCMDhandler(phase, duration)
  if phase == 2 and enable_walk > 0 and walk_loc > 0 then
    simCMD_3d_view:once()
  end		
end


function weapon_track_afterCMDhandler(phase, duration)
  if phase == 2 and enable_walk > 0 and walk_loc > 0 then
    simCMD_track_weapon:once()
  end		
end

function fwd_beforCMDhandler(phase, duration) 
end

function fwd_afterCMDhandler(phase, duration)
  if phase == 0 and enable_walk > 0 then
      walk_spd = 1
  elseif phase == 1 and enable_walk > 0 then
      walk_spd = 1
  elseif phase == 2 and enable_walk > 0 then
      walk_spd = 0
  end		
end

function bwd_beforCMDhandler(phase, duration) 
end

function bwd_afterCMDhandler(phase, duration)
  if phase == 0 and enable_walk > 0 then
      walk_spd = 1
  elseif phase == 1 and enable_walk > 0 then
      walk_spd = 1
  elseif phase == 2 and enable_walk > 0 then
      walk_spd = 0
  end		
end

function left_beforCMDhandler(phase, duration) 
end

function left_afterCMDhandler(phase, duration)
  if phase == 0 and enable_walk > 0 then
      walk_spd = 1
  elseif phase == 1 and enable_walk > 0 then
      walk_spd = 1
  elseif phase == 2 and enable_walk > 0 then
      walk_spd = 0
  end		
end

function right_beforCMDhandler(phase, duration) 
end

function right_afterCMDhandler(phase, duration)
  if phase == 0 and enable_walk > 0 then
      walk_spd = 1
  elseif phase == 1 and enable_walk > 0 then
      walk_spd = 1
  elseif phase == 2 and enable_walk > 0 then
      walk_spd = 0
  end		
end




simCMD_ql0_new = wrap_command("sim/view/quick_look_0", ql_beforCMDhandler, ql_afterCMDhandler0)
simCMD_ql1_new = wrap_command("sim/view/quick_look_1", ql_beforCMDhandler, ql_afterCMDhandler1)
simCMD_ql2_new = wrap_command("sim/view/quick_look_2", ql_beforCMDhandler, ql_afterCMDhandler2)
simCMD_ql3_new = wrap_command("sim/view/quick_look_3", ql_beforCMDhandler, ql_afterCMDhandler3)
simCMD_ql4_new = wrap_command("sim/view/quick_look_4", ql_beforCMDhandler, ql_afterCMDhandler4)
simCMD_ql5_new = wrap_command("sim/view/quick_look_5", ql_beforCMDhandler, ql_afterCMDhandler5)
simCMD_ql6_new = wrap_command("sim/view/quick_look_6", ql_beforCMDhandler, ql_afterCMDhandler6)
simCMD_ql7_new = wrap_command("sim/view/quick_look_7", ql_beforCMDhandler, ql_afterCMDhandler7)
simCMD_ql8_new = wrap_command("sim/view/quick_look_8", ql_beforCMDhandler, ql_afterCMDhandler8)
simCMD_ql9_new = wrap_command("sim/view/quick_look_9", ql_beforCMDhandler, ql_afterCMDhandler9)
simCMD_ql10_new = wrap_command("sim/view/quick_look_10", ql_beforCMDhandler, ql_afterCMDhandler10)
simCMD_ql11_new = wrap_command("sim/view/quick_look_11", ql_beforCMDhandler, ql_afterCMDhandler11)
simCMD_ql12_new = wrap_command("sim/view/quick_look_12", ql_beforCMDhandler, ql_afterCMDhandler12)
simCMD_ql13_new = wrap_command("sim/view/quick_look_13", ql_beforCMDhandler, ql_afterCMDhandler13)
simCMD_ql14_new = wrap_command("sim/view/quick_look_14", ql_beforCMDhandler, ql_afterCMDhandler14)
simCMD_ql15_new = wrap_command("sim/view/quick_look_15", ql_beforCMDhandler, ql_afterCMDhandler15)
simCMD_ql16_new = wrap_command("sim/view/quick_look_16", ql_beforCMDhandler, ql_afterCMDhandler16)
simCMD_ql17_new = wrap_command("sim/view/quick_look_17", ql_beforCMDhandler, ql_afterCMDhandler17)
simCMD_ql18_new = wrap_command("sim/view/quick_look_18", ql_beforCMDhandler, ql_afterCMDhandler18)
simCMD_ql19_new = wrap_command("sim/view/quick_look_19", ql_beforCMDhandler, ql_afterCMDhandler19)


simCMD_3d_view_new = wrap_command("sim/view/3d_cockpit", ql_beforCMDhandler, thrdview_afterCMDhandler)
simCMD_track_weapon_new = wrap_command("sim/view/track_weapon", ql_beforCMDhandler, weapon_track_afterCMDhandler)


simCMD_fwd = wrap_command("sim/general/forward_fast", fwd_beforCMDhandler, fwd_afterCMDhandler)
simCMD_bwd = wrap_command("sim/general/backward_fast", bwd_beforCMDhandler, bwd_afterCMDhandler)
simCMD_left = wrap_command("sim/general/left_fast", left_beforCMDhandler, left_afterCMDhandler)
simCMD_right = wrap_command("sim/general/right_fast", right_beforCMDhandler, right_afterCMDhandler)

