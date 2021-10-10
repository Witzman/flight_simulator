user_prop_bg_id = user_prop_add_boolean("Hide Panel Background", false, "Tick to hide panel background")
user_prop_knobster = user_prop_add_boolean("Knobster button", false, "Use Knobster button to run starter")

function buttonrelease(position)
end

--panel images
if (user_prop_get(user_prop_bg_id)) then
    img_add_fullscreen("sw_panel_text_only2.png")
else
    img_add_fullscreen("sw_panel1.png")
end

-- led switches

function switch_landing_led(position)
if (position == true) then
hw_output_set(outp4, true)
elseif (position == false) then
hw_output_set(outp4, false)
end
end

function switch_strobe_led(position)
if (position == true) then
hw_output_set(outp1, true)
elseif (position == false) then
hw_output_set(outp1, false)
end
end

function switch_nav_led(position)
if (position == true) then
hw_output_set(outp2, true)
elseif (position == false) then
hw_output_set(outp2, false)
end
end

function switch_taxi_led(position)
if (position == true) then
hw_output_set(outp3, true)
elseif (position == false) then
hw_output_set(outp3, false)
end
end

function switch_beacon_led(position)
if (position == true) then
hw_output_set(outp5, true)
elseif (position == false) then
hw_output_set(outp5, false)
end
end

function switch_fuel_led(position)
if (position == true) then
hw_output_set(outp6, true)
elseif (position == false) then
hw_output_set(outp6, false)
end
end

function switch_pitot_led(position)
if (position == true) then
hw_output_set(outp9, true)
elseif (position == false) then
hw_output_set(outp9, false)
end
end

function switch_avion_led(position)
if (position == true) then
switch_fuel(position)
switch_beacon(position)
switch_landing(position)
switch_nav(position)
switch_taxi(position)
switch_strobe(position)
switch_pitot(position)
elseif (position == false) then
switch_fuel_led(position)
switch_beacon_led(position)
switch_landing_led(position)
switch_nav_led(position)
switch_taxi_led(position)
switch_strobe_led(position)
switch_pitot_led(position) 
end
end

function switch_bat_led(position)
if (position == true) then
switch_fuel(position)
switch_beacon(position)
switch_landing(position)
switch_nav(position)
switch_taxi(position)
switch_strobe(position)
switch_pitot(position)
elseif (position == false) then
switch_fuel_led(position)
switch_beacon_led(position)
switch_landing_led(position)
switch_nav_led(position)
switch_taxi_led(position)
switch_strobe_led(position)
switch_pitot_led(position) 
end
end

-- FUEL PUMP SWITCH
function switch_fuel(sw_on)
if (sw_on == true) then
fpvalue = 1
elseif (sw_on == false) then
fpvalue = 0
end
local fphw_pos = hw_switch_get_position(hw_switch_FuelPump)
if (fphw_pos == fpvalue) then 
fsx_event("TOGGLE_ELECT_FUEL_PUMP1")
end
switch_fuel_led(sw_on)
end

fsx_variable_subscribe("GENERAL ENG FUEL PUMP SWITCH:1", "Bool", switch_fuel)
-- END FUEL PUMP SWITCH

-- BEACON SWITCH
function switch_beacon(sw_on)
if (sw_on == true) then
beaconvalue = 0
elseif (sw_on == false) then
beaconvalue = 1
end
local beaconhw_pos = hw_switch_get_position(hw_switch_beacon)
if (beaconhw_pos == beaconvalue) then 
else
fsx_event("TOGGLE_BEACON_LIGHTS")
end
switch_beacon_led(sw_on)
end

fsx_variable_subscribe("LIGHT BEACON", "Bool", switch_beacon)
-- END BEACON SWITCH



-- LANDING LIGHT SWITCH



function switch_landing(sw_on)
if (sw_on == true) then
landingvalue = 0
elseif (sw_on == false) then
landingvalue = 1
end
local landinghw_pos = hw_switch_get_position(hw_switch_landing)
if (landinghw_pos == landingvalue) then 
else
if landinghw_pos == 0 then
        fsx_event("LANDING_LIGHTS_ON")
    elseif landinghw_pos == 1 then
        fsx_event("LANDING_LIGHTS_OFF")
    end
end
switch_landing_led(sw_on)
end

fsx_variable_subscribe("LIGHT LANDING", "Bool", switch_landing)
-- END LANDING LIGHT SWITCH



-- TAXI LIGHT SWITCH
function switch_taxi(sw_on)
if (sw_on == true) then
taxivalue = 0
elseif (sw_on == false) then
taxivalue = 1
end
local taxihw_pos = hw_switch_get_position(hw_switch_taxi)
if (taxihw_pos == taxivalue) then 
else
fsx_event("TOGGLE_TAXI_LIGHTS")
end
switch_taxi_led(sw_on)
end


fsx_variable_subscribe("LIGHT TAXI", "Bool", switch_taxi)

-- END TAXI LIGHT SWITCH

-- NAV LIGHTS SWITCH
function switch_nav(sw_on)
if (sw_on == true) then
navvalue = 0
elseif (sw_on == false) then
navvalue = 1
end
local navhw_pos = hw_switch_get_position(hw_switch_nav)
if (navhw_pos == navvalue) then 
else
fsx_event("TOGGLE_NAV_LIGHTS")
end
switch_nav_led(sw_on)
end

fsx_variable_subscribe("LIGHT NAV", "Bool", switch_nav)
-- END NAV LIGHTS SWITCH

-- STROBE SWITCH
function switch_strobe(sw_on)
if (sw_on == true) then
strobevalue = 0
elseif (sw_on == false) then
strobevalue = 1
end
local strobehw_pos = hw_switch_get_position(hw_switch_strobe)
if (strobehw_pos == strobevalue) then 
else
if strobehw_pos == 0 then
        fsx_event("STROBES_ON")
    elseif strobehw_pos == 1 then
        fsx_event("STROBES_OFF")
    end
end
switch_strobe_led(sw_on)
end




fsx_variable_subscribe("LIGHT STROBE", "Bool", switch_strobe)
-- END STROBE SWITCH

-- PITOT HEAT SWITCH
function switch_pitot(sw_on)
if (sw_on == true) then
pitotvalue = 0
elseif (sw_on == false) then
pitotvalue = 1
end
local pitothw_pos = hw_switch_get_position(hw_switch_pitot)
if (pitothw_pos == pitotvalue) then 
else
if pitothw_pos == 0 then
        fsx_event("PITOT_HEAT_ON")
    elseif pitothw_pos == 1 then
        fsx_event("PITOT_HEAT_OFF")
    end
end
switch_pitot_led(sw_on)
end

fsx_variable_subscribe("PITOT HEAT", "Bool", switch_pitot)

-- END PITOT HEAT SWITCH






-- BATTERY SWITCH
function switch_bat(sw_on)
if (sw_on == true) then
batvalue = 0
elseif (sw_on == false) then
batvalue = 1
end
local bathw_pos = hw_switch_get_position(hw_switch_batt)
if (bathw_pos == batvalue) then 
else
fsx_event("TOGGLE_MASTER_ALTERNATOR")
fsx_event("TOGGLE_MASTER_BATTERY")
end
switch_bat_led(sw_on)
end

fsx_variable_subscribe("ELECTRICAL MASTER BATTERY", "Bool", switch_bat)
fsx_variable_subscribe("GENERAL ENG GENERATOR SWITCH:1", "Bool", switch_bat)
fsx_variable_subscribe("ELECTRICAL MASTER BATTERY", "Bool", switch_bat)

-- END BATTERY SWITCH

-- AVIONICS MASTER SWITCH
function switch_avion(sw_on)
if (sw_on == true) then
avionvalue = 0
elseif (sw_on == false) then
avionvalue = 1
end
local avionhw_pos = hw_switch_get_position(hw_switch_avion)
if (avionhw_pos == avionvalue) then 
else
fsx_event("TOGGLE_AVIONICS_MASTER")
end
switch_avion_led(sw_on)
end


fsx_variable_subscribe("AVIONICS MASTER SWITCH", "Bool", switch_avion)
fsx_variable_subscribe("AVIONICS MASTER SWITCH", "Bool", switch_avion)
-- END AVIONICS MASTER SWITCH


-- END X-TIE SWITCH

-- IGNITION KEY
img_add("key_ring.png", 31, 72, 125, 125)
ign_off = img_add("key_ctr_off.png",44,85,100,100)
ign_right = img_add("key_ctr_r.png",44,85,100,100)
ign_left = img_add("key_ctr_l.png",44,85,100,100)
ign_both = img_add("key_ctr_both.png",44,85,100,100)
ign_start = img_add("key_ctr_start.png",44,85,100,100)
visible(ign_off,true)
visible(ign_right,false)
visible(ign_left,false)
visible(ign_both,false)
visible(ign_start,false)

local ign_state = 0

function ignition_callback(ig_dir)

    --keep the switch position within bounds
    ign_state = var_cap(ign_state + ig_dir, 0, 4)

    --update sim with selected key switch state
    if ign_state == 0 then
        xpl_dataref_write("sim/cockpit2/engine/actuators/ignition_key", "INT[8]", {0}, 0)
     fsx_event("MAGNETO1_OFF")
     fs2020_event("MAGNETO1_OFF")
    elseif ign_state == 1 then 
        xpl_dataref_write("sim/cockpit2/engine/actuators/ignition_key", "INT[8]", {1}, 0)
    if (ig_dir == -1) then fsx_event("MAGNETO1_LEFT") end
    if (ig_dir == -1) then fs2020_event("MAGNETO1_LEFT") end
    fsx_event("MAGNETO1_RIGHT")
    fs2020_event("MAGNETO1_RIGHT")
    elseif ign_state == 2 then 
        xpl_dataref_write("sim/cockpit2/engine/actuators/ignition_key", "INT[8]", {2}, 0)
    if (ig_dir == 1) then
            fsx_event("MAGNETO1_RIGHT")
            fs2020_event("MAGNETO1_RIGHT")
            fsx_event("MAGNETO1_LEFT")
            fs2020_event("MAGNETO1_LEFT")
    elseif (ig_dir == -1) then
            fsx_event("MAGNETO1_RIGHT")
            fs2020_event("MAGNETO1_RIGHT")
        end
    elseif ign_state == 3 then 
        xpl_dataref_write("sim/cockpit2/engine/actuators/ignition_key", "INT[8]", {3}, 0)
    fsx_event("MAGNETO1_BOTH")
    fs2020_event("MAGNETO1_BOTH")
    elseif ign_state == 4 then 
        --force start
        xpl_dataref_write("sim/cockpit2/engine/actuators/ignition_key", "INT[8]", {4}, 0, true)
    fsx_event("MAGNETO1_START")
    fs2020_event("MAGNETO1_START")
    end

end

function ignition_button_pressed()
    if ign_state == 3 then
        xpl_command("sim/starters/engage_starter_1", 1)
        fsx_event("MAGNETO1_START")
        fs2020_event("MAGNETO1_START")
    end
end

function ignition_button_released()
    xpl_command("sim/starters/engage_starter_1", 0)
    if ign_state == 4 then
        fsx_event("MAGNETO1_BOTH")
        fs2020_event("MAGNETO1_BOTH")
    end
end

function key_pressed()
    --do nothing
end

function key_released()
    --disable start forcing when released from start position
    if (ign_state == 4) then xpl_dataref_write("sim/cockpit2/engine/actuators/ignition_key", "INT[8]", {3}, 0, false) end
end


ignition_sw = dial_add(nil,44,85,100,100,ignition_callback, key_pressed, key_released)
if user_prop_get(user_prop_knobster) then
    button_add(nil,nil,44,85,100,100,ignition_button_pressed, ignition_button_released)
end

function new_ignition(ign_pos)
    visible(ign_off, ign_pos[1] == 0)
    visible(ign_right, ign_pos[1] == 1)
    visible(ign_left, ign_pos[1] == 2)
    visible(ign_both, ign_pos[1] == 3)
    visible(ign_start, ign_pos[1] == 4)
    ign_state = ign_pos[1]
end

function new_ignition_fsx(left_state, right_state, start_state)

    if (not left_state and not right_state) then
        ign_pos = 0 --off
    elseif (not left_state and right_state) then
        ign_pos = 1 -- right
    elseif (left_state and not right_state) then
        ign_pos = 2 --left
    elseif (left_state and right_state and not start_state) then
        ign_pos = 3 --both
    elseif (left_state and right_state and start_state) then
        ign_pos = 4 --start
    end
    new_ignition({ign_pos})

end

xpl_dataref_subscribe("sim/cockpit2/engine/actuators/ignition_key", "INT[8]", new_ignition)
fsx_variable_subscribe("RECIP ENG LEFT MAGNETO:1", "Bool",
                       "RECIP ENG RIGHT MAGNETO:1", "Bool",
                       "GENERAL ENG STARTER:1", "Bool", new_ignition_fsx)
fs2020_variable_subscribe("RECIP ENG LEFT MAGNETO:1", "Bool",
                          "RECIP ENG RIGHT MAGNETO:1", "Bool",
                          "GENERAL ENG STARTER:1", "Bool", new_ignition_fsx)                       
-- END IGNITION KEY

hw_switch_FuelPump = hw_switch_add("switch_fuel", 1, switch_fuel)
hw_switch_beacon = hw_switch_add("switch_beacon", 1, switch_beacon)
hw_switch_landing = hw_switch_add("switch_landing", 1, switch_landing)
hw_switch_taxi = hw_switch_add("switch_taxi", 1, switch_taxi)
hw_switch_nav = hw_switch_add("switch_nav", 1, switch_nav)
hw_switch_strobe = hw_switch_add("switch_strobe", 1, switch_strobe)
hw_switch_pitot = hw_switch_add("switch_pitot", 1, switch_pitot)
hw_switch_avion = hw_switch_add("switch_avion", 1, switch_avion)
hw_switch_batt = hw_switch_add("switch_bat", 1, switch_bat)
--hw_Button_ing = hw_button_add("Button Ingite", xxxxxxxxxxxxxxx, buttonrelease)

outp1 = hw_output_add("LED for Switch fuel", false)
outp2 = hw_output_add("LED for Switch beacon", false)
outp3 = hw_output_add("LED for Switch landing", false)
outp4 = hw_output_add("LED for Switch taxi", false)
outp5 = hw_output_add("LED for Switch nav", false)
outp6 = hw_output_add("LED for Switch strobe", false)
outp7 = hw_output_add("ARDUINO_NANO_A_A6", false)
outp8 = hw_output_add("ARDUINO_NANO_A_A7", false)
outp9 = hw_output_add("ARDUINO_NANO_A_D12", false)



