-- VHF2 frequency display, own dedicated texture (avionicsDevice) instead of
-- sampling the shared main_panel canvas -- same fix already used for NAV1/NAV2
-- (ils_display.lua/dme_display.lua), avoiding the address-guessing problem
-- entirely. One physical device; two 3D screen quads (front-panel V1 instance,
-- overhead V2 instance) both bind to it via ATTR_cockpit_device, mutually
-- exclusive via the existing kontur_on v1/v2 gating in tu154_cockpit.obj.

vhf2_freq_hz = globalPropertyf("sim/cockpit2/radios/actuators/com2_frequency_hz_833")
vhf2_on = globalPropertyi("tu154b2/custom/switchers/ovhd/vhf_2_on")
bus27_volt_right = globalPropertyf("tu154b2/custom/elec/bus27_volt_right")

-- VHF1's screen uses ATTR_cockpit (X-Plane's native 2D panel texture), which
-- runs through X-Plane's own lighting/exposure engine and naturally brightens
-- in daylight and dims at night. VHF2 uses ATTR_cockpit_device (a SASL avionics
-- screen), where brightnessCallback is the ONLY thing controlling brightness --
-- a flat constant here means VHF2 never responds to lighting at all, which is
-- why it read dark vs VHF1 in daylight and bright vs VHF1 at night. Tying this
-- to sun angle as a day/night proxy so it tracks the same general direction as
-- VHF1's real lighting response, even though the underlying mechanism differs.
sun_pitch = globalPropertyf("sim/graphics/scenery/sun_pitch_degrees")

local NIGHT_BRIGHTNESS = 0.35
local DAY_BRIGHTNESS = 0.75
local TWILIGHT_START = -6.0   -- sun pitch (deg) where dimming to night begins
local TWILIGHT_END = 15.0     -- sun pitch (deg) where full day brightness is reached

local function dayNightBrightness()
	local pitch = get(sun_pitch)
	if pitch <= TWILIGHT_START then
		return NIGHT_BRIGHTNESS
	elseif pitch >= TWILIGHT_END then
		return DAY_BRIGHTNESS
	else
		local t = (pitch - TWILIGHT_START) / (TWILIGHT_END - TWILIGHT_START)
		return NIGHT_BRIGHTNESS + t * (DAY_BRIGHTNESS - NIGHT_BRIGHTNESS)
	end
end

local function powered()
	return get(vhf2_on) == 1 and get(bus27_volt_right) > 13
end

vhf2_display = avionicsDevice {
	name = "VHF2 Freq Display",
	id = "tu154b2/vhf2_display",
	size = {440, 130},
	screenClear = true,
	brightnessCallback = dayNightBrightness,
	components = {
		vhf2_freq_text { freqHz = vhf2_freq_hz, powered = powered }
	}
}
