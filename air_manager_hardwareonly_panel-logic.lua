-- AP Master Switch
function Switch_APMaster_click_callback(position)
    if position == 0 then
        fsx_event("AUTOPILOT_OFF")
        hw_output_set(outp1, false)
    elseif position == 1 then
        fsx_event("AUTOPILOT_ON")
        hw_output_set(outp1, true)
    end
end

function new_Switch_APMaster_pos_fsx(position)
aphw_pos = hw_switch_get_position(hw_Switch_APMaster)
if (aphw_pos == position) then 
if (position == true) then 
fsx_event("AP_MASTER")
end
end
end

function Switch_APMaster_led_fsx(position)
if (position == true) then
hw_output_set(outp1, true)
elseif (position == false) then
hw_output_set(outp1, false)
end
end




fsx_variable_subscribe("AUTOPILOT MASTER", "Bool", new_Switch_APMaster_pos_fsx)
fsx_variable_subscribe("AUTOPILOT MASTER", "Bool", Switch_APMaster_led_fsx)

-- button release general
function buttonrelease(position)
end

-- Heading hold

function new_ap_heading_switch_pos_fsx(position)
fsx_event("AP_PANEL_HEADING_HOLD")
end

function Switch_APHeading_led_fsx(position)
if (position == true) then
hw_output_set(outp2, true)
elseif (position == false) then
hw_output_set(outp2, false)
end
end

fsx_variable_subscribe("AUTOPILOT HEADING LOCK", "Bool", new_ap_heading_switch_pos_fsx)
fsx_variable_subscribe("AUTOPILOT HEADING LOCK", "Bool", Switch_APHeading_led_fsx)


-- nav hold
function new_ap_nav_switch_pos_fsx(position)
fsx_event("AP_NAV1_HOLD")
end

function Switch_APNav_led_fsx(position)
if (position == true) then
hw_output_set(outp3, true)
elseif (position == false) then
hw_output_set(outp3, false)
end
end

fsx_variable_subscribe("AUTOPILOT NAV1 LOCK", "Bool", new_ap_nav_switch_pos_fsx)
fsx_variable_subscribe("AUTOPILOT NAV1 LOCK", "Bool", Switch_APNav_led_fsx)

-- appr hold
function new_ap_appr_switch_pos_fsx(position)
fsx_event("AP_APR_HOLD")
end

function Switch_APAppr_led_fsx(position)
if (position == true) then
hw_output_set(outp4, true)
elseif (position == false) then
hw_output_set(outp4, false)
end
end

fsx_variable_subscribe("AUTOPILOT APPROACH HOLD", "Bool", new_ap_appr_switch_pos_fsx)
fsx_variable_subscribe("AUTOPILOT APPROACH HOLD", "Bool", Switch_APAppr_led_fsx)

-- BC hold
function new_ap_bc_switch_pos_fsx(position)
fsx_event("AP_BC_HOLD")
end

function Switch_APBc_led_fsx(position)
if (position == true) then
hw_output_set(outp5, true)
elseif (position == false) then
hw_output_set(outp5, false)
end
end

fsx_variable_subscribe("AUTOPILOT BACKCOURSE HOLD", "Bool", new_ap_bc_switch_pos_fsx)
fsx_variable_subscribe("AUTOPILOT BACKCOURSE HOLD", "Bool", Switch_APBc_led_fsx)

-- Alt hold
function new_ap_alt_switch_pos_fsx(position)
fsx_event("AP_ALT_HOLD")
end

function Switch_APAlt_led_fsx(position)
if (position == true) then
hw_output_set(outp6, true)
elseif (position == false) then
hw_output_set(outp6, false)
end
end

fsx_variable_subscribe("AUTOPILOT ALTITUDE LOCK", "Bool", new_ap_alt_switch_pos_fsx)
fsx_variable_subscribe("AUTOPILOT ALTITUDE LOCK", "Bool", Switch_APAlt_led_fsx)




function new_knob_hdg(value)
    if value == 1 then
        fsx_event("HEADING_BUG_INC")
    elseif value == -1 then
        fsx_event("HEADING_BUG_DEC")
    end

end

function new_knob_alt(value)
    if value == 1 then
        fsx_event("AP_ALT_VAR_INC")
    elseif value == -1 then
        fsx_event("AP_ALT_VAR_DEC")
    end

end

outp1 = hw_output_add("LED for Switch 1", false)
outp2 = hw_output_add("LED for Button 1", false)
outp3 = hw_output_add("LED for Button 2", false)
outp4 = hw_output_add("LED for Button 3", false)
outp5 = hw_output_add("LED for Button 4", false)
outp6 = hw_output_add("LED for Button 5", false)




--hw_Button_APApproachHold = hw_button_add("Button3", button3_pressed, button3_released)
--hw_Button_APBackcourseHold = hw_button_add("Button4", button4_pressed, button4_released)
--hw_Button_APAltLock = hw_button_add("Button5", button5_pressed, button5_released)



hw_dial_heading = hw_dial_add("Autopilot heading dial", 3, new_knob_hdg)
hw_dial_alt = hw_dial_add("Autopilot Altitude dial", 1, new_knob_alt)
hw_Switch_APMaster = hw_switch_add("Switch APmaster", 1, Switch_APMaster_click_callback)
hw_Button_APHeading = hw_button_add("Button1", new_ap_heading_switch_pos_fsx, buttonrelease)
hw_Button_APNavLock = hw_button_add("Button2", new_ap_nav_switch_pos_fsx, buttonrelease)
hw_Button_APAppr = hw_button_add("Button3", new_ap_appr_switch_pos_fsx, buttonrelease)
hw_Button_APBc = hw_button_add("Button4", new_ap_bc_switch_pos_fsx, buttonrelease)
hw_Button_APAlt = hw_button_add("Button5", new_ap_alt_switch_pos_fsx, buttonrelease)
--fsx_variable_subscribe("AUTOPILOT FLIGHT DIRECTOR ACTIVE", "Bool", ap_fd)

--fsx_variable_subscribe("AUTOPILOT ALTITUDE LOCK", "Bool", ap_altlock)
--fsx_variable_subscribe("AUTOPILOT MASTER", "Bool", ap_master)
--fsx_variable_subscribe("AUTOPILOT HEADING LOCK", "Bool", ap_headinglock)
--fsx_variable_subscribe("AUTOPILOT APPROACH HOLD", "Bool", ap_approachlock)
--fsx_variable_subscribe("AUTOPILOT BACKCOURSE HOLD", "Bool", ap_backcourselock)
