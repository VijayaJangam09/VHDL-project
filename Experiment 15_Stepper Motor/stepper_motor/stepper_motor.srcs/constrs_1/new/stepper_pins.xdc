################################################################################
## Clock (50MHz)
################################################################################
#set_property PACKAGE_PIN M7 [get_ports clk]
#set_property IOSTANDARD LVCMOS33 [get_ports clk]
#create_clock -period 20.000 -name sys_clk [get_ports clk]
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk]

################################################################################
## Reset 
################################################################################
#set_property PACKAGE_PIN E19 [get_ports reset]
#set_property IOSTANDARD LVCMOS33 [get_ports reset]

################################################################################
## DIP Switches
################################################################################
#set_property PACKAGE_PIN N21 [get_ports {dip_sw[0]}]
#set_property PACKAGE_PIN N15 [get_ports {dip_sw[1]}]
#set_property PACKAGE_PIN N19 [get_ports {dip_sw[2]}]
#set_property PACKAGE_PIN N22 [get_ports {dip_sw[3]}]
#set_property PACKAGE_PIN M19 [get_ports {dip_sw[4]}]
#set_property PACKAGE_PIN L20 [get_ports {dip_sw[5]}]

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
#set_property PACKAGE_PIN B16 [get_ports AIN1]
#set_property IOSTANDARD LVCMOS33 [get_ports AIN1]


#set_property PACKAGE_PIN A16 [get_ports AIN2]
#set_property IOSTANDARD LVCMOS33 [get_ports AIN2]


## Motor B Control (Not used for DC motor)
#set_property PACKAGE_PIN A17 [get_ports BIN1]
#set_property IOSTANDARD LVCMOS33 [get_ports BIN1]


#set_property PACKAGE_PIN C17 [get_ports BIN2]
#set_property IOSTANDARD LVCMOS33 [get_ports BIN2]


## Sleep Control 

### Fault Input (active low, with pullup)
##set_property PACKAGE_PIN P7 [get_ports fault_n]
##set_property IOSTANDARD LVCMOS33 [get_ports fault_n]
###set_property PULLTYPE PULLUP [get_ports fault_n]


#set_property PACKAGE_PIN N4 [get_ports nsleep]
#set_property IOSTANDARD LVCMOS33 [get_ports nsleep]


################################################################################
## Status LEDs
################################################################################
### Fault LED
##set_property PACKAGE_PIN P8 [get_ports fault_led]
##set_property IOSTANDARD LVCMOS33 [get_ports fault_led]


#set_property IOSTANDARD LVCMOS33 [get_ports {dip_sw[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {dip_sw[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {dip_sw[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {dip_sw[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {dip_sw[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {dip_sw[5]}]


###############################################################################
# Clock
###############################################################################
set_property PACKAGE_PIN M7 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 20.000 -name sys_clk [get_ports clk]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk]

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
# Debug LED
###############################################################################
set_property PACKAGE_PIN T6 [get_ports debug_led]
set_property IOSTANDARD LVCMOS33 [get_ports debug_led]

###############################################################################
# Motor Driver
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
