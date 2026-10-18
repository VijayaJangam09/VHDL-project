################################################################################
## Clock (50MHz)
################################################################################
#set_property PACKAGE_PIN M7 [get_ports clk]
#set_property IOSTANDARD LVCMOS33 [get_ports clk]
#create_clock -period 20.000 -name sys_clk [get_ports clk]
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk]

################################################################################
### Reset (active high for our design)
#################################################################################
##set_property PACKAGE_PIN E19 [get_ports reset]
##set_property IOSTANDARD LVCMOS33 [get_ports reset]

################################################################################
## DIP Switches (need to add - using available pins)
################################################################################
#set_property PACKAGE_PIN R7 [get_ports {dip_sw[0]}]
#set_property PACKAGE_PIN A14 [get_ports {dip_sw[1]}]
#set_property PACKAGE_PIN P6 [get_ports {dip_sw[2]}]
#set_property PACKAGE_PIN A13 [get_ports {dip_sw[3]}]
#set_property PACKAGE_PIN R6 [get_ports {dip_sw[4]}]
#set_property PACKAGE_PIN A12 [get_ports {dip_sw[5]}]

##set_property IOSTANDARD LVCMOS33 [get_ports {dip_sw[0]}]
#set_property PULLTYPE PULLDOWN [get_ports {dip_sw[0]}]

##set_property IOSTANDARD LVCMOS33 [get_ports {dip_sw[1]}]
#set_property PULLTYPE PULLDOWN [get_ports {dip_sw[1]}]

##set_property IOSTANDARD LVCMOS33 [get_ports {dip_sw[2]}]
#set_property PULLTYPE PULLDOWN [get_ports {dip_sw[2]}]

##set_property IOSTANDARD LVCMOS33 [get_ports {dip_sw[3]}]
#set_property PULLTYPE PULLDOWN [get_ports {dip_sw[3]}]

##set_property IOSTANDARD LVCMOS33 [get_ports {dip_sw[4]}]
#set_property PULLTYPE PULLDOWN [get_ports {dip_sw[4]}]

##set_property IOSTANDARD LVCMOS33 [get_ports {dip_sw[5]}]
#set_property PULLTYPE PULLDOWN [get_ports {dip_sw[5]}]


################################################################################
## DRV8833C Motor Driver Interface
################################################################################
## Motor A Control (DC Motor)
#set_property PACKAGE_PIN AA1 [get_ports AIN1]
#set_property IOSTANDARD LVCMOS33 [get_ports AIN1]


#set_property PACKAGE_PIN T2 [get_ports AIN2]
#set_property IOSTANDARD LVCMOS33 [get_ports AIN2]


## Motor B Control (Not used for DC motor)
#set_property PACKAGE_PIN M2 [get_ports BIN1]
#set_property IOSTANDARD LVCMOS33 [get_ports BIN1]


#set_property PACKAGE_PIN M3 [get_ports BIN2]
#set_property IOSTANDARD LVCMOS33 [get_ports BIN2]


################################################################################
## Status LEDs
################################################################################
## Fault LED
#set_property PACKAGE_PIN P8 [get_ports fault_led]
#set_property IOSTANDARD LVCMOS33 [get_ports fault_led]


#set_property IOSTANDARD LVCMOS33 [get_ports {dip_sw[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {dip_sw[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {dip_sw[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {dip_sw[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {dip_sw[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {dip_sw[5]}]

###############################################################################
# Clock (50MHz)
###############################################################################
set_property PACKAGE_PIN M7 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 20.000 -name sys_clk [get_ports clk]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk]

###############################################################################
# Reset
###############################################################################
set_property PACKAGE_PIN E19 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

###############################################################################
# DIP Switches (PULLUP - active low)
###############################################################################
set_property PACKAGE_PIN R7 [get_ports {dip_sw[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dip_sw[0]}]
set_property PULLTYPE PULLUP [get_ports {dip_sw[0]}]

set_property PACKAGE_PIN A14 [get_ports {dip_sw[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dip_sw[1]}]
set_property PULLTYPE PULLUP [get_ports {dip_sw[1]}]

set_property PACKAGE_PIN P6 [get_ports {dip_sw[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dip_sw[2]}]
set_property PULLTYPE PULLUP [get_ports {dip_sw[2]}]

set_property PACKAGE_PIN A13 [get_ports {dip_sw[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dip_sw[3]}]
set_property PULLTYPE PULLUP [get_ports {dip_sw[3]}]

set_property PACKAGE_PIN R6 [get_ports {dip_sw[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dip_sw[4]}]
set_property PULLTYPE PULLUP [get_ports {dip_sw[4]}]

set_property PACKAGE_PIN A12 [get_ports {dip_sw[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dip_sw[5]}]
set_property PULLTYPE PULLUP [get_ports {dip_sw[5]}]

###############################################################################
# DRV8833C Motor Driver Interface
###############################################################################
set_property PACKAGE_PIN AA1 [get_ports AIN1]
set_property IOSTANDARD LVCMOS33 [get_ports AIN1]

set_property PACKAGE_PIN T2 [get_ports AIN2]
set_property IOSTANDARD LVCMOS33 [get_ports AIN2]

set_property PACKAGE_PIN M2 [get_ports BIN1]
set_property IOSTANDARD LVCMOS33 [get_ports BIN1]

set_property PACKAGE_PIN M3 [get_ports BIN2]
set_property IOSTANDARD LVCMOS33 [get_ports BIN2]

set_property PACKAGE_PIN B15 [get_ports nsleep]
set_property IOSTANDARD LVCMOS33 [get_ports nsleep]

###############################################################################
# Debug LED
###############################################################################
set_property PACKAGE_PIN T6 [get_ports debug_led]
set_property IOSTANDARD LVCMOS33 [get_ports debug_led]