#!/bin/sh
#  Simulation Model Generator
#  Xilinx EDK 13.4 EDK_O.87xd
#  Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
#
#  File     MB_fuse.sh (Tue Nov 27 16:45:12 2012)
#
#  ISE Simulator Fuse Script File
#
#  The Fuse script compiles and generates an ISE simulator
#  executable named isim_MB that is used to run your
#  simulation. To run a simulation in command line mode,
#  perform the following steps:
#
#  1. Run the ISE Simulator Fuse script file
#     source MB_fuse.sh
#  2. Use a text editor to modify the signal wave files,
#     which have the file name <module>_wave.tcl
#  3. Launch the simulator using the following command:
#     isim_MB -gui -tclbatch MB_setup.tcl
#
fuse -incremental work.MB_tb work.glbl  -prj MB.prj -L xilinxcorelib_ver -L secureip -L unisims_ver  -o isim_MB
