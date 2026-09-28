-- this is engines sounds

defineProperty("frame_time", globalPropertyf("tu154b2/custom/time/frame_time")) -- flight time

defineProperty("external_view", globalPropertyi("sim/graphics/view/view_is_external")) -- enviroment


-- engines
-- No longer used to drive sound (was causing sound to reach idle before the N2 gauge did,
-- since this gauge dataref and nk8_kvd/real-N2 below aren't guaranteed to move in lockstep).
-- Left defined in case anything else in this file is added later that wants the gauge value.
defineProperty("eng1_N1_2", globalPropertyf("tu154b2/custom/gauges/engine/rpm_high_1")) -- engine 1 rpm
defineProperty("eng2_N1_2", globalPropertyf("tu154b2/custom/gauges/engine/rpm_high_2")) -- engine 2 rpm
defineProperty("eng3_N1_2", globalPropertyf("tu154b2/custom/gauges/engine/rpm_high_3")) -- engine 3 rpm

-- nk8_kvd1/2/3: real (РЛЭ) N2 %, written every frame by rud_logic.lua (kvd1 = n2_native_to_real(rpm1),
-- then set(sc_kvd1, kvd1)) -- this is the controller's own authoritative N2, now used to drive sound.
defineProperty("eng1_N1", globalPropertyf("tu154b2/custom/SC/engine/nk8_kvd1"))
defineProperty("eng2_N1", globalPropertyf("tu154b2/custom/SC/engine/nk8_kvd2"))
defineProperty("eng3_N1", globalPropertyf("tu154b2/custom/SC/engine/nk8_kvd3"))


defineProperty("apd_working_1", globalPropertyf("tu154b2/custom/start/apd_working_1")) -- работа системы запуска
defineProperty("apd_working_2", globalPropertyf("tu154b2/custom/start/apd_working_2")) -- работа системы запуска
defineProperty("apd_working_3", globalPropertyf("tu154b2/custom/start/apd_working_3")) -- работа системы запуска


defineProperty("eng_working_1", globalProperty("sim/flightmodel2/engines/engine_is_burning_fuel[0]"))
defineProperty("eng_working_2", globalProperty("sim/flightmodel2/engines/engine_is_burning_fuel[1]"))
defineProperty("eng_working_3", globalProperty("sim/flightmodel2/engines/engine_is_burning_fuel[2]"))


defineProperty("apu_n1", globalPropertyf("tu154b2/custom/eng/apu_n1")) -- обороты ВСУ

-- camera position
defineProperty("cam_HDG", globalPropertyf("sim/graphics/view/view_heading")) -- CW from true north
defineProperty("cam_X", globalPropertyf("sim/graphics/view/view_x")) -- The location of the camera, X coordinate (OpenGL)
defineProperty("cam_Y", globalPropertyf("sim/graphics/view/view_y")) -- The location of the camera, Y coordinate (OpenGL)
defineProperty("cam_Z", globalPropertyf("sim/graphics/view/view_z")) -- The location of the camera, Z coordinate (OpenGL)


-- pilot head
defineProperty("pilot_hdg", globalPropertyf("sim/graphics/view/pilots_head_psi")) -- CW from forward in cockpit
defineProperty("pilot_X", globalPropertyf("sim/aircraft/view/acf_peX")) -- Position of pilot's head relative to CG
defineProperty("pilot_Y", globalPropertyf("sim/aircraft/view/acf_peY")) -- Position of pilot's head relative to CG
defineProperty("pilot_Z", globalPropertyf("sim/aircraft/view/acf_peZ")) -- Position of pilot's head relative to CG


-- acf position
defineProperty("acf_hdg", globalPropertyf("sim/flightmodel/position/psi")) -- degrees	The true heading of the aircraft in degrees from the Z axis - OpenGL coordinates
defineProperty("acf_X", globalPropertyf("sim/flightmodel/position/local_x")) -- The location of the plane in OpenGL coordinates
defineProperty("acf_Y", globalPropertyf("sim/flightmodel/position/local_y")) -- The location of the plane in OpenGL coordinates
defineProperty("acf_Z", globalPropertyf("sim/flightmodel/position/local_z")) -- The location of the plane in OpenGL coordinates

defineProperty("cockpit_window_left", globalPropertyf("tu154b2/custom/anim/cockpit_window_left")) -- открытие форточки
defineProperty("cockpit_window_right", globalPropertyf("tu154b2/custom/anim/cockpit_window_right")) -- открытие форточки

defineProperty("pax_door_1", globalPropertyf("tu154b2/custom/anim/pax_door_1")) -- положение передних пасс дверей
defineProperty("pax_door_2", globalPropertyf("tu154b2/custom/anim/pax_door_2")) -- положение средних пасс дверей
defineProperty("pax_door_3", globalPropertyf("tu154b2/custom/anim/pax_door_3")) -- положение правых аварийных дверей

defineProperty("cockpit_door", globalPropertyf("tu154b2/custom/anim/cockpit_door")) -- положение правых аварийных дверей


defineProperty("eng_main_vol", globalPropertyf("sim/operation/sound/engine_volume_ratio")) -- регулятор громкости для двигателей
defineProperty("main_sound_on", globalPropertyi("sim/operation/sound/sound_on")) -- выключатель звука

defineProperty("revers_flap_L", globalProperty("sim/flightmodel2/engines/thrust_reverser_deploy_ratio[0]")) -- reverse on left engine
defineProperty("revers_flap_R", globalProperty("sim/flightmodel2/engines/thrust_reverser_deploy_ratio[2]")) -- reverse on right engine
defineProperty("thrust_L", globalProperty("sim/cockpit2/engine/indicators/thrust_dry_n[0]"))
defineProperty("thrust_M", globalProperty("sim/cockpit2/engine/indicators/thrust_dry_n[1]"))
defineProperty("thrust_R", globalProperty("sim/cockpit2/engine/indicators/thrust_dry_n[2]"))
defineProperty("snd_rho", globalPropertyf("sim/weather/rho")) -- air density, for the blast layers
defineProperty("snd_knd_1", globalPropertyf("tu154b2/custom/engines/knd_1")) -- N1 state published by engine_gauges (for fan rattle)
defineProperty("snd_knd_3", globalPropertyf("tu154b2/custom/engines/knd_3"))
-- N1 (КНД) gauge values in %, used by the FS2004 soundset experiment below
defineProperty("snd_n1_1", globalPropertyf("tu154b2/custom/gauges/engine/rpm_low_1"))
defineProperty("snd_n1_2", globalPropertyf("tu154b2/custom/gauges/engine/rpm_low_2"))
defineProperty("snd_n1_3", globalPropertyf("tu154b2/custom/gauges/engine/rpm_low_3"))
-- deice


defineProperty("deice_started", globalPropertyi("tu154b2/custom/anim/deice2")) 
defineProperty("mil_tech", globalPropertyi("sim/custom/t154cfg/hide_mil")) 
defineProperty("vr_outside", globalPropertyi("sim/graphics/VR/teleport_on_ground"))
defineProperty("pilot_head", globalPropertyi("sim/graphics/view/pilots_head_psi"))
-- defineProperty("db1", globalPropertyf("tu154b2/custom/controlls/debug1"))
-- defineProperty("db2", globalPropertyf("tu154b2/custom/controlls/debug2"))
-- defineProperty("db3", globalPropertyf("tu154b2/custom/controlls/debug3"))


local deice_out_L = loadSample(moduleDirectory .. '/Custom Sounds/new_snds/deice_out_L.wav')
local deice_out_R = loadSample(moduleDirectory .. '/Custom Sounds/new_snds/deice_out_R.wav')


-- sounds files
local inn_middle_left_1 = loadSample(moduleDirectory .. '/Custom Sounds/engines/inn_middle_left.wav')
local inn_middle_right_1 = loadSample(moduleDirectory .. '/Custom Sounds/engines/inn_middle_right.wav')
local inn_starter_left_new_1 = loadSample(moduleDirectory .. '/Custom Sounds/engines/inn_starter_left_new.wav')
local inn_starter_right_new_1 = loadSample(moduleDirectory .. '/Custom Sounds/engines/inn_starter_right_new.wav')
local out_behind_left_1 = loadSample(moduleDirectory .. '/Custom Sounds/engines/out_behind_left.wav')
local out_behind_right_1 = loadSample(moduleDirectory .. '/Custom Sounds/engines/out_behind_right.wav')
local out_idle_left_1 = loadSample(moduleDirectory .. '/Custom Sounds/engines/out_idle_left.wav')
local out_idle_right_1 = loadSample(moduleDirectory .. '/Custom Sounds/engines/out_idle_right.wav')

-- out_high: B's high-power jet layer (brought back 2026-09-20). Globals on purpose (Lua local/upvalue limits).
out_high_left_1  = loadSample(moduleDirectory .. '/Custom Sounds/engines/out_high_left.wav')
out_high_right_1 = loadSample(moduleDirectory .. '/Custom Sounds/engines/out_high_right.wav')
out_high_left_2  = loadSample(moduleDirectory .. '/Custom Sounds/engines/out_high_left.wav')
out_high_right_2 = loadSample(moduleDirectory .. '/Custom Sounds/engines/out_high_right.wav')
out_high_left_3  = loadSample(moduleDirectory .. '/Custom Sounds/engines/out_high_left.wav')
out_high_right_3 = loadSample(moduleDirectory .. '/Custom Sounds/engines/out_high_right.wav')
-- Gain: develops from idle N2 (~60%) up to full at 98, instead of staying silent until 70.
-- Pitch: starts rising from the same idle point, 850 -> 1200 at N2 98.
-- 2026-09-25: +10% above 80% N2 (boost blended in over 80-82% so there is no jump); below 80% unchanged
out_high_gain_tbl  = {{-100, 0}, {60, 0}, {80, 526.3}, {82, 636.8}, {98, 1100}, {10000, 1100}}
out_high_pitch_tbl = {{-100, 850}, {60, 850}, {98, 1200}, {10000, 1200}}
-- overall level of the out_high layer (1.0 = B's level; lower it if takeoff power is too loud)
-- level of the out_idle layer, cockpit (open doors/windows) and outside (2026-09-24: idle a bit louder, was 1.0)
-- 2026-09-27: ENGINE RUNNING SOUNDS -30% (cockpit + outside). One master trim for the running layers:
-- inn_middle (cockpit), out_idle (outside + heard through open doors/windows in the cockpit),
-- out_behind (outside rear), out_high whine (outside) -- incl. their N1-layer copies.
-- NOT touched: starters, APU, reverse, shutdown one-shot, blast, fan rattle, de-ice.
-- 1.0 = previous level, 0.70 = 30% quieter.
ENG_VOL_TRIM = 0.70
INN_MIDDLE_LEVEL = 1.012 -- cockpit inn_middle only (on top of ENG_VOL_TRIM). 2026-09-27: +10% (was 0.92; before that 0.80 after an earlier -20%)
out_idle_level = 1.15 * ENG_VOL_TRIM -- 1.15 = previous level
out_high_level = 0.44 * ENG_VOL_TRIM -- 2026-09-25: -20% (was 0.55) -- 2026-09-24: whine kept below out_idle (was 1.0; out_high max is now 550 vs out_idle ~1600 at takeoff)

-- Blast (rear jet noise) and fan rattle: B's layers from engine_whine.lua, brought back 2026-09-20.
-- Globals on purpose (Lua local/upvalue limits). Outside view only; silent in the cockpit.
blast_full_1_L = loadSample(moduleDirectory .. '/Custom Sounds/engines/blast_full_L.wav')
blast_full_1_R = loadSample(moduleDirectory .. '/Custom Sounds/engines/blast_full_R.wav')
blast_low_1_L = loadSample(moduleDirectory .. '/Custom Sounds/engines/blast_low_L.wav')
blast_low_1_R = loadSample(moduleDirectory .. '/Custom Sounds/engines/blast_low_R.wav')
blast_far_1_L = loadSample(moduleDirectory .. '/Custom Sounds/engines/blast_far_L_new.wav')
blast_far_1_R = loadSample(moduleDirectory .. '/Custom Sounds/engines/blast_far_R_new.wav')
blast_full_2_L = loadSample(moduleDirectory .. '/Custom Sounds/engines/blast_full_L.wav')
blast_full_2_R = loadSample(moduleDirectory .. '/Custom Sounds/engines/blast_full_R.wav')
blast_low_2_L = loadSample(moduleDirectory .. '/Custom Sounds/engines/blast_low_L.wav')
blast_low_2_R = loadSample(moduleDirectory .. '/Custom Sounds/engines/blast_low_R.wav')
blast_far_2_L = loadSample(moduleDirectory .. '/Custom Sounds/engines/blast_far_L.wav')
blast_far_2_R = loadSample(moduleDirectory .. '/Custom Sounds/engines/blast_far_R.wav')
blast_full_3_L = loadSample(moduleDirectory .. '/Custom Sounds/engines/blast_full_L.wav')
blast_full_3_R = loadSample(moduleDirectory .. '/Custom Sounds/engines/blast_full_R.wav')
blast_low_3_L = loadSample(moduleDirectory .. '/Custom Sounds/engines/blast_low_L.wav')
blast_low_3_R = loadSample(moduleDirectory .. '/Custom Sounds/engines/blast_low_R.wav')
blast_far_3_L = loadSample(moduleDirectory .. '/Custom Sounds/engines/blast_far_L.wav')
blast_far_3_R = loadSample(moduleDirectory .. '/Custom Sounds/engines/blast_far_R.wav')
rattle_L_1 = loadSample(moduleDirectory .. '/Custom Sounds/engines/fan_rattle_L.wav')
rattle_R_1 = loadSample(moduleDirectory .. '/Custom Sounds/engines/fan_rattle_R.wav')
rattle_L_3 = loadSample(moduleDirectory .. '/Custom Sounds/engines/fan_rattle_L.wav')
rattle_R_3 = loadSample(moduleDirectory .. '/Custom Sounds/engines/fan_rattle_R.wav')
-- B's tables. Keyed on thrust per engine in N, corrected to sea-level density (thrust * 1.225 / rho).
far_gain_tbl  = {{-1000, 0}, {15000, 0}, {80000, 1}, {200000, 1}}
full_gain_tbl = {{-1000, 0}, {20000, 0}, {80000, 1}, {200000, 1}}
low_gain_tbl  = {{-1000, 0}, {5000, 0}, {60000, 1}, {100000, 0.5}, {200000, 0.5}}
low_pitch_tbl = {{-1000, 0}, {5000, 1}, {100000, 2}, {200000, 0.5}}
-- overall levels (1.0 = B's level)
blast_level = 1.0 -- 2026-09-24: back to 1.0 (was briefly 0.8)
rattle_level = 1.0
local out_starter_left_1 = loadSample(moduleDirectory .. '/Custom Sounds/engines/out_starter_left_new.wav')
local out_starter_right_1 = loadSample(moduleDirectory .. '/Custom Sounds/engines/out_starter_right_new.wav')

local inn_middle_left_2 = loadSample(moduleDirectory .. '/Custom Sounds/engines/inn_middle_left.wav')
local inn_middle_right_2 = loadSample(moduleDirectory .. '/Custom Sounds/engines/inn_middle_right.wav')
local inn_starter_left_new_2 = loadSample(moduleDirectory .. '/Custom Sounds/engines/inn_starter_left_new.wav')
local inn_starter_right_new_2 = loadSample(moduleDirectory .. '/Custom Sounds/engines/inn_starter_right_new.wav')
local out_behind_left_2 = loadSample(moduleDirectory .. '/Custom Sounds/engines/out_behind_left.wav')
local out_behind_right_2 = loadSample(moduleDirectory .. '/Custom Sounds/engines/out_behind_right.wav')
local out_idle_left_2 = loadSample(moduleDirectory .. '/Custom Sounds/engines/out_idle_left.wav')
local out_idle_right_2 = loadSample(moduleDirectory .. '/Custom Sounds/engines/out_idle_right.wav')
local out_starter_left_2 = loadSample(moduleDirectory .. '/Custom Sounds/engines/out_starter_left_new.wav')
local out_starter_right_2 = loadSample(moduleDirectory .. '/Custom Sounds/engines/out_starter_right_new.wav')

local inn_middle_left_3 = loadSample(moduleDirectory .. '/Custom Sounds/engines/inn_middle_left.wav')
local inn_middle_right_3 = loadSample(moduleDirectory .. '/Custom Sounds/engines/inn_middle_right.wav')
local inn_starter_left_new_3 = loadSample(moduleDirectory .. '/Custom Sounds/engines/inn_starter_left_new.wav')
local inn_starter_right_new_3 = loadSample(moduleDirectory .. '/Custom Sounds/engines/inn_starter_right_new.wav')
local out_behind_left_3 = loadSample(moduleDirectory .. '/Custom Sounds/engines/out_behind_left.wav')
local out_behind_right_3 = loadSample(moduleDirectory .. '/Custom Sounds/engines/out_behind_right.wav')
local out_idle_left_3 = loadSample(moduleDirectory .. '/Custom Sounds/engines/out_idle_left.wav')
local out_idle_right_3 = loadSample(moduleDirectory .. '/Custom Sounds/engines/out_idle_right.wav')
local out_starter_left_3 = loadSample(moduleDirectory .. '/Custom Sounds/engines/out_starter_left_new.wav')
local out_starter_right_3 = loadSample(moduleDirectory .. '/Custom Sounds/engines/out_starter_right_new.wav')

local inn_apu_left = loadSample(moduleDirectory .. '/Custom Sounds/engines/inn_apu_left.wav')
local inn_apu_right = loadSample(moduleDirectory .. '/Custom Sounds/engines/inn_apu_right.wav')
local out_apu_left = loadSample(moduleDirectory .. '/Custom Sounds/engines/out_apu_left.wav')
local out_apu_right = loadSample(moduleDirectory .. '/Custom Sounds/engines/out_apu_right.wav')

local out_reverse_L = loadSample(moduleDirectory .. '/Custom Sounds/engines/out_reverse_left.wav')
local out_reverse_R = loadSample(moduleDirectory .. '/Custom Sounds/engines/out_reverse_right.wav')
local inn_reverse = loadSample(moduleDirectory .. '/Custom Sounds/engines/inn_reverse.wav')

-- =====================================================================================
-- FS2004 SOUNDSET EXPERIMENT (2026-09-24)
-- Tu-154M D-30KU soundset by Mike Maarse / Dmitry Kolesnik (2005), layer curves taken 1:1
-- from its sound.cfg. Each layer = one recorded sample with its own volume curve (vparams)
-- and pitch curve (rparams), crossfaded by RPM. COMBUSTION layers follow N1, JET_WHINE
-- layers follow N2 (RPM as 0..1 fraction of real %).
-- When ON, these replace the engine running sounds (inn_middle, out_idle, out_behind,
-- out_high, blast). Starters, APU, reverse, fan rattle and de-ice are NOT touched.
-- Set FS9_ENGINE_SOUNDS = false to go back to the previous engine sounds exactly.
-- Engine 1 = "A" samples (ban/xban), engine 3 = "B" samples (bbn/xbbn),
-- engine 2 = "A" samples slightly detuned so it doesn't phase with engine 1.
-- =====================================================================================
FS9_ENGINE_SOUNDS = false  -- 2026-09-24: experiment switched OFF (did not sound good)
FS9_INN_LEVEL   = 600    -- cockpit level at 100% layer volume (old inn_middle used 700)
FS9_EXT_LEVEL   = 1000   -- outside level at 100% layer volume (old out_idle used 1200)
FS9_ENG_SCALE   = 0.816  -- FS9 mixed 2 engines, we have 3: sqrt(2/3) keeps total loudness
FS9_ENG2_DETUNE = 1.015  -- engine 2 pitch offset
FS9_WHINE_KEY   = "n2"   -- "n2" (default) or "n1" if the whine should follow N1 instead

-- 2026-09-24: the cockpit set (ban/bbn) was dropped for quality -- the outside-recorded xban/xbbn
-- samples now play in BOTH views, each with its own original sound.cfg curves. Only the level
-- and placement change with the view; Doppler is applied outside only.
-- {sample A, sample B, viewpoint (kept for reference), key, rparams, vparams}
fs9_layers = {
	-- outside-recorded samples, used in BOTH cockpit and outside view (2026-09-24 swap)
	{"xban11","xbbn11",2,"whine",{0.397351,0.93617,0.79691,1.106383},{0.005,0, 0.285,15.957, 0.401766,17.021276, 0.479029,30.851065, 0.611479,36.170212, 0.710817,11.702127, 0.8,0}},
	{"xban12","xbbn12",2,"whine",{0.5,0.9,0.85,1.2},{0.5,0, 0.580574,12.765958, 0.635762,38.297871, 0.699779,41.489361, 0.775,22.34, 0.85,0}},
	{"xban13","xbbn13",2,"whine",{0.65,0.8,1.0,1.0},{0.55,0, 0.65,6.383, 0.717,42.553, 0.77,47.872, 1.0,10}},
	{"xban14","xbbn14",2,"whine",{0.7,0.8,1.0,1.0},{0.7,0, 0.788079,50, 1.0,100}},
	{"xban21","xbbn21",2,"comb",{0.625,0.975,0.8,1.5},{0,0, 0.298,11.702, 0.419,23.404, 0.494,59.574, 0.687,62.766, 0.751,7.447, 0.8,0}},
	{"xban22","xbbn22",2,"comb",{0.675,0.9,0.85,2.0},{0.6,0, 0.68,12.766, 0.711,62.766, 0.737,63.83, 0.781,11.702, 0.85,0}},
	{"xban23","xbbn23",2,"comb",{0.75,0.8,1.0,1.25},{0.7,0, 0.744,22.34, 0.759,63.83, 0.865,70.213, 0.918,24.468, 1.0,5}},
	{"xban24","xbbn24",2,"comb",{0.8,0.8,1.0,1.0},{0.8,0, 0.883002,71.276596, 1.0,100}},
	{"XBAN2T","XBBN2T",2,"comb",{0,1,0,1},{0,0, 0.238,86.4, 0.998,100, 1.0,100.6}},
}

-- FS9 rparams: rate held below/above the two points, linear in between
function fs9_rate(r, x)
	if r[3] <= r[1] then return r[2] end
	if x <= r[1] then return r[2] end
	if x >= r[3] then return r[4] end
	return r[2] + (r[4] - r[2]) * (x - r[1]) / (r[3] - r[1])
end

-- FS9 vparams: (rpm, volume %) pairs, linear in between, held outside
function fs9_vol(v, x)
	local n = #v / 2
	if x <= v[1] then return v[2] end
	for i = 1, n - 1 do
		local x0, y0, x1, y1 = v[2*i-1], v[2*i], v[2*i+1], v[2*i+2]
		if x <= x1 then
			if x1 <= x0 then return y1 end
			return y0 + (y1 - y0) * (x - x0) / (x1 - x0)
		end
	end
	return v[2*n]
end

function fs9_ok(smp)
	return smp ~= nil and smp ~= 0
end

fs9_snd = {{}, {}, {}}
if FS9_ENGINE_SOUNDS then
	for e = 1, 3 do
		for i, L in ipairs(fs9_layers) do
			local name = L[1]
			if e == 3 then name = L[2] end
			local smp = loadSample(moduleDirectory .. '/Custom Sounds/engines/' .. name .. '.wav')
			fs9_snd[e][i] = smp
			if fs9_ok(smp) then
				playSample(smp, true)
				setSampleGain(smp, 0)
			end
		end
	end
end

-- N1 IDLE LAYER (2026-09-25)
-- A second copy of the idle sounds (cockpit inn_middle, outside out_idle incl. open doors/windows),
-- driven by N1 (fan, KND gauge) instead of N2. N1 is mapped onto the N2 idle->takeoff range
-- (N1 30% idle -> N2 60.5%, N1 87% takeoff -> N2 96%) and then uses the same volume and pitch curves,
-- so at steady power both layers sit together; during power changes and at altitude (idle N1 63% vs
-- N2 78%) the N1 layer moves on its own. Pitch is scaled by N1_PITCH_SCALE so the two copies of the
-- same recording don't phase against each other. Same placement, spool-down tail, start fade-in
-- (IDLE_START_DELAY) and mute as the N2 layer.
N1_LAYER_LEVEL = 0.3    -- volume of the N1 layer relative to the N2 idle layer (2026-09-27: back on at 0.3, OUTSIDE VIEW ONLY -- silent in the cockpit; original 0.5)
N1_PITCH_SCALE = 0.85   -- pitch of the N1 layer relative to the N2 layer at the same power
es_n1_map_tbl = {{-100, 0}, {0, 0}, {30, 60.5}, {87, 96}, {100, 104}, {10000, 104}}
es_n1_inn = {}
es_n1_out = {}
for e = 1, 3 do
	es_n1_inn[e] = {
		loadSample(moduleDirectory .. '/Custom Sounds/engines/inn_middle_left.wav'),
		loadSample(moduleDirectory .. '/Custom Sounds/engines/inn_middle_right.wav'),
	}
	es_n1_out[e] = {
		loadSample(moduleDirectory .. '/Custom Sounds/engines/out_idle_left.wav'),
		loadSample(moduleDirectory .. '/Custom Sounds/engines/out_idle_right.wav'),
	}
	for k = 1, 2 do
		playSample(es_n1_inn[e][k], true)  setSampleGain(es_n1_inn[e][k], 0)
		playSample(es_n1_out[e][k], true)  setSampleGain(es_n1_out[e][k], 0)
	end
end
es_n1_gain_inn  = {0, 0, 0}
es_n1_gain_out  = {0, 0, 0}
es_n1_pitch_inn = {1000, 1000, 1000}
es_n1_pitch_out = {1000, 1000, 1000}

-- ENGINE SHUTDOWN SOUND (2026-09-24)
-- One-shot XBBN2SHUT.wav, played the moment an engine stops burning fuel (fuel cut / shutdown)
-- while it was actually running (N2 above SHUT_MIN_N2). One instance per engine, so shutting
-- down two engines close together plays two sounds. Outside: placed at each engine + Doppler.
-- Cockpit: SHUT_INN_LEVEL. Does not touch reverse, starter or running layers.
SHUT_INN_LEVEL = 224    -- cockpit level (2026-09-27: -20%, was 280; 2026-09-24: -20%, was 350)
SHUT_EXT_LEVEL = 800    -- outside level (2026-09-24: -20%, was 1000)
SHUT_MIN_N2    = 45     -- % real N2; below this a fuel cut does not count as a shutdown (e.g. aborted start)
shut_snd = {
	loadSample(moduleDirectory .. '/Custom Sounds/engines/XBBN2SHUT.wav'),
	loadSample(moduleDirectory .. '/Custom Sounds/engines/XBBN2SHUT.wav'),
	loadSample(moduleDirectory .. '/Custom Sounds/engines/XBBN2SHUT.wav'),
}
for e = 1, 3 do
	if shut_snd[e] and shut_snd[e] ~= 0 then setSampleGain(shut_snd[e], 0) end
end
shut_burn_last = {-1, -1, -1}

-- play all sounds
playSample(inn_middle_left_1, true)
playSample(inn_middle_right_1, true)
playSample(out_behind_left_1, true)
playSample(out_behind_right_1, true)
playSample(out_idle_left_1, true)
playSample(out_idle_right_1, true)
playSample(out_high_left_1, true)
playSample(out_high_right_1, true)
playSample(out_high_left_2, true)
playSample(out_high_right_2, true)
playSample(out_high_left_3, true)
playSample(out_high_right_3, true)
playSample(blast_full_1_L, true)
playSample(blast_full_1_R, true)
playSample(blast_low_1_L, true)
playSample(blast_low_1_R, true)
playSample(blast_far_1_L, true)
playSample(blast_far_1_R, true)
playSample(blast_full_2_L, true)
playSample(blast_full_2_R, true)
playSample(blast_low_2_L, true)
playSample(blast_low_2_R, true)
playSample(blast_far_2_L, true)
playSample(blast_far_2_R, true)
playSample(blast_full_3_L, true)
playSample(blast_full_3_R, true)
playSample(blast_low_3_L, true)
playSample(blast_low_3_R, true)
playSample(blast_far_3_L, true)
playSample(blast_far_3_R, true)
playSample(rattle_L_1, true)
playSample(rattle_R_1, true)
playSample(rattle_L_3, true)
playSample(rattle_R_3, true)

playSample(inn_middle_left_2, true)
playSample(inn_middle_right_2, true)
playSample(out_behind_left_2, true)
playSample(out_behind_right_2, true)
playSample(out_idle_left_2, true)
playSample(out_idle_right_2, true)

playSample(inn_middle_left_3, true)
playSample(inn_middle_right_3, true)
playSample(out_behind_left_3, true)
playSample(out_behind_right_3, true)
playSample(out_idle_left_3, true)
playSample(out_idle_right_3, true)

playSample(inn_apu_left, true)
playSample(inn_apu_right, true)
playSample(out_apu_left, true)
playSample(out_apu_right, true)


playSample(inn_reverse, true)
playSample(out_reverse_L, true)
playSample(out_reverse_R, true)
		
setSampleGain(out_behind_left_1, 0)
setSampleGain(out_behind_right_1, 0)
setSampleGain(out_idle_left_1, 0)
setSampleGain(out_idle_right_1, 0)
setSampleGain(out_high_left_1, 0)
setSampleGain(out_high_right_1, 0)
setSampleGain(out_high_left_2, 0)
setSampleGain(out_high_right_2, 0)
setSampleGain(out_high_left_3, 0)
setSampleGain(out_high_right_3, 0)
setSampleGain(blast_full_1_L, 0)
setSampleGain(blast_full_1_R, 0)
setSampleGain(blast_low_1_L, 0)
setSampleGain(blast_low_1_R, 0)
setSampleGain(blast_far_1_L, 0)
setSampleGain(blast_far_1_R, 0)
setSampleGain(blast_full_2_L, 0)
setSampleGain(blast_full_2_R, 0)
setSampleGain(blast_low_2_L, 0)
setSampleGain(blast_low_2_R, 0)
setSampleGain(blast_far_2_L, 0)
setSampleGain(blast_far_2_R, 0)
setSampleGain(blast_full_3_L, 0)
setSampleGain(blast_full_3_R, 0)
setSampleGain(blast_low_3_L, 0)
setSampleGain(blast_low_3_R, 0)
setSampleGain(blast_far_3_L, 0)
setSampleGain(blast_far_3_R, 0)
setSampleGain(rattle_L_1, 0)
setSampleGain(rattle_R_1, 0)
setSampleGain(rattle_L_3, 0)
setSampleGain(rattle_R_3, 0)
setSampleGain(out_starter_left_1, 0)
setSampleGain(out_starter_right_1, 0)
		
setSampleGain(out_behind_left_2, 0)
setSampleGain(out_behind_right_2, 0)
setSampleGain(out_idle_left_2, 0)
setSampleGain(out_idle_right_2, 0)
setSampleGain(out_starter_left_2, 0)
setSampleGain(out_starter_right_2, 0)
		
setSampleGain(out_behind_left_3, 0)
setSampleGain(out_behind_right_3, 0)
setSampleGain(out_idle_left_3, 0)
setSampleGain(out_idle_right_3, 0)
setSampleGain(out_starter_left_3, 0)
setSampleGain(out_starter_right_3, 0)
		
setSampleGain(inn_middle_left_1, 0)
setSampleGain(inn_middle_right_1, 0)
setSampleGain(inn_starter_left_new_1, 0)
setSampleGain(inn_starter_right_new_1, 0)
	
setSampleGain(inn_middle_left_2, 0)
setSampleGain(inn_middle_right_2, 0)
setSampleGain(inn_starter_left_new_2, 0)
setSampleGain(inn_starter_right_new_2, 0)
		
setSampleGain(inn_middle_left_3, 0)
setSampleGain(inn_middle_right_3, 0)
setSampleGain(inn_starter_left_new_3, 0)
setSampleGain(inn_starter_right_new_3, 0)		
		
setSampleGain(inn_apu_left, 0)
setSampleGain(inn_apu_right, 0)
setSampleGain(out_apu_left, 0)
setSampleGain(out_apu_right, 0)

setSampleGain(inn_reverse, 0)
setSampleGain(out_reverse_L, 0)
setSampleGain(out_reverse_R, 0)


es_rpm2gain_tbl = {
{0, 0},
--{10, 0.2},
{50, 0.7},
{100, 1},
{10000, 1}
}
local rpm2gain_tbl2 = {
{0, 0},
{10, 0.1},
{50, 0.7},
{100, 1},
{10000, 1}
} -- was a dip-to-zero-at-95% B "blast crossfade" table (suppressed out_idle above 70%
  -- to make room for engine_whine.lua's blast sound); now matches M donor's own
  -- engines_sound.lua curve exactly (M doesn't have a separate idle-dip table at all -
  -- it uses this same single non-dipping curve for out_idle as for every other component)

-- Exterior pitch uses the SAME table as the cockpit (es_inn_pitch_tbl below), so inside and outside
-- engine sounds follow RPM identically; there is no separate exterior pitch table any more.

-- 2026-09-24: pitch now changes EVENLY from idle (60.5% N2) to takeoff (96% N2), so the sound
-- follows the N2 gauge all the way down. The old table ({70,1000},{100,2300}) put ~85% of the
-- pitch change above 72% N2, so the sound reached "idle" at ~72% while the gauge still had 12% to go.
-- Idle and takeoff pitch are unchanged (912 / 2127); only the shape in between is different.
-- 2026-09-24: out_idle layer ONLY keeps the previous top (96% -> 2127, 100% -> 2266);
-- every other layer uses es_inn_pitch_tbl below. Idle pitch (60.5% -> 912) is the same in both.
es_out_idle_pitch_tbl = 
{
{0, 200},
{5, 400},
{60.5, 912},
{96, 2127},
{100, 2266},
{10000, 1}
}

es_inn_pitch_tbl = 
{
{0, 200},
{5, 400},
{60.5, 912},
{96, 2446},   -- 2026-09-24: +15% pitch at the top (was 2127); idle pitch unchanged, so the
{100, 2619},  -- rise from idle is steeper. Same table for cockpit and outside (they stay matched).
{10000, 1}
}

-- 2026-09-24: outside blast/rear layers were keyed on real thrust, which collapses much faster than
-- N2 on power reduction, so the roar died long before the gauge reached idle. They now use a thrust
-- equivalent that scales LINEARLY with real N2: idle 60.5% -> 5,000 N, takeoff 96% -> 105,716 N
-- (10,780 kgf). Same loudness at idle and takeoff as before; follows N2 in between.
local n2_equiv_thrust_tbl = {{-100, 0}, {0, 0}, {60.5, 5000}, {96, 105716}, {10000, 105716}}
local function n2_equiv_thrust(n2)
	return interpolate(n2_equiv_thrust_tbl, n2)
end

local cam_hd = get(cam_HDG)
local acf_hd = get(acf_hdg)

local cam_x = get(cam_X)
local cam_y = get(cam_Y)
local cam_z = get(cam_Z)
	
local acf_x = get(acf_X)
local acf_y = get(acf_Y)
local acf_z = get(acf_Z)


local function out_balance (src_x, src_z, src_hdg, src_cone, fade_deg, fade_dist)


	-- need to calculate the world location of the sound source
	local hdg_rad = math.rad(acf_hd)
	local x_s = acf_x + src_x * math.cos(hdg_rad) - src_z * math.sin(hdg_rad)
	local z_s = acf_z + src_x * math.sin(hdg_rad) + src_z * math.cos(hdg_rad)
	
	
	local angle2source = cam_hd + math.deg(math.atan2(cam_x - x_s, cam_z - z_s)) -- angle from camera to the source
	
	while angle2source > 180 do angle2source = angle2source - 360 end
	while angle2source < -180 do angle2source = angle2source + 360 end
	
	local angle2cam = math.deg(math.atan2(cam_x - x_s, cam_z - z_s)) + acf_hd + src_hdg - 180 -- angle from source to camera
	
	while angle2cam > 180 do angle2cam = angle2cam - 360 end
	while angle2cam < -180 do angle2cam = angle2cam + 360 end
	
	local dist = math.sqrt(math.pow(x_s - cam_x, 2) + math.pow(z_s - cam_z, 2) + math.pow(cam_y - acf_y, 2))
	
	if dist < 1 then dist = 1 end
	
	local dist_coef = fade_dist / dist ^ 1.6
	if dist_coef > 1.5 then dist_coef = 1.5 end
	
	local cone_angle = math.abs(angle2cam)
	
	while cone_angle > 180 do cone_angle = cone_angle - 360 end
	--while cone_angle < 0 do cone_angle = cone_angle + 180 end
	
	local cone_coef = 1
	
	if cone_angle > src_cone then
		cone_coef = math.max(1 - (cone_angle - src_cone) / (fade_deg), 0)
	end
	
	--print(cone_angle)
	
	
	
	if cone_coef > 1 then cone_coef = 1 end
	
	
	

	local ch_L = (0.05 + (1 + math.sin(math.rad(angle2source))) * 0.7) * dist_coef * cone_coef
	local ch_R = (0.05 + (1 + math.sin(math.rad(-angle2source))) * 0.7) * dist_coef * cone_coef
	
	if ch_L > 1 then ch_L = 1 end
	if ch_R > 1 then ch_R = 1 end
	
	
	
	
	return ch_L, ch_R
end


local function inn_balance (cam_hdg, dist)

	
	local ch_L = 0.4 + (1 + math.sin(math.rad(cam_hdg))) * 0.7 * 0.6 + (1 - dist / 20)	
	
	local ch_R = 0.4 + (1 + math.sin(math.rad(-cam_hdg))) * 0.7 * 0.6 + (1 - dist / 20)
	
	return ch_L, ch_R
end

local function inn_balance2 (src_x, src_z, x, z , cam_hdg)

	local hdg_rad = math.rad(cam_hdg)
	-- local x_s = acf_x + src_x * math.cos(hdg_rad) - src_z * math.sin(hdg_rad)
	-- local z_s = acf_z + src_x * math.sin(hdg_rad) + src_z * math.cos(hdg_rad)
	local dist = math.sqrt(math.pow(src_x - x, 2) + math.pow(src_z - z, 2))
	
	if dist < 1 then dist = 1 end
	
	local angle2source = cam_hdg + math.deg(math.atan2(x - src_x, z - src_z)) -- angle from camera to the source
	while angle2source > 180 do angle2source = angle2source - 360 end
	while angle2source < -180 do angle2source = angle2source + 360 end
	local ch_L = (0.8/math.pow(dist,2) + (1 + math.sin(math.rad(angle2source))) ) 
	local ch_R = (0.8/math.pow(dist,2) + (1 + math.sin(math.rad(-angle2source))) )
	if ch_L > 1 then ch_L = 1 end
	if ch_R > 1 then ch_R = 1 end

	
	-- local ch_L = 0.4 + (1 + math.sin(math.rad(cam_hdg))) * 0.7 * 0.6 + (1 - dist / 20)	
	
	-- local ch_R = 0.4 + (1 + math.sin(math.rad(-cam_hdg))) * 0.7 * 0.6 + (1 - dist / 20)
	
	return ch_L, ch_R
end


es_starter_1_last = get(apd_working_1)
es_starter_2_last = get(apd_working_2)
es_starter_3_last = get(apd_working_3)



-- IDLE SOUND ON ENGINE START (2026-09-24)
-- The idle/running layers (cockpit inn_middle, outside out_idle and out_behind) normally only
-- become audible as N2 builds. Now, IDLE_START_DELAY seconds after the start is initiated (starter
-- engaged with N2 below 20%), they fade in over IDLE_START_RAMP seconds to their idle-level volume and
-- play together with the starter sounds. Pitch still follows N2. Once N2 reaches idle the normal volume
-- takes over. If the start is aborted (starter off and engine not burning fuel) the added volume fades
-- out over IDLE_START_FADE seconds.
IDLE_START_DELAY = 56    -- seconds after start initiation (was 51 s)
IDLE_START_RAMP  = 3     -- seconds to fade in
IDLE_START_GAIN  = 0.76  -- volume factor reached (= normal volume factor at idle N2 60.5%)
IDLE_START_FADE  = 2     -- seconds to fade out after an aborted start
es_st_clock = {-1, -1, -1}
es_st_floor = {0, 0, 0}
es_st_apd_last = {-1, -1, -1}
function es_start_floor(e, apd, burn, n2, dt)
	local last = es_st_apd_last[e]
	if last == 0 and apd == 1 and n2 < 20 then es_st_clock[e] = 0 end -- start initiated
	es_st_apd_last[e] = apd
	local clk = es_st_clock[e]
	if clk >= 0 then
		clk = clk + dt
		if n2 >= 58 or (apd == 0 and burn == 0) then clk = -1 end -- reached idle, or start aborted
		es_st_clock[e] = clk
	end
	local target = 0
	if clk >= IDLE_START_DELAY then
		target = IDLE_START_GAIN * math.min(1, (clk - IDLE_START_DELAY) / IDLE_START_RAMP)
	end
	local f = es_st_floor[e]
	if target >= f then
		f = target
	else
		f = math.max(target, f - IDLE_START_GAIN * dt / IDLE_START_FADE)
	end
	es_st_floor[e] = f
	return f
end

-- per-frame values of the N1 idle layer (called from update() after the start floors)
function es_calc_n1(dt)
	local raw = {get(snd_n1_1), get(snd_n1_2), get(snd_n1_3)}
	for e = 1, 3 do
		local n1 = snd_tail_rpm(e + 3, raw[e], dt)
		local eq = interpolate(es_n1_map_tbl, n1)
		local fl = es_st_floor[e]
		es_n1_gain_inn[e] = math.max(interpolate(es_rpm2gain_tbl, eq), fl) * N1_LAYER_LEVEL
		es_n1_gain_out[e] = math.max(interpolate(rpm2gain_tbl2, eq), fl) * N1_LAYER_LEVEL
		es_n1_pitch_inn[e] = interpolate(es_inn_pitch_tbl, eq) * N1_PITCH_SCALE
		es_n1_pitch_out[e] = interpolate(es_out_idle_pitch_tbl, eq) * N1_PITCH_SCALE
	end
end

-- SPOOL-DOWN TAIL (2026-09-24)
-- Real Tu-154M: going from ~80% to idle the sound lingers ("tail") instead of dropping with N2.
-- Sound RPM = N2 when N2 rises (instant); when N2 falls it decays toward N2 with time constant
-- SND_TAIL_TIME seconds. Affects every N2-driven layer (pitch, volume, outside roar). Reverse
-- sound and the starter trigger keep using raw N2, so they are not affected.
SND_TAIL_TIME = 1.5   -- 2026-09-24: set to 1.5 s (was 1.75, originally 2.5); seconds; bigger = longer tail, 0 = no tail (old behaviour)
snd_tail_state = {-1, -1, -1, -1, -1, -1} -- 1-3 N2, 4-6 N1 layer
function snd_tail_rpm(e, n2, passed)
	local st = snd_tail_state[e]
	if st < 0 or n2 >= st or SND_TAIL_TIME <= 0 then
		st = n2
	elseif passed > 0 then
		local k = passed / SND_TAIL_TIME
		if k > 1 then k = 1 end
		st = st + (n2 - st) * k
	end
	snd_tail_state[e] = st
	return st
end

local cam_dist_last = 0
local deice_coef = 0
--local refuel_coef = 0

-- FS2004 soundset experiment: runs at the END of update(), so it overrides the old engine
-- running layers (mutes them) and drives the FS9 layers. See FS9_ENGINE_SOUNDS above.
function fs9_update(external, n2_1, n2_2, n2_3, dopp, main_vol, mute)
	if not FS9_ENGINE_SOUNDS then return end

	-- mute the old engine running layers (reverse/starter/APU/rattle/de-ice untouched)
	setSampleGain(inn_middle_left_1, 0)  setSampleGain(inn_middle_right_1, 0)
	setSampleGain(es_n1_inn[1][1], 0)  setSampleGain(es_n1_inn[1][2], 0)
	setSampleGain(inn_middle_left_2, 0)  setSampleGain(inn_middle_right_2, 0)
	setSampleGain(es_n1_inn[2][1], 0)  setSampleGain(es_n1_inn[2][2], 0)
	setSampleGain(inn_middle_left_3, 0)  setSampleGain(inn_middle_right_3, 0)
	setSampleGain(es_n1_inn[3][1], 0)  setSampleGain(es_n1_inn[3][2], 0)
	setSampleGain(out_idle_left_1, 0)    setSampleGain(out_idle_right_1, 0)
	setSampleGain(es_n1_out[1][1], 0)  setSampleGain(es_n1_out[1][2], 0)
	setSampleGain(out_idle_left_2, 0)    setSampleGain(out_idle_right_2, 0)
	setSampleGain(es_n1_out[2][1], 0)  setSampleGain(es_n1_out[2][2], 0)
	setSampleGain(out_idle_left_3, 0)    setSampleGain(out_idle_right_3, 0)
	setSampleGain(es_n1_out[3][1], 0)  setSampleGain(es_n1_out[3][2], 0)
	setSampleGain(out_behind_left_1, 0)  setSampleGain(out_behind_right_1, 0)
	setSampleGain(out_behind_left_2, 0)  setSampleGain(out_behind_right_2, 0)
	setSampleGain(out_behind_left_3, 0)  setSampleGain(out_behind_right_3, 0)
	setSampleGain(out_high_left_1, 0)    setSampleGain(out_high_right_1, 0)
	setSampleGain(out_high_left_2, 0)    setSampleGain(out_high_right_2, 0)
	setSampleGain(out_high_left_3, 0)    setSampleGain(out_high_right_3, 0)
	setSampleGain(blast_full_1_L, 0) setSampleGain(blast_full_1_R, 0)
	setSampleGain(blast_low_1_L, 0)  setSampleGain(blast_low_1_R, 0)
	setSampleGain(blast_far_1_L, 0)  setSampleGain(blast_far_1_R, 0)
	setSampleGain(blast_full_2_L, 0) setSampleGain(blast_full_2_R, 0)
	setSampleGain(blast_low_2_L, 0)  setSampleGain(blast_low_2_R, 0)
	setSampleGain(blast_far_2_L, 0)  setSampleGain(blast_far_2_R, 0)
	setSampleGain(blast_full_3_L, 0) setSampleGain(blast_full_3_R, 0)
	setSampleGain(blast_low_3_L, 0)  setSampleGain(blast_low_3_R, 0)
	setSampleGain(blast_far_3_L, 0)  setSampleGain(blast_far_3_R, 0)

	-- per-engine RPM as 0..1 fractions
	local n2 = {n2_1 / 100, n2_2 / 100, n2_3 / 100}
	local n1 = {get(snd_n1_1) / 100, get(snd_n1_2) / 100, get(snd_n1_3) / 100}

	-- placement factors (mono samples: average of the L/R balance the old layers used)
	local fac_in = 0
	local fac_out = {0, 0, 0}
	if external == 0 then
		local view_head = acf_hd - cam_hd
		while view_head > 180 do view_head = view_head - 360 end
		while view_head < -180 do view_head = view_head + 360 end
		local bl, br = inn_balance(view_head, -get(pilot_Z) - 1.42 + 9)
		local cdr = math.max(bool2int(get(pilot_Z) + 1.42 > -19.1), get(cockpit_door))
		fac_in = math.max(0, 0.5 * (bl + br)) * (0.75 + 0.75 * cdr) / 1.5
	else
		local l1, r1 = out_balance(-3.24, 9.18, 0, 60, 120, 900)
		local l2, r2 = out_balance(0, 15, 0, 50, 120, 900)
		local l3, r3 = out_balance(3.24, 9.18, 0, 60, 120, 900)
		fac_out = {0.5 * (l1 + r1), 0.5 * (l2 + r2), 0.5 * (l3 + r3)}
	end

	for e = 1, 3 do
		local detune = 1
		if e == 2 then detune = FS9_ENG2_DETUNE end
		for i, L in ipairs(fs9_layers) do
			local smp = fs9_snd[e][i]
			if fs9_ok(smp) then
				local x = n1[e]
				if L[4] == "whine" then
					if FS9_WHINE_KEY == "n1" then x = n1[e] else x = n2[e] end
				end
				local vol = fs9_vol(L[6], x) / 100
				local pitch = 1000 * fs9_rate(L[5], x) * detune
				local gain = 0
				if external == 0 then
					gain = vol * FS9_INN_LEVEL * fac_in
				else
					gain = vol * FS9_EXT_LEVEL * fac_out[e]
					pitch = pitch + dopp
				end
				if mute then gain = 0 end
				setSampleGain(smp, gain * FS9_ENG_SCALE * main_vol)
				setSamplePitch(smp, pitch)
			end
		end
	end
end

function shut_update(external, dopp, main_vol, mute)
	local burn = {get(eng_working_1), get(eng_working_2), get(eng_working_3)}
	local n2 = {get(eng1_N1), get(eng2_N1), get(eng3_N1)}
	local fac
	if external == 0 then
		local view_head = acf_hd - cam_hd
		while view_head > 180 do view_head = view_head - 360 end
		while view_head < -180 do view_head = view_head + 360 end
		local bl, br = inn_balance(view_head, -get(pilot_Z) - 1.42 + 9)
		local b = math.max(0, 0.5 * (bl + br))
		fac = {b * SHUT_INN_LEVEL, b * SHUT_INN_LEVEL, b * SHUT_INN_LEVEL}
	else
		local l1, r1 = out_balance(-3.24, 9.18, 0, 60, 120, 900)
		local l2, r2 = out_balance(0, 15, 0, 50, 120, 900)
		local l3, r3 = out_balance(3.24, 9.18, 0, 60, 120, 900)
		fac = {0.5 * (l1 + r1) * SHUT_EXT_LEVEL, 0.5 * (l2 + r2) * SHUT_EXT_LEVEL, 0.5 * (l3 + r3) * SHUT_EXT_LEVEL}
	end
	for e = 1, 3 do
		local smp = shut_snd[e]
		if smp and smp ~= 0 then
			if shut_burn_last[e] == 1 and burn[e] == 0 and n2[e] > SHUT_MIN_N2 then
				stopSample(smp)
				rewindSample(smp)
				playSample(smp, false)
			end
			local g = fac[e] * main_vol
			if mute then g = 0 end
			setSampleGain(smp, g)
			if external == 0 then setSamplePitch(smp, 1000) else setSamplePitch(smp, 1000 + dopp) end
		end
		shut_burn_last[e] = burn[e]
	end
end

function update()

    local external = 0
    if get(deice_started) > 0 and get(deice_started) < 1.1 then
        deice_coef = get(deice_started)
    end
    
    
	if get(external_view) > 0 or math.abs(get(pilot_X)) > 1.6 or get(pilot_Y) < -0.55 or get(vr_outside)==1 then
	   external = 1
    end
    
	local passed = get(frame_time)
	
	local main_vol =1 --get(eng_main_vol)
	
	-- spool-down "tail": the sound RPM follows N2 instantly when rising, but decays with a
	-- time constant when falling, like the real engine's sound lingering on power reduction
	local rpm_1 = snd_tail_rpm(1, get(eng1_N1), passed)
	local rpm_2 = snd_tail_rpm(2, get(eng2_N1), passed)
	local rpm_3 = snd_tail_rpm(3, get(eng3_N1), passed)
	
	
	local work_1 = get(eng_working_1)
	local work_2 = get(eng_working_2)
	local work_3 = get(eng_working_3)
	
	local apu_rpm = get(apu_n1)
	
	local cpt_door2 = get(cockpit_door)
	
	-- define localtions
	cam_hd = get(cam_HDG)
	acf_hd = get(acf_hdg)
	
	cam_x = get(cam_X)
	cam_y = get(cam_Y)
	cam_z = get(cam_Z)
	
	acf_x = get(acf_X)
	acf_y = get(acf_Y)
	acf_z = get(acf_Z)
	
	
	
	-- set pitch for engines sounds
	local inn_ptch_1 = interpolate(es_inn_pitch_tbl, rpm_1)
	local inn_ptch_2 = interpolate(es_inn_pitch_tbl, rpm_2)
	local inn_ptch_3 = interpolate(es_inn_pitch_tbl, rpm_3)
	
	local apu_snd_pitch = 1100 * math.abs(apu_rpm * 0.01) ^ 0.2
	
	-- doppler coef
	local cam_dist = math.sqrt(math.pow(acf_x - cam_x, 2) + math.pow(acf_z - cam_z, 2) + math.pow(cam_y - acf_y, 2))
	
	local cam_spd = 0
	if passed > 0 then
		cam_spd = -(cam_dist - cam_dist_last) / passed -- m/s
	end
	
	cam_dist_last = cam_dist
	
	local dopp = cam_spd * 0.8
	if dopp > 300 then dopp = 300
	elseif dopp < -200 then dopp = -200 end
	
        
        
	setSamplePitch(inn_middle_left_1, inn_ptch_1)
	setSamplePitch(es_n1_inn[1][1], es_n1_pitch_inn[1])
	setSamplePitch(inn_middle_right_1, inn_ptch_1)
	setSamplePitch(es_n1_inn[1][2], es_n1_pitch_inn[1])
	
	setSamplePitch(inn_middle_left_2, inn_ptch_2)
	setSamplePitch(es_n1_inn[2][1], es_n1_pitch_inn[2])
	setSamplePitch(inn_middle_right_2, inn_ptch_2)
	setSamplePitch(es_n1_inn[2][2], es_n1_pitch_inn[2])
	
	setSamplePitch(inn_middle_left_3, inn_ptch_3)
	setSamplePitch(es_n1_inn[3][1], es_n1_pitch_inn[3])
	setSamplePitch(inn_middle_right_3, inn_ptch_3)
	setSamplePitch(es_n1_inn[3][2], es_n1_pitch_inn[3])
	local out_ptch_idle_1 = interpolate(es_out_idle_pitch_tbl, rpm_1)
	local out_ptch_idle_2 = interpolate(es_out_idle_pitch_tbl, rpm_2)
	local out_ptch_idle_3 = interpolate(es_out_idle_pitch_tbl, rpm_3)

	local out_ptch_1 = interpolate(es_inn_pitch_tbl, rpm_1)
	local out_ptch_2 = interpolate(es_inn_pitch_tbl, rpm_2)
	local out_ptch_3 = interpolate(es_inn_pitch_tbl, rpm_3)
	
	setSamplePitch(out_idle_left_1, out_ptch_idle_1 + dopp)
	setSamplePitch(es_n1_out[1][1], es_n1_pitch_out[1] + dopp)
	setSamplePitch(out_idle_right_1, out_ptch_idle_1 + dopp)
	setSamplePitch(es_n1_out[1][2], es_n1_pitch_out[1] + dopp)
	
	setSamplePitch(out_idle_left_2, out_ptch_idle_2 + dopp)
	setSamplePitch(es_n1_out[2][1], es_n1_pitch_out[2] + dopp)
	setSamplePitch(out_idle_right_2, out_ptch_idle_2 + dopp)
	setSamplePitch(es_n1_out[2][2], es_n1_pitch_out[2] + dopp)
	
	setSamplePitch(out_idle_left_3, out_ptch_idle_3 + dopp)
	setSamplePitch(es_n1_out[3][1], es_n1_pitch_out[3] + dopp)
	setSamplePitch(out_idle_right_3, out_ptch_idle_3 + dopp)
	setSamplePitch(es_n1_out[3][2], es_n1_pitch_out[3] + dopp)
	
	-- out_high pitch (N2 67 -> 98 : 850 -> 1200, plus Doppler)
	local out_high_pitch_1 = interpolate(out_high_pitch_tbl, rpm_1) + dopp
	local out_high_pitch_2 = interpolate(out_high_pitch_tbl, rpm_2) + dopp
	local out_high_pitch_3 = interpolate(out_high_pitch_tbl, rpm_3) + dopp
	setSamplePitch(out_high_left_1, out_high_pitch_1)
	setSamplePitch(out_high_right_1, out_high_pitch_1)
	setSamplePitch(out_high_left_2, out_high_pitch_2)
	setSamplePitch(out_high_right_2, out_high_pitch_2)
	setSamplePitch(out_high_left_3, out_high_pitch_3)
	setSamplePitch(out_high_right_3, out_high_pitch_3)
	
	setSamplePitch(out_behind_left_1, 1000 + (out_ptch_1 - 1000) * 0.4)
	setSamplePitch(out_behind_right_1, 1000 + (out_ptch_1 - 1000) * 0.4)
	
	setSamplePitch(out_behind_left_2, 1000 + (out_ptch_2 - 1000) * 0.4)
	setSamplePitch(out_behind_right_2, 1000 + (out_ptch_2 - 1000) * 0.4)
	
	setSamplePitch(out_behind_left_3, 1000 + (out_ptch_3 - 1000) * 0.4)
	setSamplePitch(out_behind_right_3, 1000 + (out_ptch_3 - 1000) * 0.4)

	

	setSamplePitch(inn_apu_left, apu_snd_pitch)
	setSamplePitch(inn_apu_right, apu_snd_pitch)
	setSamplePitch(out_apu_left, apu_snd_pitch + dopp)
	setSamplePitch(out_apu_right, apu_snd_pitch + dopp)
	
		
	-- set RPM gain
	local rpm_gain_1 = interpolate(es_rpm2gain_tbl, rpm_1)
	local rpm_gain_2 = interpolate(es_rpm2gain_tbl, rpm_2)
	local rpm_gain_3 = interpolate(es_rpm2gain_tbl, rpm_3)
	local rpm_gain_1_idle = interpolate(rpm2gain_tbl2, rpm_1)
	local rpm_gain_2_idle = interpolate(rpm2gain_tbl2, rpm_2)
	local rpm_gain_3_idle = interpolate(rpm2gain_tbl2, rpm_3)
	local rpm_gain_apu = interpolate(es_rpm2gain_tbl, apu_rpm)
	-- idle sound on engine start: volume floor from IDLE_START_DELAY s after start initiation
	do
		local f1 = es_start_floor(1, get(apd_working_1), get(eng_working_1), get(eng1_N1), passed)
		local f2 = es_start_floor(2, get(apd_working_2), get(eng_working_2), get(eng2_N1), passed)
		local f3 = es_start_floor(3, get(apd_working_3), get(eng_working_3), get(eng3_N1), passed)
		rpm_gain_1 = math.max(rpm_gain_1, f1)  rpm_gain_1_idle = math.max(rpm_gain_1_idle, f1)
		rpm_gain_2 = math.max(rpm_gain_2, f2)  rpm_gain_2_idle = math.max(rpm_gain_2_idle, f2)
		rpm_gain_3 = math.max(rpm_gain_3, f3)  rpm_gain_3_idle = math.max(rpm_gain_3_idle, f3)
	end
	es_calc_n1(passed) -- N1 idle layer
	
	-- starters logic
	local starter_1 = get(apd_working_1)
	local starter_2 = get(apd_working_2)
	local starter_3 = get(apd_working_3)
	
	if starter_1 ~= es_starter_1_last and starter_1 == 1 and get(eng1_N1) < 20 then
		playSample(inn_starter_left_new_1, false)
		playSample(inn_starter_right_new_1, false)
		playSample(out_starter_left_1, false)
		playSample(out_starter_right_1, false)
	
	elseif starter_1 ~= es_starter_1_last and starter_1 == 0 then
		stopSample(inn_starter_left_new_1)
		stopSample(inn_starter_right_new_1)
		stopSample(out_starter_left_1)
		stopSample(out_starter_right_1)
	end
	
	if starter_2 ~= es_starter_2_last and starter_2 == 1 and get(eng2_N1) < 20 then
		playSample(inn_starter_left_new_2, false)
		playSample(inn_starter_right_new_2, false)
		playSample(out_starter_left_2, false)
		playSample(out_starter_right_2, false)
	
	elseif starter_2 ~= es_starter_2_last and starter_2 == 0 then
		stopSample(inn_starter_left_new_2)
		stopSample(inn_starter_right_new_2)
		stopSample(out_starter_left_2)
		stopSample(out_starter_right_2)
	end

	if starter_3 ~= es_starter_3_last and starter_3 == 1 and get(eng3_N1) < 20 then
		playSample(inn_starter_left_new_3, false)
		playSample(inn_starter_right_new_3, false)
		playSample(out_starter_left_3, false)
		playSample(out_starter_right_3, false)
	
	elseif starter_3 ~= es_starter_3_last and starter_3 == 0 then
		stopSample(inn_starter_left_new_3)
		stopSample(inn_starter_right_new_3)
		stopSample(out_starter_left_3)
		stopSample(out_starter_right_3)
	end	
	
	
	es_starter_1_last = starter_1
	es_starter_2_last = starter_2
	es_starter_3_last = starter_3
	
	
	-- reverse sounds
	local rev_L = get(revers_flap_L)
	local rev_R = get(revers_flap_R)
	local R_1=(get(thrust_L)-3000)/60000
	local R_1_in=math.max(0,(get(thrust_L)-15000)/45000)*0.7
	-- if R_1<0.05 then
		-- R_1=0
	-- end
	local R_3=(get(thrust_R)-3000)/60000
	local R_3_in=math.max(0,(get(thrust_R)-15000)/45000)*0.7
	-- if R_3<0.05 then
		-- R_3=0
	-- end
	-- if rev_flaps > 1 and (rpm_1+rpm_3)/2 > 30 then
		-- if not isSamplePlaying(inn_reverse) then playSample(inn_reverse, true) end
		-- if not isSamplePlaying(out_reverse_L) then playSample(out_reverse_L, true) end
		-- if not isSamplePlaying(out_reverse_R) then playSample(out_reverse_R, true) end
	-- else
		-- stopSample(inn_reverse)
		-- stopSample(out_reverse_L)
		-- stopSample(out_reverse_R)
	-- end
    
    if get(mil_tech) > 0 then
        if get(deice_started) > 0.1 and not isSamplePlaying(deice_out_L) then
            playSample(deice_out_L,false)
			playSample(deice_out_R,false)
        elseif get(deice_started) == 0 then
            stopSample(deice_out_L)
			stopSample(deice_out_R)
        end
    else
        stopSample(deice_out_L)
		stopSample(deice_out_R)
    end

        
    
    
	
	if external == 0 then -- internal
	-- -21 -17.5 -8 -6.6
		local z_pos=get(pilot_Z)+1.42
		local x_pos=get(pilot_X)
		local plt_hdg=get(pilot_head)
		local dist_windows=math.max(-1*0.4/10*math.abs(z_pos+21.2)+1,0)
		local dist_door1=math.max(-1*0.4/10*math.abs(z_pos+17.62)+1,0)
		local dist_door2=math.max(-1*0.4/10*math.abs(z_pos+8.12)+1,0)
		local dist_door3=math.max(-1*0.4/10*math.abs(z_pos+6.57)+1,0)
		local cockpit_L,cockpit_R=inn_balance2 (0, -21.2, x_pos, z_pos , plt_hdg)
		local win1_L, win1_R=inn_balance2 (-0.7, -21.2, x_pos, z_pos , plt_hdg)
		local win2_L, win2_R=inn_balance2 (0.7, -21.2, x_pos, z_pos , plt_hdg)
		local door1_L, door1_R=inn_balance2 (-1.87, -17.62, x_pos, z_pos , plt_hdg)
		local door2_L, door2_R=inn_balance2 (-1.98, -6.57, x_pos, z_pos , plt_hdg)
		local door3_L, door3_R=inn_balance2 (1.95, -8.12, x_pos, z_pos , plt_hdg)
		local cpt_door = get(cockpit_door)
		local cpt_door = math.min(cpt_door,0.94)+0.06
		local chan_left2 = math.max(get(cockpit_window_left)*0.7*dist_windows*win1_L, get(cockpit_window_right)*dist_windows*0.7*win2_L, get(pax_door_1) * cpt_door*0.8*dist_door1*door1_L, get(pax_door_2) * cpt_door*1.1*dist_door2*door2_L, get(pax_door_3) * cpt_door*1*dist_door3*door3_L)
		if z_pos>-19 then
			chan_left2 = math.max( math.max(-0.0003571*z_pos+0.003214,0)*cockpit_L, get(cockpit_window_left)*0.7*dist_windows* cpt_door*win1_L, get(cockpit_window_right)*dist_windows* cpt_door*0.7*win2_L, get(pax_door_1) * 0.8*dist_door1*door1_L, get(pax_door_2) * 1.1*dist_door2*door2_L, get(pax_door_3) * 1*dist_door3*door3_L)
		end
		local chan_right2 = math.max(get(cockpit_window_left)*0.7*dist_windows*win1_R, get(cockpit_window_right)*dist_windows*0.7*win2_R, get(pax_door_1) * cpt_door*0.8*dist_door1*door1_R, get(pax_door_2) * cpt_door*1.1*dist_door2*door2_R, get(pax_door_3) * cpt_door*1*dist_door3*door3_R)
		if z_pos>-19 then
			chan_right2 = math.max( math.max(-0.0003571*z_pos+0.003214,0)*cockpit_R, get(cockpit_window_left)*0.7*dist_windows* cpt_door*win1_R, get(cockpit_window_right)*dist_windows* cpt_door*0.7*win2_R, get(pax_door_1) * 0.8*dist_door1*door1_R, get(pax_door_2) * 1.1*dist_door2*door2_R, get(pax_door_3) * 1*dist_door3*door3_R)
		end
		local dist = -get(pilot_Z)-1.42 + 9 
		local cockpit_dr=math.max(bool2int(get(pilot_Z)+1.42>-19.1),cpt_door2)
		-- mute external sounds
		local inn_gain=400
		setSampleGain(deice_out_L, chan_left2 * main_vol*0.5*deice_coef)
        setSampleGain(deice_out_R, chan_right2 * main_vol*0.5*deice_coef)
		
		setSampleGain(out_behind_left_1, 0)
		setSampleGain(out_behind_right_1, 0)
		setSampleGain(out_idle_left_1, chan_left2 * inn_gain * main_vol * rpm_gain_1_idle * out_idle_level)
		setSampleGain(es_n1_out[1][1], 0) -- N1 layer: outside view only (not through open windows/doors)
		setSampleGain(out_idle_right_1, chan_right2 * inn_gain * main_vol * rpm_gain_1_idle * out_idle_level)
		setSampleGain(es_n1_out[1][2], 0) -- N1 layer: outside view only (not through open windows/doors)
		setSampleGain(out_starter_left_1, chan_left2 * inn_gain * main_vol*3/4)
		setSampleGain(out_starter_right_1, chan_right2 * inn_gain * main_vol*3/4)
		
		setSampleGain(out_behind_left_2, 0)
		setSampleGain(out_behind_right_2, 0)
		setSampleGain(out_idle_left_2, chan_left2 * inn_gain * main_vol * rpm_gain_2_idle * out_idle_level)
		setSampleGain(es_n1_out[2][1], 0) -- N1 layer: outside view only (not through open windows/doors)
		setSampleGain(out_idle_right_2, chan_right2 * inn_gain * main_vol * rpm_gain_2_idle * out_idle_level)
		setSampleGain(es_n1_out[2][2], 0) -- N1 layer: outside view only (not through open windows/doors)
		setSampleGain(out_starter_left_2, chan_left2 * inn_gain * main_vol*3/4)
		setSampleGain(out_starter_right_2, chan_right2 * inn_gain * main_vol*3/4)
		
		setSampleGain(out_behind_left_3, 0)
		setSampleGain(out_behind_right_3, 0)
		setSampleGain(out_idle_left_3, chan_left2 * inn_gain * main_vol * rpm_gain_3_idle * out_idle_level)
		setSampleGain(es_n1_out[3][1], 0) -- N1 layer: outside view only (not through open windows/doors)
		setSampleGain(out_idle_right_3, chan_right2 * inn_gain * main_vol * rpm_gain_3_idle * out_idle_level)
		setSampleGain(es_n1_out[3][2], 0) -- N1 layer: outside view only (not through open windows/doors)
		setSampleGain(out_starter_left_3, chan_left2 * inn_gain * main_vol*3/4)
		setSampleGain(out_starter_right_3, chan_right2 * inn_gain * main_vol*3/4)
		
		-- blast and rattle are outside-view layers only: silent in the cockpit
		setSampleGain(blast_full_1_L, 0)
		setSampleGain(blast_full_1_R, 0)
		setSampleGain(blast_low_1_L, 0)
		setSampleGain(blast_low_1_R, 0)
		setSampleGain(blast_far_1_L, 0)
		setSampleGain(blast_far_1_R, 0)
		setSampleGain(blast_full_2_L, 0)
		setSampleGain(blast_full_2_R, 0)
		setSampleGain(blast_low_2_L, 0)
		setSampleGain(blast_low_2_R, 0)
		setSampleGain(blast_far_2_L, 0)
		setSampleGain(blast_far_2_R, 0)
		setSampleGain(blast_full_3_L, 0)
		setSampleGain(blast_full_3_R, 0)
		setSampleGain(blast_low_3_L, 0)
		setSampleGain(blast_low_3_R, 0)
		setSampleGain(blast_far_3_L, 0)
		setSampleGain(blast_far_3_R, 0)
		setSampleGain(rattle_L_1, 0)
		setSampleGain(rattle_R_1, 0)
		setSampleGain(rattle_L_3, 0)
		setSampleGain(rattle_R_3, 0)
		-- out_high is an outside-view layer only: silent in the cockpit
		setSampleGain(out_high_left_1, 0)
		setSampleGain(out_high_right_1, 0)
		setSampleGain(out_high_left_2, 0)
		setSampleGain(out_high_right_2, 0)
		setSampleGain(out_high_left_3, 0)
		setSampleGain(out_high_right_3, 0)
		
		setSampleGain(out_apu_left, chan_left2 * inn_gain * main_vol * rpm_gain_apu/2)
		setSampleGain(out_apu_right, chan_right2 * inn_gain * main_vol * rpm_gain_apu/2)
		
		
		
		-- calculate balance
		
		local view_head = acf_hd - cam_hd
		while view_head > 180 do view_head = view_head - 360 end
		while view_head < -180 do view_head = view_head + 360 end
		
		
		
		local bal_L, bal_R = inn_balance (view_head, dist)
		
		
		setSampleGain(inn_middle_left_1, 700 * ENG_VOL_TRIM * INN_MIDDLE_LEVEL * bal_L * rpm_gain_1 * main_vol*(0.75+0.75*cockpit_dr))
		setSampleGain(es_n1_inn[1][1], 0) -- N1 layer: outside view only
		setSampleGain(inn_middle_right_1, 700 * ENG_VOL_TRIM * INN_MIDDLE_LEVEL * bal_R * rpm_gain_1 * main_vol*(0.75+0.75*cockpit_dr))
		setSampleGain(es_n1_inn[1][2], 0) -- N1 layer: outside view only
		
		setSampleGain(inn_middle_left_2, 700 * ENG_VOL_TRIM * INN_MIDDLE_LEVEL * bal_L * rpm_gain_2 * main_vol*(0.75+0.75*cockpit_dr))
		setSampleGain(es_n1_inn[2][1], 0) -- N1 layer: outside view only
		setSampleGain(inn_middle_right_2, 700 * ENG_VOL_TRIM * INN_MIDDLE_LEVEL * bal_R * rpm_gain_2 * main_vol*(0.75+0.75*cockpit_dr))
		setSampleGain(es_n1_inn[2][2], 0) -- N1 layer: outside view only
		
		setSampleGain(inn_middle_left_3, 700 * ENG_VOL_TRIM * INN_MIDDLE_LEVEL * bal_L * rpm_gain_3 * main_vol*(0.75+0.75*cockpit_dr))
		setSampleGain(es_n1_inn[3][1], 0) -- N1 layer: outside view only
		setSampleGain(inn_middle_right_3, 700 * ENG_VOL_TRIM * INN_MIDDLE_LEVEL * bal_R * rpm_gain_3 * main_vol*(0.75+0.75*cockpit_dr))	
		setSampleGain(es_n1_inn[3][2], 0) -- N1 layer: outside view only
		
		setSampleGain(inn_starter_left_new_1, 950 * bal_L * main_vol*(0.75+0.75*cockpit_dr))
		setSampleGain(inn_starter_left_new_2, 950 * bal_L * main_vol*(0.75+0.75*cockpit_dr))
		setSampleGain(inn_starter_left_new_3, 950 * bal_L * main_vol*(0.75+0.75*cockpit_dr))
		
		setSampleGain(inn_starter_right_new_1, 950 * bal_R * main_vol*(0.75+0.75*cockpit_dr))
		setSampleGain(inn_starter_right_new_2, 950 * bal_R * main_vol*(0.75+0.75*cockpit_dr))
		setSampleGain(inn_starter_right_new_3, 950 * bal_R * main_vol*(0.75+0.75*cockpit_dr))
		
		setSampleGain(inn_apu_left, 680 * bal_L * rpm_gain_apu * main_vol*(0.75+0.75*cockpit_dr))
		setSampleGain(inn_apu_right, 680 * bal_R * rpm_gain_apu * main_vol*(0.75+0.75*cockpit_dr))
		
		local rev_snd =  math.min(R_1_in*rev_L*0.75+R_3_in*rev_R*0.75,1)*600* main_vol
		--set(db1,rev_snd)
		local rev_snd_L = chan_left2*rev_snd * 3 * main_vol 
		local rev_snd_R = chan_right2*rev_snd * 3 * main_vol 
		local rev_ptch = 1000 + (math.max(get(eng1_N1), get(eng3_N1)) - 78) * 10 -- raw N2, reverse untouched by tail
		setSampleGain(inn_reverse, rev_snd)
		setSamplePitch(inn_reverse, rev_ptch)
		local rev_ptch = 1000 + (math.max(get(eng1_N1), get(eng3_N1)) - 78) * 10 -- raw N2, reverse untouched by tail
		--set(db2,rev_snd_L)
		setSampleGain(out_reverse_L, rev_snd_L)
		setSampleGain(out_reverse_R, rev_snd_R)
		setSamplePitch(out_reverse_L, rev_ptch)
		setSamplePitch(out_reverse_R, rev_ptch)
	else -- external view
	
        
		local camera_distance = math.sqrt(((get(cam_x)-get(acf_X))^2)+((get(cam_y)-get(acf_Y))^2)+((get(cam_z)-get(acf_Z))^2)) -- in meters
		if camera_distance < 1 then camera_distance = 1 end -- limit minimum distance
        
		local dist_coef = 300 / camera_distance ^ 1.7
		if dist_coef > 1 then dist_coef = 1 end
        
        
		-- mute internal sounds

		setSampleGain(inn_middle_left_1, 0)
		setSampleGain(es_n1_inn[1][1], 0)
		setSampleGain(inn_middle_right_1, 0)
		setSampleGain(es_n1_inn[1][2], 0)
		setSampleGain(inn_starter_left_new_1, 0)
		setSampleGain(inn_starter_right_new_1, 0)
	
		setSampleGain(inn_middle_left_2, 0)
		setSampleGain(es_n1_inn[2][1], 0)
		setSampleGain(inn_middle_right_2, 0)
		setSampleGain(es_n1_inn[2][2], 0)
		setSampleGain(inn_starter_left_new_2, 0)
		setSampleGain(inn_starter_right_new_2, 0)
		
		setSampleGain(inn_middle_left_3, 0)
		setSampleGain(es_n1_inn[3][1], 0)
		setSampleGain(inn_middle_right_3, 0)
		setSampleGain(es_n1_inn[3][2], 0)
		setSampleGain(inn_starter_left_new_3, 0)
		setSampleGain(inn_starter_right_new_3, 0)

		setSampleGain(inn_apu_left, 0)
		setSampleGain(inn_apu_right, 0)
	
	
		-- local eng_1_L, eng_1_R = out_balance (-3.24, 9.18, 0, 90, 120, 700)
		-- local eng_2_L, eng_2_R = out_balance (0, 15, 0, 90, 120, 700)
		-- local eng_3_L, eng_3_R = out_balance (3.24, 9.18, 0, 90, 120, 700)
		local eng_1_L, eng_1_R = out_balance (-3.24, 9.18, 0, 60, 120, 900)
		local eng_2_L, eng_2_R = out_balance (0, 15, 0, 50, 120, 900)
		local eng_3_L, eng_3_R = out_balance (3.24, 9.18, 0, 60, 120, 900)
		
		local starter_L, starter_R = out_balance (0, 12, 0, 180, 100, 700)
		
		local rev_out_L, rev_out_R = out_balance (0, 12, 0, 180, 100, 1200)
		
		local noise_L, noise_R = out_balance (0, 10, 180, 30 , 80 , 1500)
		
		local apu_L, apu_R = out_balance (0, 15, 180, 120, 100, 100)
		
		local rear_gain_1=math.min(1,-1.333e-05*n2_equiv_thrust(rpm_1)+1.533)
		local rear_gain_2=math.min(1,-1.333e-05*n2_equiv_thrust(rpm_2)+1.533)
		local rear_gain_3=math.min(1,-1.333e-05*n2_equiv_thrust(rpm_3)+1.533)
		-- exterior-only RPM loudness boost: up to +20% as N2 goes from idle (60.5) to takeoff (96).
		-- 0.2 is the size of the boost; the cockpit path is not touched.
		local ext_boost_1 = 1 + 0.2 * math.max(0, math.min(1, (rpm_1 - 60.5) / 35.5))
		local ext_boost_2 = 1 + 0.2 * math.max(0, math.min(1, (rpm_2 - 60.5) / 35.5))
		local ext_boost_3 = 1 + 0.2 * math.max(0, math.min(1, (rpm_3 - 60.5) / 35.5))
		
		--local test=get(db3)
		setSampleGain(out_behind_left_1, 1200 * ENG_VOL_TRIM * noise_L * rear_gain_1 * rpm_gain_1 ^ 3 * main_vol * (0.5 + 0.5 * work_1) * ext_boost_1) 
		setSampleGain(out_behind_right_1, 1200 * ENG_VOL_TRIM * noise_R * rear_gain_1 * rpm_gain_1 ^ 3 * main_vol * (0.5 + 0.5 * work_1) * ext_boost_1)
		setSampleGain(out_idle_left_1, 1200 * eng_1_L * rpm_gain_1_idle * main_vol * ext_boost_1 * out_idle_level)
		setSampleGain(es_n1_out[1][1], 1200 * eng_1_L * es_n1_gain_out[1] * main_vol * ext_boost_1 * out_idle_level)
		setSampleGain(out_idle_right_1, 1200 * eng_1_R * rpm_gain_1_idle * main_vol * ext_boost_1 * out_idle_level)
		setSampleGain(es_n1_out[1][2], 1200 * eng_1_R * es_n1_gain_out[1] * main_vol * ext_boost_1 * out_idle_level)
		setSampleGain(out_starter_left_1, 1000 * starter_L * main_vol)
		setSampleGain(out_starter_right_1, 1000 * starter_R * main_vol)
        
		local rev_snd =  math.min(R_1*rev_L*0.75+R_3*rev_R*0.75,1)*2000* main_vol
		local rev_ptch = 1000 + (math.max(get(eng1_N1), get(eng3_N1)) - 78) * 10 -- raw N2, reverse untouched by tail
		--set(db3, rev_out_L*rev_snd)
		setSampleGain(out_reverse_L, rev_out_L*rev_snd)
		setSamplePitch(out_reverse_L, rev_ptch)
		setSampleGain(out_reverse_R, rev_out_R*rev_snd)
		setSamplePitch(out_reverse_R, rev_ptch)
        
        

		setSampleGain(out_behind_left_2, 1200 * ENG_VOL_TRIM * noise_L * rear_gain_2 * rpm_gain_2 ^ 3 * main_vol * (0.5 + 0.5 * work_2) * ext_boost_2)
		setSampleGain(out_behind_right_2, 1200 * ENG_VOL_TRIM * noise_R * rear_gain_2 * rpm_gain_2 ^ 3 * main_vol * (0.5 + 0.5 * work_2) * ext_boost_2)
		setSampleGain(out_idle_left_2, 1200 * eng_2_L * rpm_gain_2_idle * main_vol * ext_boost_2 * out_idle_level)
		setSampleGain(es_n1_out[2][1], 1200 * eng_2_L * es_n1_gain_out[2] * main_vol * ext_boost_2 * out_idle_level)
		setSampleGain(out_idle_right_2, 1200 * eng_2_R * rpm_gain_2_idle * main_vol * ext_boost_2 * out_idle_level)
		setSampleGain(es_n1_out[2][2], 1200 * eng_2_R * es_n1_gain_out[2] * main_vol * ext_boost_2 * out_idle_level)
		setSampleGain(out_starter_left_2, 1000 * starter_L * main_vol)
		setSampleGain(out_starter_right_2, 1000 * starter_R * main_vol)	

		setSampleGain(out_behind_left_3, 1200 * ENG_VOL_TRIM * noise_L * rear_gain_3 * rpm_gain_3 ^ 3 * main_vol * (0.5 + 0.5 * work_3) * ext_boost_3)
		setSampleGain(out_behind_right_3, 1200 * ENG_VOL_TRIM * noise_R * rear_gain_3 * rpm_gain_3 ^ 3 * main_vol * (0.5 + 0.5 * work_3) * ext_boost_3)
		setSampleGain(out_idle_left_3, 1200 * eng_3_L * rpm_gain_3_idle * main_vol * ext_boost_3 * out_idle_level)
		setSampleGain(es_n1_out[3][1], 1200 * eng_3_L * es_n1_gain_out[3] * main_vol * ext_boost_3 * out_idle_level)
		setSampleGain(out_idle_right_3, 1200 * eng_3_R * rpm_gain_3_idle * main_vol * ext_boost_3 * out_idle_level)
		setSampleGain(es_n1_out[3][2], 1200 * eng_3_R * es_n1_gain_out[3] * main_vol * ext_boost_3 * out_idle_level)
		setSampleGain(out_starter_left_3, 1000 * starter_L * main_vol)
		setSampleGain(out_starter_right_3, 1000 * starter_R * main_vol)	
		
		-- Blast: rear-side jet noise, keyed on density-corrected thrust (B's layers)
		local bl_rho = get(snd_rho)
		if bl_rho < 0.05 then bl_rho = 1.225 end
		local bl_R1 = n2_equiv_thrust(rpm_1) -- was get(thrust_L) * 1.225 / bl_rho (see n2_equiv_thrust)
		local bl_R2 = n2_equiv_thrust(rpm_2)
		local bl_R3 = n2_equiv_thrust(rpm_3)
		local full_L, full_R = out_balance (0, 10, 180, 60, 160, 1000)
		local far_L, far_R = out_balance (0, 10, 180, 60, 160, 2000)
		local low_L, low_R = out_balance (0, 10, 180, 30, 80, 400)
		local far_fade = math.min(0.001 * camera_distance, 1)
		local full_gain_1 = interpolate(full_gain_tbl, bl_R1) * 1000 * blast_level * main_vol
		local far_gain_1 = interpolate(far_gain_tbl, bl_R1) * 1000 * far_fade * blast_level * main_vol
		local low_gain_1 = interpolate(low_gain_tbl, bl_R1) * 1000 * blast_level * main_vol
		local low_pitch_1 = interpolate(low_pitch_tbl, bl_R1) * 1000 + dopp
		setSampleGain(blast_full_1_L, full_gain_1 * full_L)
		setSampleGain(blast_full_1_R, full_gain_1 * full_R)
		setSampleGain(blast_low_1_L, low_gain_1 * low_L)
		setSampleGain(blast_low_1_R, low_gain_1 * low_R)
		setSampleGain(blast_far_1_L, far_gain_1 * far_L)
		setSampleGain(blast_far_1_R, far_gain_1 * far_R)
		setSamplePitch(blast_full_1_L, 1000 + dopp)
		setSamplePitch(blast_full_1_R, 1000 + dopp)
		setSamplePitch(blast_low_1_L, low_pitch_1)
		setSamplePitch(blast_low_1_R, low_pitch_1)
		setSamplePitch(blast_far_1_L, 1000 + dopp)
		setSamplePitch(blast_far_1_R, 1000 + dopp)
		local full_gain_2 = interpolate(full_gain_tbl, bl_R2) * 1000 * blast_level * main_vol
		local far_gain_2 = interpolate(far_gain_tbl, bl_R2) * 1000 * far_fade * blast_level * main_vol
		local low_gain_2 = interpolate(low_gain_tbl, bl_R2) * 1000 * blast_level * main_vol
		local low_pitch_2 = interpolate(low_pitch_tbl, bl_R2) * 1000 + dopp
		setSampleGain(blast_full_2_L, full_gain_2 * full_L)
		setSampleGain(blast_full_2_R, full_gain_2 * full_R)
		setSampleGain(blast_low_2_L, low_gain_2 * low_L)
		setSampleGain(blast_low_2_R, low_gain_2 * low_R)
		setSampleGain(blast_far_2_L, far_gain_2 * far_L)
		setSampleGain(blast_far_2_R, far_gain_2 * far_R)
		setSamplePitch(blast_full_2_L, 1000 + dopp)
		setSamplePitch(blast_full_2_R, 1000 + dopp)
		setSamplePitch(blast_low_2_L, low_pitch_2)
		setSamplePitch(blast_low_2_R, low_pitch_2)
		setSamplePitch(blast_far_2_L, 1000 + dopp)
		setSamplePitch(blast_far_2_R, 1000 + dopp)
		local full_gain_3 = interpolate(full_gain_tbl, bl_R3) * 1000 * blast_level * main_vol
		local far_gain_3 = interpolate(far_gain_tbl, bl_R3) * 1000 * far_fade * blast_level * main_vol
		local low_gain_3 = interpolate(low_gain_tbl, bl_R3) * 1000 * blast_level * main_vol
		local low_pitch_3 = interpolate(low_pitch_tbl, bl_R3) * 1000 + dopp
		setSampleGain(blast_full_3_L, full_gain_3 * full_L)
		setSampleGain(blast_full_3_R, full_gain_3 * full_R)
		setSampleGain(blast_low_3_L, low_gain_3 * low_L)
		setSampleGain(blast_low_3_R, low_gain_3 * low_R)
		setSampleGain(blast_far_3_L, far_gain_3 * far_L)
		setSampleGain(blast_far_3_R, far_gain_3 * far_R)
		setSamplePitch(blast_full_3_L, 1000 + dopp)
		setSamplePitch(blast_full_3_R, 1000 + dopp)
		setSamplePitch(blast_low_3_L, low_pitch_3)
		setSamplePitch(blast_low_3_R, low_pitch_3)
		setSamplePitch(blast_far_3_L, 1000 + dopp)
		setSamplePitch(blast_far_3_R, 1000 + dopp)
		-- Fan rattle (engines 1 and 3): centred on N1 ~0.5%, i.e. a fan that has just started to turn
		-- (start of spool-up, end of run-down), exactly as in B. Very close range (fade distance 10).
		local ratl_1_L, ratl_1_R = out_balance (-3.34, 5, 0, 30, 120, 10)
		local rn1_1 = math.abs(get(snd_knd_1))
		local rattle_gn_1 = 1000 * 0.2 * math.exp(-math.pow((rn1_1 - 0.5) / 0.2543, 2)) * 2 * math.min(rn1_1 / 0.05, 1) * rattle_level * main_vol
		local rattle_pitch_1 = math.min(1000 * (0.9747 * rn1_1 + 0.381), 2000)
		setSampleGain(rattle_L_1, ratl_1_L * rattle_gn_1)
		setSampleGain(rattle_R_1, ratl_1_R * rattle_gn_1)
		setSamplePitch(rattle_L_1, rattle_pitch_1)
		setSamplePitch(rattle_R_1, rattle_pitch_1)
		local ratl_3_L, ratl_3_R = out_balance (3.34, 5, 0, 30, 120, 10)
		local rn1_3 = math.abs(get(snd_knd_3))
		local rattle_gn_3 = 1000 * 0.2 * math.exp(-math.pow((rn1_3 - 0.5) / 0.2543, 2)) * 2 * math.min(rn1_3 / 0.05, 1) * rattle_level * main_vol
		local rattle_pitch_3 = math.min(1000 * (0.9747 * rn1_3 + 0.381), 2000)
		setSampleGain(rattle_L_3, ratl_3_L * rattle_gn_3)
		setSampleGain(rattle_R_3, ratl_3_R * rattle_gn_3)
		setSamplePitch(rattle_L_3, rattle_pitch_3)
		setSamplePitch(rattle_R_3, rattle_pitch_3)
		
		-- out_high: engine direction/distance balance x N2 gain (0 below N2 70, full at 98)
		setSampleGain(out_high_left_1, eng_1_L * interpolate(out_high_gain_tbl, rpm_1) * out_high_level * main_vol)
		setSampleGain(out_high_right_1, eng_1_R * interpolate(out_high_gain_tbl, rpm_1) * out_high_level * main_vol)
		setSampleGain(out_high_left_2, eng_2_L * interpolate(out_high_gain_tbl, rpm_2) * out_high_level * main_vol)
		setSampleGain(out_high_right_2, eng_2_R * interpolate(out_high_gain_tbl, rpm_2) * out_high_level * main_vol)
		setSampleGain(out_high_left_3, eng_3_L * interpolate(out_high_gain_tbl, rpm_3) * out_high_level * main_vol)
		setSampleGain(out_high_right_3, eng_3_R * interpolate(out_high_gain_tbl, rpm_3) * out_high_level * main_vol)
		
		setSampleGain(out_apu_left, 1000 * apu_L * rpm_gain_apu * main_vol)
		setSampleGain(out_apu_right, 1000 * apu_R * rpm_gain_apu * main_vol)
		setSampleGain(deice_out_L, 200 * main_vol*dist_coef*deice_coef)
		setSampleGain(deice_out_R, 200 * main_vol*dist_coef*deice_coef)
		setSampleGain(inn_reverse,0)
	
	
	end

	
	
	
	
	-- engine shutdown one-shot
	shut_update(external, dopp, main_vol, passed == 0 or get(main_sound_on) == 0)

	-- FS2004 soundset experiment (overrides the old engine running layers when ON)
	fs9_update(external, rpm_1, rpm_2, rpm_3, dopp, main_vol, passed == 0 or get(main_sound_on) == 0)

	-- mute all sounds
	if passed == 0 or get(main_sound_on) == 0 then
		setSampleGain(inn_middle_left_1, 0)
		setSampleGain(es_n1_inn[1][1], 0)
		setSampleGain(inn_middle_right_1, 0)
		setSampleGain(es_n1_inn[1][2], 0)
		setSampleGain(inn_starter_left_new_1, 0)
		setSampleGain(inn_starter_right_new_1, 0)
	
		setSampleGain(inn_middle_left_2, 0)
		setSampleGain(es_n1_inn[2][1], 0)
		setSampleGain(inn_middle_right_2, 0)
		setSampleGain(es_n1_inn[2][2], 0)
		setSampleGain(inn_starter_left_new_2, 0)
		setSampleGain(inn_starter_right_new_2, 0)
		
		setSampleGain(inn_middle_left_3, 0)
		setSampleGain(es_n1_inn[3][1], 0)
		setSampleGain(inn_middle_right_3, 0)
		setSampleGain(es_n1_inn[3][2], 0)
		setSampleGain(inn_starter_left_new_3, 0)
		setSampleGain(inn_starter_right_new_3, 0)
		setSampleGain(deice_out_L, 0)
		setSampleGain(deice_out_R, 0)
		setSampleGain(out_high_left_1, 0)
		setSampleGain(out_high_right_1, 0)
		setSampleGain(out_high_left_2, 0)
		setSampleGain(out_high_right_2, 0)
		setSampleGain(out_high_left_3, 0)
		setSampleGain(out_high_right_3, 0)
		setSampleGain(blast_full_1_L, 0)
		setSampleGain(blast_full_1_R, 0)
		setSampleGain(blast_low_1_L, 0)
		setSampleGain(blast_low_1_R, 0)
		setSampleGain(blast_far_1_L, 0)
		setSampleGain(blast_far_1_R, 0)
		setSampleGain(blast_full_2_L, 0)
		setSampleGain(blast_full_2_R, 0)
		setSampleGain(blast_low_2_L, 0)
		setSampleGain(blast_low_2_R, 0)
		setSampleGain(blast_far_2_L, 0)
		setSampleGain(blast_far_2_R, 0)
		setSampleGain(blast_full_3_L, 0)
		setSampleGain(blast_full_3_R, 0)
		setSampleGain(blast_low_3_L, 0)
		setSampleGain(blast_low_3_R, 0)
		setSampleGain(blast_far_3_L, 0)
		setSampleGain(blast_far_3_R, 0)
		setSampleGain(rattle_L_1, 0)
		setSampleGain(rattle_R_1, 0)
		setSampleGain(rattle_L_3, 0)
		setSampleGain(rattle_R_3, 0)

		setSampleGain(inn_apu_left, 0)
		setSampleGain(inn_apu_right, 0)
		
		setSampleGain(out_behind_left_1, 0)
		setSampleGain(out_behind_right_1, 0)
		setSampleGain(out_idle_left_1, 0)
		setSampleGain(es_n1_out[1][1], 0)
		setSampleGain(out_idle_right_1, 0)
		setSampleGain(es_n1_out[1][2], 0)
		setSampleGain(out_starter_left_1, 0)
		setSampleGain(out_starter_right_1, 0)
		
		setSampleGain(out_behind_left_2, 0)
		setSampleGain(out_behind_right_2, 0)
		setSampleGain(out_idle_left_2, 0)
		setSampleGain(es_n1_out[2][1], 0)
		setSampleGain(out_idle_right_2, 0)
		setSampleGain(es_n1_out[2][2], 0)
		setSampleGain(out_starter_left_2, 0)
		setSampleGain(out_starter_right_2, 0)
		
		setSampleGain(out_behind_left_3, 0)
		setSampleGain(out_behind_right_3, 0)
		setSampleGain(out_idle_left_3, 0)
		setSampleGain(es_n1_out[3][1], 0)
		setSampleGain(out_idle_right_3, 0)
		setSampleGain(es_n1_out[3][2], 0)
		setSampleGain(out_starter_left_3, 0)
		setSampleGain(out_starter_right_3, 0)
		
		setSampleGain(out_apu_left, 0)
		setSampleGain(out_apu_right, 0)
		setSampleGain(inn_reverse, 0)
		setSampleGain(out_reverse_L, 0)
		setSampleGain(out_reverse_R, 0)
	end

end
