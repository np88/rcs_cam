#  Simulation Model Generator
#  Xilinx EDK 13.4 EDK_O.87xd
#  Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
#
#  File     MB_setup.tcl (Mon Nov 19 13:50:00 2012)
#
#  ISE Simulator Setup Script File
#
#  The Simulation Setup script file defines macros and
#  commands to automate the setup of signal tracing for
#  for waveform viewing, as well as helper functions.
#
#  To use this script, run the ISE Simulator exectuable
#  with the '-tclbatch MB_setup.tcl' option.
#  The script does not exit. Type 'h' at the simulator prompt
#  to print a list of commands.
#
#  Comment or uncomment commands in wave trace TCL files
#  to change the set of signals saved.
#
# =====================================================

# =====================================================
# Set up signal tracing
# =====================================================

# Edit _wave.tcl files to modify signal tracing

proc w {} {
  global  tbpath
  global  PathSeparator
  puts  "Setting up signal tracing ..."
  source MB_wave.tcl
}
proc w_top {} {
  global  tbpath
  global  PathSeparator
  puts  "Setting up signal tracing ..."
  set id [group add "Top level ports"]
  source top_level_ports_wave.tcl
}
proc w_instance {{design_instance_name }} {
  global  tbpath
  global  PathSeparator
  puts  "Setting up signal tracing ..."
  wave add $design_instance_name
}
# =====================================================
# Set up help menu
# =====================================================

proc PrintHelpInformation {} {
  puts "**********************************************************************"
  puts "**********************************************************************"
  puts "***"
  puts "***   Simulation Setup Macros (MB_setup.tcl)"
  puts "***"
  puts "***   w   =>  set up signal tracing for the ISE Simulator waveform"
  puts "***           viewer (edit signal lists in MB_wave.tcl)"
  puts "***"
  puts "***   w_top =>  Observe top level signals in the ISim Waveform Viewer"
  puts "***"
  puts "***   w_instance <<instance name>>  =>  Observe signals of the given instance in the ISim waveform viewer"
  puts "***           (Example: w /system/dlm_cntrl to observe signals of dlmb controller)."
  puts "***"
  puts "***   h   =>  print this help menu"
  puts "***"
  puts "***   Default flow is: reset; w_top; run 1000ns or reset; w; run 1000ns"
  puts "***"
  puts "**********************************************************************"
  puts "**********************************************************************"
}
proc h {} { PrintHelpInformation }

puts  "Setting up simulation commands ..."

PrintHelpInformation
