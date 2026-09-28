print("Tu154B-2 v1.1.15")

--defineProperty("mem", globalPropertyf("sim/private/stats/lua/total_bytes_alloc_maximum")) -- memory count


--[[
defineProperty("frame_time", globalPropertyf("tu154b2/custom/time/frame_time")) -- time of frame

local counter = 0

function update()

	counter = counter + get(frame_time)
	
	if counter > 1 then
		counter = 0
		print(get(mem))
	end


end

--]]




--- optimize

defineProperty("optimize", globalPropertyf("sim/custom/optimize")) -- 
defineProperty("view_ext", globalPropertyf("sim/graphics/view/view_is_external")) -- 
defineProperty("cockpit_door", globalPropertyf("tu154b2/custom/anim/cockpit_door")) -- 
defineProperty("head_z", globalPropertyf("sim/graphics/view/pilots_head_z")) -- 
defineProperty("total_ft", globalPropertyf("sim/time/total_flight_time_sec")) -- 
defineProperty("walk", globalPropertyf("sim/custom/t154_camera/walk")) -- 


local head_z_loc = 0

function update()
    local ttf = get(total_ft)
    local viewext = get(view_ext)
    local cockpitdoor = get(cockpit_door)
    local walking = get(walk)
    if ttf > 10 then
        if get(head_z) < -19.14 then
            head_z_loc = 0
        else
            head_z_loc = 1
        end
        if (viewext+cockpitdoor+walking+head_z_loc) > 0 then
            set(optimize,0)
        else
            set(optimize,0)
        end
    end
end