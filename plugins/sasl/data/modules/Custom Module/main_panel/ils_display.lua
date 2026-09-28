-- ILS/NAV frequency displays for the two NAV screens.
-- LEFT screen  = NAV1
-- RIGHT screen = NAV2
-- Power follows the same Kurs-MP N1/N2 switches as the distance displays
-- (curs_np_on_1/2 + both buses), since both screens belong to the same unit.

nav1_freq_hz = globalPropertyf("sim/cockpit2/radios/actuators/nav1_frequency_hz")
nav2_freq_hz = globalPropertyf("sim/cockpit2/radios/actuators/nav2_frequency_hz")

curs_np_on_1 = globalPropertyi("tu154b2/custom/switchers/ovhd/curs_np_on_1")
curs_np_on_2 = globalPropertyi("tu154b2/custom/switchers/ovhd/curs_np_on_2")
bus36_volt = globalPropertyf("tu154b2/custom/elec/bus36_volt_pts250_2")
bus115_volt = globalPropertyf("tu154b2/custom/elec/bus115_1_volt")

local function fullBrightness()
	return 1.0
end

local function powered_1()
	return get(curs_np_on_1) == 1 and get(bus36_volt) > 30 and get(bus115_volt) > 100
end

local function powered_2()
	return get(curs_np_on_2) == 1 and get(bus36_volt) > 30 and get(bus115_volt) > 100
end

-- RIGHT screen = NAV2
ils_display_r = avionicsDevice {
	name = "ILS Freq Display R",
	id = "tu154b2/ils_display_r",
	size = {310, 65},
	screenClear = true,
	brightnessCallback = fullBrightness,
	components = {
		ils_freq_text { freqHz = nav2_freq_hz, powered = powered_2 }
	}
}

-- LEFT screen = NAV1
ils_display_l = avionicsDevice {
	name = "ILS Freq Display L",
	id = "tu154b2/ils_display_l",
	size = {310, 65},
	screenClear = true,
	brightnessCallback = fullBrightness,
	components = {
		ils_freq_text { freqHz = nav1_freq_hz, powered = powered_1 }
	}
}
