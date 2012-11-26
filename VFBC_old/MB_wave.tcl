#  Simulation Model Generator
#  Xilinx EDK 13.4 EDK_O.87xd
#  Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
#
#  File     MB_wave.tcl (Mon Nov 26 15:21:15 2012)
#
#  ISE Simulator Trace Script File
#
#  Trace script files specify signals to save for later
#  display when viewing results of the simulation a graphic
#  format. Comment or uncomment commands to change the set of
#  signals viewed.
#
puts  "Setting up signal tracing ..."

if { [info exists PathSeparator] } { set ps $PathSeparator } else { set ps "/" }
if { ![info exists tbpath] } { set tbpath "${ps}MB_tb${ps}dut" }

#
#  Trace top-level ports
#
set id [group add "Top level ports"]
source top_level_ports_wave.tcl


#
#  Trace Bus signal ports
#
set id [group add "Bus signal ports" ]
source mb_plb_wave.tcl

source ilmb_wave.tcl

source dlmb_wave.tcl

#
#  Trace Processor ports
#
set id [group add "Processor ports" ]
source microblaze_0_wave.tcl

#
#  Trace processor registers
#

set id [group add "Processor registers"]
#  Processor registers cannot be displayed for:
#  Module   microblaze_0_wrapper
#  Instance microblaze_0
#  Register display support will be added in a future EDK release

#
#  Trace IP and peripheral ports
#
set id [group add "IP and peripheral ports" ]
source dlmb_cntlr_wave.tcl

source ilmb_cntlr_wave.tcl

source lmb_bram_wave.tcl

source Push_Buttons_5Bit_wave.tcl

source DDR2_SDRAM_wave.tcl

source xps_timer_0_wave.tcl

source xps_bram_if_cntlr_0_wave.tcl

source xps_bram_if_cntlr_0_block_wave.tcl

source clock_generator_0_wave.tcl

source mdm_0_wave.tcl

source proc_sys_reset_0_wave.tcl

source gpio_FIFO_wave.tcl

source xps_intc_0_wave.tcl

source xps_FIFO_cam_data_wave.tcl

source xps_central_dma_0_wave.tcl

source xps_epc_0_wave.tcl

source xps_tft_0_wave.tcl

#
#  Trace setup complete. Start tracing the signals.
#

puts  "Signal tracing setup completed."

puts  "Simulate the design with the 'run' command."
