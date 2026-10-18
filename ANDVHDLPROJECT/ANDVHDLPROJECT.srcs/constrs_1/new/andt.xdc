# DIP Switch SW1 for Data Inputs 
##########################################################
#INPUT GIVEN FROM THE S0 SWITCH 
set_property PACKAGE_PIN R7 [get_ports S0]
set_property IOSTANDARD LVCMOS33 [get_ports S0]
set_property PULLTYPE PULLUP [get_ports S0]

# INPUT GIVEN FROM THE S1 SWITCH 
set_property PACKAGE_PIN A14 [get_ports S1]
set_property IOSTANDARD LVCMOS33 [get_ports S1]
set_property PULLTYPE PULLUP [get_ports S1]

###########################################################
# S0 AND S1 INPUTS AND LOGIC OUTPUT GIVEN TO THE TRAFFIC LIGHT CONTROLLER RN LED OUTPUT
# OUTPUT OF AND DISPALY ON BUZZER OUTPUT
set_property PACKAGE_PIN B15 [get_ports RNOUT]
# OUTPUT OF AND DISPALY ON RN LED OUTPUT
#set_property PACKAGE_PIN E17 [get_ports RNOUT]
set_property IOSTANDARD LVCMOS33 [get_ports RNOUT]
set_property DRIVE 12 [get_ports RNOUT