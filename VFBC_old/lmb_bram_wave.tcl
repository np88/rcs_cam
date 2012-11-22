#  Simulation Model Generator
#  Xilinx EDK 13.4 EDK_O.87xd
#  Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
#
#  File     lmb_bram_wave.tcl (Mon Nov 19 13:50:00 2012)
#
#  Module   lmb_bram_wrapper
#  Instance lmb_bram
if { [info exists PathSeparator] } { set ps $PathSeparator } else { set ps "/" }
if { ![info exists tbpath] } { set tbpath "${ps}MB_tb${ps}dut" }

# wave add $tbpath${ps}lmb_bram${ps}BRAM_Rst_A -into $id
# wave add $tbpath${ps}lmb_bram${ps}BRAM_Clk_A -into $id
# wave add $tbpath${ps}lmb_bram${ps}BRAM_EN_A -into $id
# wave add $tbpath${ps}lmb_bram${ps}BRAM_WEN_A -into $id
# wave add $tbpath${ps}lmb_bram${ps}BRAM_Addr_A -into $id
  wave add $tbpath${ps}lmb_bram${ps}BRAM_Din_A -into $id
# wave add $tbpath${ps}lmb_bram${ps}BRAM_Dout_A -into $id
# wave add $tbpath${ps}lmb_bram${ps}BRAM_Rst_B -into $id
# wave add $tbpath${ps}lmb_bram${ps}BRAM_Clk_B -into $id
# wave add $tbpath${ps}lmb_bram${ps}BRAM_EN_B -into $id
# wave add $tbpath${ps}lmb_bram${ps}BRAM_WEN_B -into $id
# wave add $tbpath${ps}lmb_bram${ps}BRAM_Addr_B -into $id
  wave add $tbpath${ps}lmb_bram${ps}BRAM_Din_B -into $id
# wave add $tbpath${ps}lmb_bram${ps}BRAM_Dout_B -into $id
