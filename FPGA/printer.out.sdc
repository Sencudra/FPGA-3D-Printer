## Generated SDC file "printer.out.sdc"

## Copyright (C) 2018  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"

## DATE    "Thu Feb 07 19:49:39 2019"

##
## DEVICE  "5CSEBA6U23I7"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {altera_reserved_tck} -period 40.000 -waveform { 0.000 20.000 } [get_ports {altera_reserved_tck}]
create_clock -name {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk} -period 2.500 -waveform { 1.875 3.125 } [get_registers {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk}]
create_clock -name {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk} -period 2.500 -waveform { 0.000 1.250 } [get_registers {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk}]
create_clock -name {HPS_DDR3_DQS_P[0]_IN} -period 2.500 -waveform { 0.000 1.250 } [get_ports {HPS_DDR3_DQS_P[0]}] -add
create_clock -name {HPS_DDR3_DQS_P[1]_IN} -period 2.500 -waveform { 0.000 1.250 } [get_ports {HPS_DDR3_DQS_P[1]}] -add
create_clock -name {HPS_DDR3_DQS_P[2]_IN} -period 2.500 -waveform { 0.000 1.250 } [get_ports {HPS_DDR3_DQS_P[2]}] -add
create_clock -name {HPS_DDR3_DQS_P[3]_IN} -period 2.500 -waveform { 0.000 1.250 } [get_ports {HPS_DDR3_DQS_P[3]}] -add
create_clock -name {FPGA_CLK1_50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {FPGA_CLK1_50}]
create_clock -name {FPGA_CLK2_50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {FPGA_CLK2_50}]
create_clock -name {FPGA_CLK3_50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {FPGA_CLK3_50}]


#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock} -source [get_registers {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk}] -master_clock {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk} [get_registers {u0|hps_0|hps_io|border|hps_sdram_inst|p0|umemphy|uio_pads|dq_ddio[*].ubidir_dq_dqs|altdq_dqs2_inst|dqs_enable_ctrl~DQSENABLEOUT_DFF}] 
create_generated_clock -name {HPS_DDR3_CK_P} -source [get_registers {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk}] -master_clock {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk} [get_ports {HPS_DDR3_CK_P}] 
create_generated_clock -name {HPS_DDR3_CK_N} -source [get_registers {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk}] -master_clock {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk} -invert [get_ports {HPS_DDR3_CK_N}] 
create_generated_clock -name {HPS_DDR3_DQS_P[0]_OUT} -source [get_registers {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk}] -master_clock {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk} [get_ports {HPS_DDR3_DQS_P[0]}] -add
create_generated_clock -name {HPS_DDR3_DQS_P[1]_OUT} -source [get_registers {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk}] -master_clock {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk} [get_ports {HPS_DDR3_DQS_P[1]}] -add
create_generated_clock -name {HPS_DDR3_DQS_P[2]_OUT} -source [get_registers {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk}] -master_clock {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk} [get_ports {HPS_DDR3_DQS_P[2]}] -add
create_generated_clock -name {HPS_DDR3_DQS_P[3]_OUT} -source [get_registers {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk}] -master_clock {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk} [get_ports {HPS_DDR3_DQS_P[3]}] -add
create_generated_clock -name {HPS_DDR3_DQS_N[0]_OUT} -source [get_registers {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk}] -master_clock {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk} [get_ports {HPS_DDR3_DQS_N[0]}] 
create_generated_clock -name {HPS_DDR3_DQS_N[1]_OUT} -source [get_registers {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk}] -master_clock {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk} [get_ports {HPS_DDR3_DQS_N[1]}] 
create_generated_clock -name {HPS_DDR3_DQS_N[2]_OUT} -source [get_registers {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk}] -master_clock {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk} [get_ports {HPS_DDR3_DQS_N[2]}] 
create_generated_clock -name {HPS_DDR3_DQS_N[3]_OUT} -source [get_registers {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk}] -master_clock {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk} [get_ports {HPS_DDR3_DQS_N[3]}] 
create_generated_clock -name {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]} -source [get_pins {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|refclkin}] -duty_cycle 50/1 -multiply_by 12 -divide_by 2 -master_clock {FPGA_CLK1_50} [get_pins {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] 
create_generated_clock -name {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk} -source [get_pins {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|vco0ph[0]}] -duty_cycle 50/1 -multiply_by 1 -divide_by 60 -master_clock {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]} [get_pins {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] 


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK3_50}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK3_50}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK3_50}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK3_50}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK3_50}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK3_50}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK3_50}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK3_50}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK3_50}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK3_50}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK3_50}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK3_50}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK3_50}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK3_50}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK3_50}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK3_50}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK3_50}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK3_50}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK3_50}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK3_50}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK3_50}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK3_50}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK3_50}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK3_50}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK3_50}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK3_50}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK3_50}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK3_50}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK3_50}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK3_50}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK3_50}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK3_50}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK3_50}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK3_50}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK3_50}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK3_50}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK3_50}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK3_50}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK3_50}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK3_50}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK1_50}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK1_50}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK1_50}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK1_50}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK1_50}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK1_50}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK1_50}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK1_50}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK1_50}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK1_50}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK1_50}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK1_50}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK1_50}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK1_50}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK1_50}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK1_50}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK1_50}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK1_50}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK1_50}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK1_50}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK1_50}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK1_50}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK1_50}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK1_50}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK1_50}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK1_50}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK1_50}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK1_50}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK1_50}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK1_50}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK1_50}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK1_50}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK1_50}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK1_50}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK1_50}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK1_50}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK1_50}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK1_50}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK1_50}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK1_50}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK2_50}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK2_50}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK2_50}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK2_50}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK2_50}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK2_50}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK2_50}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK2_50}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK2_50}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK2_50}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK2_50}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK2_50}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK2_50}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK2_50}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK2_50}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK2_50}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK2_50}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK2_50}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK2_50}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK2_50}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK2_50}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK2_50}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK2_50}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK2_50}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK2_50}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK2_50}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK2_50}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK2_50}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK2_50}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK2_50}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK2_50}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK2_50}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK2_50}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK2_50}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK2_50}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK2_50}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK2_50}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK2_50}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK2_50}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK2_50}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_N[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_OUT}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_OUT}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_OUT}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_OUT}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {FPGA_CLK3_50}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {FPGA_CLK3_50}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {FPGA_CLK1_50}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {FPGA_CLK1_50}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {FPGA_CLK2_50}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {FPGA_CLK2_50}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {altera_reserved_tck}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {altera_reserved_tck}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {FPGA_CLK3_50}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {FPGA_CLK3_50}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {FPGA_CLK1_50}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {FPGA_CLK1_50}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {FPGA_CLK2_50}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {FPGA_CLK2_50}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -rise_to [get_clocks {altera_reserved_tck}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -fall_to [get_clocks {altera_reserved_tck}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {FPGA_CLK3_50}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {FPGA_CLK3_50}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {FPGA_CLK1_50}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {FPGA_CLK1_50}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {FPGA_CLK2_50}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {FPGA_CLK2_50}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {altera_reserved_tck}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {altera_reserved_tck}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {FPGA_CLK3_50}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {FPGA_CLK3_50}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {FPGA_CLK1_50}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {FPGA_CLK1_50}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {FPGA_CLK2_50}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {FPGA_CLK2_50}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -rise_to [get_clocks {altera_reserved_tck}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -fall_to [get_clocks {altera_reserved_tck}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {FPGA_CLK3_50}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {FPGA_CLK3_50}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {FPGA_CLK1_50}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {FPGA_CLK1_50}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {FPGA_CLK2_50}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {FPGA_CLK2_50}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {altera_reserved_tck}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {altera_reserved_tck}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {FPGA_CLK3_50}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {FPGA_CLK3_50}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {FPGA_CLK1_50}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {FPGA_CLK1_50}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {FPGA_CLK2_50}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {FPGA_CLK2_50}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -rise_to [get_clocks {altera_reserved_tck}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -fall_to [get_clocks {altera_reserved_tck}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {FPGA_CLK3_50}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {FPGA_CLK3_50}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {FPGA_CLK1_50}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {FPGA_CLK1_50}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {FPGA_CLK2_50}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {FPGA_CLK2_50}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {altera_reserved_tck}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {altera_reserved_tck}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {u0|pll_sys|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {FPGA_CLK3_50}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {FPGA_CLK3_50}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {FPGA_CLK1_50}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {FPGA_CLK1_50}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {FPGA_CLK2_50}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {FPGA_CLK2_50}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -rise_to [get_clocks {altera_reserved_tck}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -fall_to [get_clocks {altera_reserved_tck}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_N}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_N}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_N}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_N}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_N}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_N}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_N}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_N}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_N}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_N}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_N}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_N}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_N}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_N}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_N}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_N}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_N}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_N}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_N}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_N}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_N}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_N}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_N}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_N}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_N}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_N}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_N}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_N}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_N}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_N}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_N}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_N}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_N}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_N}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_N}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_N}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_N}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_N}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_N}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_N}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR3_CK_P}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {HPS_DDR3_CK_N}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {HPS_DDR3_CK_P}]  0.226  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.080  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.080  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {FPGA_CLK1_50}]  0.190  
set_clock_uncertainty -rise_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {FPGA_CLK1_50}]  0.190  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.080  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.080  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {FPGA_CLK1_50}]  0.190  
set_clock_uncertainty -fall_from [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {FPGA_CLK1_50}]  0.190  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK1_50}] -rise_to [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.190  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK1_50}] -fall_to [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.190  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK1_50}] -rise_to [get_clocks {FPGA_CLK1_50}] -setup 0.170  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK1_50}] -rise_to [get_clocks {FPGA_CLK1_50}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK1_50}] -fall_to [get_clocks {FPGA_CLK1_50}] -setup 0.170  
set_clock_uncertainty -rise_from [get_clocks {FPGA_CLK1_50}] -fall_to [get_clocks {FPGA_CLK1_50}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK1_50}] -rise_to [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.190  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK1_50}] -fall_to [get_clocks {u0|pll_sys|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.190  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK1_50}] -rise_to [get_clocks {FPGA_CLK1_50}] -setup 0.170  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK1_50}] -rise_to [get_clocks {FPGA_CLK1_50}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK1_50}] -fall_to [get_clocks {FPGA_CLK1_50}] -setup 0.170  
set_clock_uncertainty -fall_from [get_clocks {FPGA_CLK1_50}] -fall_to [get_clocks {FPGA_CLK1_50}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.060  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.060  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.060  
set_clock_uncertainty -rise_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.060  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.060  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  0.060  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -rise_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.060  
set_clock_uncertainty -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -fall_to [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|pll_write_clk_dq_write_clk}]  0.060  
set_clock_uncertainty -rise_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.260  
set_clock_uncertainty -rise_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.260  
set_clock_uncertainty -rise_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.260  
set_clock_uncertainty -rise_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.260  
set_clock_uncertainty -rise_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.260  
set_clock_uncertainty -rise_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.260  
set_clock_uncertainty -rise_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.260  
set_clock_uncertainty -rise_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.260  
set_clock_uncertainty -fall_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.260  
set_clock_uncertainty -fall_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.260  
set_clock_uncertainty -fall_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.260  
set_clock_uncertainty -fall_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.260  
set_clock_uncertainty -fall_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.260  
set_clock_uncertainty -fall_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.260  
set_clock_uncertainty -fall_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -rise_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.260  
set_clock_uncertainty -fall_from [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}] -fall_to [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.260  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}] -setup 0.310  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}] -hold 0.270  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}] -setup 0.310  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}] -hold 0.270  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}] -setup 0.310  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}] -hold 0.270  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}] -setup 0.310  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}] -hold 0.270  


#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.153 [get_ports {HPS_DDR3_DQ[0]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  -0.265 [get_ports {HPS_DDR3_DQ[0]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.153 [get_ports {HPS_DDR3_DQ[1]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  -0.265 [get_ports {HPS_DDR3_DQ[1]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.153 [get_ports {HPS_DDR3_DQ[2]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  -0.265 [get_ports {HPS_DDR3_DQ[2]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.153 [get_ports {HPS_DDR3_DQ[3]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  -0.265 [get_ports {HPS_DDR3_DQ[3]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.153 [get_ports {HPS_DDR3_DQ[4]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  -0.265 [get_ports {HPS_DDR3_DQ[4]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.153 [get_ports {HPS_DDR3_DQ[5]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  -0.265 [get_ports {HPS_DDR3_DQ[5]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.153 [get_ports {HPS_DDR3_DQ[6]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  -0.265 [get_ports {HPS_DDR3_DQ[6]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  0.153 [get_ports {HPS_DDR3_DQ[7]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[0]_IN}]  -0.265 [get_ports {HPS_DDR3_DQ[7]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.153 [get_ports {HPS_DDR3_DQ[8]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  -0.265 [get_ports {HPS_DDR3_DQ[8]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.153 [get_ports {HPS_DDR3_DQ[9]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  -0.265 [get_ports {HPS_DDR3_DQ[9]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.153 [get_ports {HPS_DDR3_DQ[10]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  -0.265 [get_ports {HPS_DDR3_DQ[10]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.153 [get_ports {HPS_DDR3_DQ[11]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  -0.265 [get_ports {HPS_DDR3_DQ[11]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.153 [get_ports {HPS_DDR3_DQ[12]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  -0.265 [get_ports {HPS_DDR3_DQ[12]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.153 [get_ports {HPS_DDR3_DQ[13]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  -0.265 [get_ports {HPS_DDR3_DQ[13]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.153 [get_ports {HPS_DDR3_DQ[14]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  -0.265 [get_ports {HPS_DDR3_DQ[14]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  0.153 [get_ports {HPS_DDR3_DQ[15]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[1]_IN}]  -0.265 [get_ports {HPS_DDR3_DQ[15]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.153 [get_ports {HPS_DDR3_DQ[16]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  -0.265 [get_ports {HPS_DDR3_DQ[16]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.153 [get_ports {HPS_DDR3_DQ[17]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  -0.265 [get_ports {HPS_DDR3_DQ[17]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.153 [get_ports {HPS_DDR3_DQ[18]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  -0.265 [get_ports {HPS_DDR3_DQ[18]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.153 [get_ports {HPS_DDR3_DQ[19]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  -0.265 [get_ports {HPS_DDR3_DQ[19]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.153 [get_ports {HPS_DDR3_DQ[20]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  -0.265 [get_ports {HPS_DDR3_DQ[20]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.153 [get_ports {HPS_DDR3_DQ[21]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  -0.265 [get_ports {HPS_DDR3_DQ[21]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.153 [get_ports {HPS_DDR3_DQ[22]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  -0.265 [get_ports {HPS_DDR3_DQ[22]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  0.153 [get_ports {HPS_DDR3_DQ[23]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[2]_IN}]  -0.265 [get_ports {HPS_DDR3_DQ[23]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.153 [get_ports {HPS_DDR3_DQ[24]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  -0.265 [get_ports {HPS_DDR3_DQ[24]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.153 [get_ports {HPS_DDR3_DQ[25]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  -0.265 [get_ports {HPS_DDR3_DQ[25]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.153 [get_ports {HPS_DDR3_DQ[26]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  -0.265 [get_ports {HPS_DDR3_DQ[26]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.153 [get_ports {HPS_DDR3_DQ[27]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  -0.265 [get_ports {HPS_DDR3_DQ[27]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.153 [get_ports {HPS_DDR3_DQ[28]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  -0.265 [get_ports {HPS_DDR3_DQ[28]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.153 [get_ports {HPS_DDR3_DQ[29]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  -0.265 [get_ports {HPS_DDR3_DQ[29]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.153 [get_ports {HPS_DDR3_DQ[30]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  -0.265 [get_ports {HPS_DDR3_DQ[30]}]
set_input_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  0.153 [get_ports {HPS_DDR3_DQ[31]}]
set_input_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[3]_IN}]  -0.265 [get_ports {HPS_DDR3_DQ[31]}]
set_input_delay -add_delay  -clock_fall -clock [get_clocks {altera_reserved_tck}]  3.000 [get_ports {altera_reserved_tdi}]
set_input_delay -add_delay  -clock_fall -clock [get_clocks {altera_reserved_tck}]  3.000 [get_ports {altera_reserved_tms}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.595 [get_ports {HPS_DDR3_ADDR[0]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.880 [get_ports {HPS_DDR3_ADDR[0]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.595 [get_ports {HPS_DDR3_ADDR[1]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.880 [get_ports {HPS_DDR3_ADDR[1]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.595 [get_ports {HPS_DDR3_ADDR[2]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.880 [get_ports {HPS_DDR3_ADDR[2]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.595 [get_ports {HPS_DDR3_ADDR[3]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.880 [get_ports {HPS_DDR3_ADDR[3]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.595 [get_ports {HPS_DDR3_ADDR[4]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.880 [get_ports {HPS_DDR3_ADDR[4]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.595 [get_ports {HPS_DDR3_ADDR[5]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.880 [get_ports {HPS_DDR3_ADDR[5]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.595 [get_ports {HPS_DDR3_ADDR[6]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.880 [get_ports {HPS_DDR3_ADDR[6]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.595 [get_ports {HPS_DDR3_ADDR[7]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.880 [get_ports {HPS_DDR3_ADDR[7]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.595 [get_ports {HPS_DDR3_ADDR[8]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.880 [get_ports {HPS_DDR3_ADDR[8]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.595 [get_ports {HPS_DDR3_ADDR[9]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.880 [get_ports {HPS_DDR3_ADDR[9]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.595 [get_ports {HPS_DDR3_ADDR[10]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.880 [get_ports {HPS_DDR3_ADDR[10]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.595 [get_ports {HPS_DDR3_ADDR[11]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.880 [get_ports {HPS_DDR3_ADDR[11]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.595 [get_ports {HPS_DDR3_ADDR[12]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.880 [get_ports {HPS_DDR3_ADDR[12]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.595 [get_ports {HPS_DDR3_ADDR[13]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.880 [get_ports {HPS_DDR3_ADDR[13]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.595 [get_ports {HPS_DDR3_ADDR[14]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.880 [get_ports {HPS_DDR3_ADDR[14]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.595 [get_ports {HPS_DDR3_BA[0]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.880 [get_ports {HPS_DDR3_BA[0]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.595 [get_ports {HPS_DDR3_BA[1]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.880 [get_ports {HPS_DDR3_BA[1]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.595 [get_ports {HPS_DDR3_BA[2]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.880 [get_ports {HPS_DDR3_BA[2]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.595 [get_ports {HPS_DDR3_CAS_N}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.880 [get_ports {HPS_DDR3_CAS_N}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.595 [get_ports {HPS_DDR3_CKE}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.880 [get_ports {HPS_DDR3_CKE}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.595 [get_ports {HPS_DDR3_CS_N}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.880 [get_ports {HPS_DDR3_CS_N}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.361 [get_ports {HPS_DDR3_DM[0]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  -0.382 [get_ports {HPS_DDR3_DM[0]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.361 [get_ports {HPS_DDR3_DM[0]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  -0.382 [get_ports {HPS_DDR3_DM[0]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.361 [get_ports {HPS_DDR3_DM[1]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  -0.382 [get_ports {HPS_DDR3_DM[1]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.361 [get_ports {HPS_DDR3_DM[1]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  -0.382 [get_ports {HPS_DDR3_DM[1]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.361 [get_ports {HPS_DDR3_DM[2]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  -0.382 [get_ports {HPS_DDR3_DM[2]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.361 [get_ports {HPS_DDR3_DM[2]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  -0.382 [get_ports {HPS_DDR3_DM[2]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.361 [get_ports {HPS_DDR3_DM[3]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  -0.382 [get_ports {HPS_DDR3_DM[3]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.361 [get_ports {HPS_DDR3_DM[3]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  -0.382 [get_ports {HPS_DDR3_DM[3]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.573 [get_ports {HPS_DDR3_DQS_P[0]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.928 [get_ports {HPS_DDR3_DQS_P[0]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.573 [get_ports {HPS_DDR3_DQS_P[1]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.928 [get_ports {HPS_DDR3_DQS_P[1]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.573 [get_ports {HPS_DDR3_DQS_P[2]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.928 [get_ports {HPS_DDR3_DQS_P[2]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.573 [get_ports {HPS_DDR3_DQS_P[3]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.928 [get_ports {HPS_DDR3_DQS_P[3]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[0]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[0]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[0]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[0]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[1]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[1]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[1]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[1]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[2]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[2]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[2]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[2]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[3]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[3]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[3]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[3]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[4]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[4]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[4]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[4]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[5]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[5]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[5]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[5]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[6]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[6]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[6]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[6]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[7]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[0]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[7]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[7]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[7]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[8]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[8]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[8]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[8]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[9]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[9]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[9]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[9]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[10]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[10]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[10]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[10]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[11]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[11]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[11]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[11]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[12]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[12]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[12]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[12]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[13]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[13]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[13]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[13]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[14]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[14]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[14]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[14]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[15]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[1]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[15]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[15]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[15]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[16]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[16]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[16]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[16]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[17]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[17]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[17]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[17]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[18]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[18]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[18]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[18]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[19]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[19]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[19]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[19]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[20]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[20]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[20]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[20]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[21]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[21]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[21]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[21]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[22]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[22]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[22]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[22]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[23]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[2]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[23]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[23]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[23]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[24]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[24]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[24]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[24]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[25]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[25]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[25]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[25]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[26]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[26]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[26]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[26]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[27]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[27]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[27]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[27]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[28]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[28]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[28]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[28]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[29]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[29]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[29]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[29]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[30]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[30]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[30]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[30]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[31]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_N[3]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[31]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  0.361 [get_ports {HPS_DDR3_DQ[31]}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]  -0.382 [get_ports {HPS_DDR3_DQ[31]}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.595 [get_ports {HPS_DDR3_ODT}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.880 [get_ports {HPS_DDR3_ODT}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.595 [get_ports {HPS_DDR3_RAS_N}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.880 [get_ports {HPS_DDR3_RAS_N}]
set_output_delay -add_delay -max -clock [get_clocks {HPS_DDR3_CK_P}]  1.595 [get_ports {HPS_DDR3_WE_N}]
set_output_delay -add_delay -min -clock [get_clocks {HPS_DDR3_CK_P}]  0.880 [get_ports {HPS_DDR3_WE_N}]
set_output_delay -add_delay  -clock [get_clocks {altera_reserved_tck}]  3.000 [get_ports {altera_reserved_tdo}]


#**************************************************************
# Set Clock Groups
#**************************************************************

set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -physically_exclusive -group [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -group [get_clocks {HPS_DDR3_DQS_P[0]_OUT HPS_DDR3_DQS_N[0]_OUT}] 
set_clock_groups -physically_exclusive -group [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -group [get_clocks {HPS_DDR3_DQS_P[1]_OUT HPS_DDR3_DQS_N[1]_OUT}] 
set_clock_groups -physically_exclusive -group [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -group [get_clocks {HPS_DDR3_DQS_P[2]_OUT HPS_DDR3_DQS_N[2]_OUT}] 
set_clock_groups -physically_exclusive -group [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -group [get_clocks {HPS_DDR3_DQS_P[3]_OUT HPS_DDR3_DQS_N[3]_OUT}] 
set_clock_groups -physically_exclusive -group [get_clocks {HPS_DDR3_DQS_P[0]_IN}] -group [get_clocks {HPS_DDR3_DQS_P[0]_OUT HPS_DDR3_DQS_N[0]_OUT}] 
set_clock_groups -physically_exclusive -group [get_clocks {HPS_DDR3_DQS_P[1]_IN}] -group [get_clocks {HPS_DDR3_DQS_P[1]_OUT HPS_DDR3_DQS_N[1]_OUT}] 
set_clock_groups -physically_exclusive -group [get_clocks {HPS_DDR3_DQS_P[2]_IN}] -group [get_clocks {HPS_DDR3_DQS_P[2]_OUT HPS_DDR3_DQS_N[2]_OUT}] 
set_clock_groups -physically_exclusive -group [get_clocks {HPS_DDR3_DQS_P[3]_IN}] -group [get_clocks {HPS_DDR3_DQS_P[3]_OUT HPS_DDR3_DQS_N[3]_OUT}] 


#**************************************************************
# Set False Path
#**************************************************************

set_false_path  -fall_from  [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  -to  [get_clocks {HPS_DDR3_CK_P}]
set_false_path  -from  [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  -to  [get_clocks {*_IN}]
set_false_path  -from  [get_clocks *]  -to  [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]
set_false_path  -fall_from  [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  -to  [get_clocks {HPS_DDR3_CK_P}]
set_false_path  -from  [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}]  -to  [get_clocks {*_IN}]
set_false_path  -from  [get_clocks *]  -to  [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|jupdate}] -to [get_registers {*|alt_jtag_atlantic:*|jupdate1*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|rdata[*]}] -to [get_registers {*|alt_jtag_atlantic*|td_shift[*]}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|read}] -to [get_registers {*|alt_jtag_atlantic:*|read1*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|read_req}] 
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|rvalid}] -to [get_registers {*|alt_jtag_atlantic*|td_shift[*]}]
set_false_path -from [get_registers {*|t_dav}] -to [get_registers {*|alt_jtag_atlantic:*|tck_t_dav}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|user_saw_rvalid}] -to [get_registers {*|alt_jtag_atlantic:*|rvalid0*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|wdata[*]}] -to [get_registers *]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|write}] -to [get_registers {*|alt_jtag_atlantic:*|write1*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|write_stalled}] -to [get_registers {*|alt_jtag_atlantic:*|t_ena*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|write_stalled}] -to [get_registers {*|alt_jtag_atlantic:*|t_pause*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|write_valid}] 
set_false_path -to [get_keepers {*altera_std_synchronizer:*|din_s1}]
set_false_path -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -to [get_ports {{HPS_DDR3_ADDR[0]} {HPS_DDR3_ADDR[10]} {HPS_DDR3_ADDR[11]} {HPS_DDR3_ADDR[12]} {HPS_DDR3_ADDR[13]} {HPS_DDR3_ADDR[14]} {HPS_DDR3_ADDR[1]} {HPS_DDR3_ADDR[2]} {HPS_DDR3_ADDR[3]} {HPS_DDR3_ADDR[4]} {HPS_DDR3_ADDR[5]} {HPS_DDR3_ADDR[6]} {HPS_DDR3_ADDR[7]} {HPS_DDR3_ADDR[8]} {HPS_DDR3_ADDR[9]} {HPS_DDR3_BA[0]} {HPS_DDR3_BA[1]} {HPS_DDR3_BA[2]} HPS_DDR3_CAS_N HPS_DDR3_CKE HPS_DDR3_CS_N HPS_DDR3_ODT HPS_DDR3_RAS_N HPS_DDR3_WE_N}]
set_false_path -from [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]
set_false_path -from [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]
set_false_path -from [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]
set_false_path -from [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]
set_false_path -from [get_registers {*altera_jtag_src_crosser:*|sink_data_buffer*}] -to [get_registers {*altera_jtag_src_crosser:*|src_data*}]
set_false_path -to [get_pins -nocase -compatibility_mode {*|alt_rst_sync_uq1|altera_reset_synchronizer_int_chain*|clrn}]
set_false_path -fall_from [get_clocks {soc_system:u0|soc_system_hps_0:hps_0|soc_system_hps_0_hps_io:hps_io|soc_system_hps_0_hps_io_border:border|hps_sdram:hps_sdram_inst|hps_sdram_pll:pll|afi_clk_write_clk}] -to [get_ports {{HPS_DDR3_ADDR[0]} {HPS_DDR3_ADDR[10]} {HPS_DDR3_ADDR[11]} {HPS_DDR3_ADDR[12]} {HPS_DDR3_ADDR[13]} {HPS_DDR3_ADDR[14]} {HPS_DDR3_ADDR[1]} {HPS_DDR3_ADDR[2]} {HPS_DDR3_ADDR[3]} {HPS_DDR3_ADDR[4]} {HPS_DDR3_ADDR[5]} {HPS_DDR3_ADDR[6]} {HPS_DDR3_ADDR[7]} {HPS_DDR3_ADDR[8]} {HPS_DDR3_ADDR[9]} {HPS_DDR3_BA[0]} {HPS_DDR3_BA[1]} {HPS_DDR3_BA[2]} HPS_DDR3_CAS_N HPS_DDR3_CKE HPS_DDR3_CS_N HPS_DDR3_ODT HPS_DDR3_RAS_N HPS_DDR3_WE_N}]
set_false_path -from [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*c0|hmc_inst~FF_*}] -to [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|*uio_pads|*uaddr_cmd_pads|*ddio_out*}]
set_false_path -from [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*lfifo~LFIFO_IN_READ_EN_DFF}]
set_false_path -from [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*c0|hmc_inst~FF_*}] -to [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*lfifo~LFIFO_IN_READ_EN_DFF}]
set_false_path -from [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*vfifo~INC_WR_PTR_DFF}]
set_false_path -from [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*c0|hmc_inst~FF_*}] -to [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*altdq_dqs2_inst|vfifo~QVLD_IN_DFF}]
set_false_path -from [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*lfifo~LFIFO_OUT_RDATA_VALID_DFF}] -to [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}]
set_false_path -from [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*altdq_dqs2_inst|vfifo~QVLD_IN_DFF}]
set_false_path -from [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*lfifo~RD_LATENCY_DFF*}]
set_false_path -from [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|*uio_pads|*uaddr_cmd_pads|*ddio_out*}]
set_false_path -from [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|*altdq_dqs2_inst|*output_path_gen[*].ddio_out*}]
set_false_path -from [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|*altdq_dqs2_inst|extra_output_pad_gen[*].ddio_out*}]
set_false_path -from [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}]
set_false_path -from [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*c0|hmc_inst~FF_*}] -to [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}]
set_false_path -from [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*c0|hmc_inst~FF_*}]
set_false_path -from [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*phase_align_os~DFF*}]
set_false_path -from [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*altdq_dqs2_inst|*read_fifo~OUTPUT_DFF_*}] -to [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}]
set_false_path -to [get_ports {HPS_DDR3_DQS_N[0]}]
set_false_path -to [get_ports {HPS_DDR3_DQS_N[1]}]
set_false_path -to [get_ports {HPS_DDR3_DQS_N[2]}]
set_false_path -to [get_ports {HPS_DDR3_DQS_N[3]}]
set_false_path -to [get_ports {HPS_DDR3_CK_P}]
set_false_path -to [get_ports {HPS_DDR3_CK_N}]
set_false_path -to [get_ports {HPS_DDR3_RESET_N}]
set_false_path -from [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_clocks {HPS_DDR3_DQS_P[0]_OUT}]
set_false_path -from [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_clocks {HPS_DDR3_DQS_P[1]_OUT}]
set_false_path -from [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_clocks {HPS_DDR3_DQS_P[2]_OUT}]
set_false_path -from [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_clocks {HPS_DDR3_DQS_P[3]_OUT}]
set_false_path -from [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*altdq_dqs2_inst|dqs_enable_ctrl~*}] -to [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*altdq_dqs2_inst|dqs_delay_chain~POSTAMBLE_DFF}]
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3768}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3769}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3770}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3771}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3773}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3774}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3775}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3776}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3778}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3779}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3780}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3781}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3783}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3784}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3785}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3786}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3790}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3792}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3793}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3795}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3796}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3797}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3798}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3799}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3800}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3802}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3803}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3805}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3806}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3808}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3809}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3811}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3812}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3813}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3815}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3816}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3817}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3818}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3820}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3821}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3822}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3823}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3830}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3831}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3832}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3834}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3835}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_3837}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_4494}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_4495}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_4496}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_4497}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_4498}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_4499}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_4500}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_4501}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_4502}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_4503}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_4504}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_4505}] 
set_false_path -from [get_registers {*fpga_interfaces|f2sdram~FF_4506}] 
set_false_path -to [get_registers {*fpga_interfaces|f2sdram~FF_1054}]
set_false_path -to [get_registers {*fpga_interfaces|f2sdram~FF_1055}]
set_false_path -to [get_registers {*fpga_interfaces|f2sdram~FF_1056}]
set_false_path -to [get_registers {*fpga_interfaces|f2sdram~FF_1057}]
set_false_path -to [get_registers {*fpga_interfaces|f2sdram~FF_1118}]
set_false_path -to [get_registers {*fpga_interfaces|f2sdram~FF_1119}]
set_false_path -to [get_registers {*fpga_interfaces|f2sdram~FF_1120}]
set_false_path -to [get_registers {*fpga_interfaces|f2sdram~FF_1121}]
set_false_path -to [get_registers {*fpga_interfaces|f2sdram~FF_3405}]
set_false_path -to [get_registers {*fpga_interfaces|f2sdram~FF_3408}]
set_false_path -to [get_registers {*fpga_interfaces|f2sdram~FF_3409}]
set_false_path -to [get_registers {*fpga_interfaces|f2sdram~FF_3410}]
set_false_path -to [get_registers {*fpga_interfaces|f2sdram~FF_3414}]
set_false_path -to [get_registers {*fpga_interfaces|f2sdram~FF_3417}]
set_false_path -to [get_registers {*fpga_interfaces|f2sdram~FF_3418}]
set_false_path -to [get_registers {*fpga_interfaces|f2sdram~FF_3419}]
set_false_path -to [get_registers {*fpga_interfaces|f2sdram~FF_798}]
set_false_path -to [get_registers {*fpga_interfaces|f2sdram~FF_799}]
set_false_path -to [get_registers {*fpga_interfaces|f2sdram~FF_800}]
set_false_path -to [get_registers {*fpga_interfaces|f2sdram~FF_801}]
set_false_path -to [get_registers {*fpga_interfaces|f2sdram~FF_862}]
set_false_path -to [get_registers {*fpga_interfaces|f2sdram~FF_863}]
set_false_path -to [get_registers {*fpga_interfaces|f2sdram~FF_864}]
set_false_path -to [get_registers {*fpga_interfaces|f2sdram~FF_865}]
set_false_path -to [get_registers {*fpga_interfaces|f2sdram~FF_926}]
set_false_path -to [get_registers {*fpga_interfaces|f2sdram~FF_927}]
set_false_path -to [get_registers {*fpga_interfaces|f2sdram~FF_928}]
set_false_path -to [get_registers {*fpga_interfaces|f2sdram~FF_929}]
set_false_path -to [get_registers {*fpga_interfaces|f2sdram~FF_990}]
set_false_path -to [get_registers {*fpga_interfaces|f2sdram~FF_991}]
set_false_path -to [get_registers {*fpga_interfaces|f2sdram~FF_992}]
set_false_path -to [get_registers {*fpga_interfaces|f2sdram~FF_993}]


#**************************************************************
# Set Multicycle Path
#**************************************************************

set_multicycle_path -setup -end -from  [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]  -to  [get_clocks *] 2
set_multicycle_path -hold -end -from  [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]  -to  [get_clocks *] 2
set_multicycle_path -setup -end -from  [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]  -to  [get_clocks *] 2
set_multicycle_path -hold -end -from  [get_clocks {u0|hps_0|hps_io|border|hps_sdram_inst|hps_sdram_p0_sampling_clock}]  -to  [get_clocks *] 2
set_multicycle_path -setup -end -to [get_registers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|*uio_pads|*uaddr_cmd_pads|*clock_gen[*].umem_ck_pad|*}] 4
set_multicycle_path -hold -end -to [get_registers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|*uio_pads|*uaddr_cmd_pads|*clock_gen[*].umem_ck_pad|*}] 4
set_multicycle_path -setup -end -from [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*lfifo~LFIFO_IN_READ_EN_FULL_DFF}] 2
set_multicycle_path -hold -end -from [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*lfifo~LFIFO_IN_READ_EN_FULL_DFF}] 1
set_multicycle_path -setup -end -from [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*altdq_dqs2_inst|*read_fifo~READ_ADDRESS_DFF}] 2
set_multicycle_path -hold -end -from [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*p0|*altdq_dqs2_inst|*read_fifo~READ_ADDRESS_DFF}] 1


#**************************************************************
# Set Maximum Delay
#**************************************************************

set_max_delay -from [get_ports {HPS_DDR3_DQ[0]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[1]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[2]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[3]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[4]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[5]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[6]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[7]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[8]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[9]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[10]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[11]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[12]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[13]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[14]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[15]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[16]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[17]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[18]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[19]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[20]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[21]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[22]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[23]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[24]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[25]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[26]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[27]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[28]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[29]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[30]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {HPS_DDR3_DQ[31]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000


#**************************************************************
# Set Minimum Delay
#**************************************************************

set_min_delay -from [get_ports {HPS_DDR3_DQ[0]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[1]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[2]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[3]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[4]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[5]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[6]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[7]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[8]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[9]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[10]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[11]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[12]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[13]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[14]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[15]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[16]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[17]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[18]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[19]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[20]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[21]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[22]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[23]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[24]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[25]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[26]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[27]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[28]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[29]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[30]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250
set_min_delay -from [get_ports {HPS_DDR3_DQ[31]}] -to [get_keepers {{*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:u0|*:hps_0|*:hps_io|*:border|*:hps_sdram_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.250


#**************************************************************
# Set Input Transition
#**************************************************************

