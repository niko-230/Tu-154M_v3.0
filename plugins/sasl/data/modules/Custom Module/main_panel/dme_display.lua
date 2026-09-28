-- DME distance displays for the two NAV radios.
-- LEFT screen  = NAV1 distance
-- RIGHT screen = NAV2 distance
-- Independent avionics-device screens, same pattern as ils_display.lua.
-- Unit (NM/KM) follows the existing nav_1/2_mile_km switches, same as course_mp.lua.
-- Power follows the real Kurs-MP unit's own power condition (course_mp.lua):
-- curs_np_on_1/2 (the Kurs-MP N1/N2 overhead switch) + both buses powered.

nav1_dme_nm = globalPropertyf("sim/cockpit2/radios/indicators/nav1_dme_distance_nm")
nav2_dme_nm = globalPropertyf("sim/cockpit2/radios/indicators/nav2_dme_distance_nm")

nav_1_mile_km = globalPropertyi("tu154b2/custom/switchers/nav_1_mile_km")
nav_2_mile_km = globalPropertyi("tu154b2/custom/switchers/nav_2_mile_km")

curs_np_on_1 = globalPropertyi("tu154b2/custom/switchers/ovhd/curs_np_on_1")
curs_np_on_2 = globalPropertyi("tu154b2/custom/switchers/ovhd/curs_np_on_2")
bus36_volt = globalPropertyf("tu154b2/custom/elec/bus36_volt_pts250_2")
bus115_volt = globalPropertyf("tu154b2/custom/elec/bus115_1_volt")

local function fullBrightness()
	return 1.0
end

-- MILE/KM indicator lamps next to each DME screen (datarefs already created in
-- dataref_creator_1.lua). Same rule as M donor's dme.lua: exactly one lamp lit per
-- side, matching that side's own mile_km switch (0 = miles, 1 = km); both off when
-- that side is unpowered.
dme_mile_left = globalPropertyf("tu154b2/custom/lights/small/dme_mile_left")
dme_km_left = globalPropertyf("tu154b2/custom/lights/small/dme_km_left")
dme_mile_right = globalPropertyf("tu154b2/custom/lights/small/dme_mile_right")
dme_km_right = globalPropertyf("tu154b2/custom/lights/small/dme_km_right")

-- NOTE: this file is include()-d directly into main.lua's own scope (not wrapped as
-- a component_name{} entry), so it must NOT define a top-level function update() --
-- ils_display.lua is include()-d right after this file and very likely defines its
-- own, which would silently overwrite this one with no error. Instead, the lamp
-- writes are piggybacked onto powered_1/powered_2, which dme_dist_text already calls
-- every frame internally (same pattern as course_mp.lua's radio_display closures) --
-- so this reuses an already-proven-working per-frame call site instead of adding a
-- new, riskier one.
local function powered_1()
	local pow = get(curs_np_on_1) == 1 and get(bus36_volt) > 30 and get(bus115_volt) > 100
	local mode = get(nav_1_mile_km)
	set(dme_mile_left, (pow and mode == 0) and 1 or 0)
	set(dme_km_left, (pow and mode == 1) and 1 or 0)
	return pow
end

local function powered_2()
	local pow = get(curs_np_on_2) == 1 and get(bus36_volt) > 30 and get(bus115_volt) > 100
	local mode = get(nav_2_mile_km)
	set(dme_mile_right, (pow and mode == 0) and 1 or 0)
	set(dme_km_right, (pow and mode == 1) and 1 or 0)
	return pow
end

-- LEFT screen = NAV1
dme_display_l = avionicsDevice {
	name = "DME Distance Display L",
	id = "tu154b2/dme_display_l",
	size = {215, 70},
	screenClear = true,
	brightnessCallback = fullBrightness,
	components = {
		dme_dist_text { distNm = nav1_dme_nm, mileKm = nav_1_mile_km, powered = powered_1 }
	}
}

-- RIGHT screen = NAV2
dme_display_r = avionicsDevice {
	name = "DME Distance Display R",
	id = "tu154b2/dme_display_r",
	size = {215, 70},
	screenClear = true,
	brightnessCallback = fullBrightness,
	components = {
		dme_dist_text { distNm = nav2_dme_nm, mileKm = nav_2_mile_km, powered = powered_2 }
	}
}
