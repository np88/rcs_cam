#  Simulation Model Generator
#  Xilinx EDK 13.4 EDK_O.87xd
#  Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
#
#  File     xps_intc_0_wave.tcl (Mon Nov 26 15:21:16 2012)
#
#  Module   xps_intc_0_wrapper
#  Instance xps_intc_0
if { [info exists PathSeparator] } { set ps $PathSeparator } else { set ps "/" }
if { ![info exists tbpath] } { set tbpath "${ps}MB_tb${ps}dut" }

# wave add $tbpath${ps}xps_intc_0${ps}SPLB_Clk -into $id
# wave add $tbpath${ps}xps_intc_0${ps}SPLB_Rst -into $id
# wave add $tbpath${ps}xps_intc_0${ps}PLB_ABus -into $id
# wave add $tbpath${ps}xps_intc_0${ps}PLB_PAValid -into $id
# wave add $tbpath${ps}xps_intc_0${ps}PLB_masterID -into $id
# wave add $tbpath${ps}xps_intc_0${ps}PLB_RNW -into $id
# wave add $tbpath${ps}xps_intc_0${ps}PLB_BE -into $id
# wave add $tbpath${ps}xps_intc_0${ps}PLB_size -into $id
# wave add $tbpath${ps}xps_intc_0${ps}PLB_type -into $id
# wave add $tbpath${ps}xps_intc_0${ps}PLB_wrDBus -into $id
# wave add $tbpath${ps}xps_intc_0${ps}PLB_UABus -into $id
# wave add $tbpath${ps}xps_intc_0${ps}PLB_SAValid -into $id
# wave add $tbpath${ps}xps_intc_0${ps}PLB_rdPrim -into $id
# wave add $tbpath${ps}xps_intc_0${ps}PLB_wrPrim -into $id
# wave add $tbpath${ps}xps_intc_0${ps}PLB_abort -into $id
# wave add $tbpath${ps}xps_intc_0${ps}PLB_busLock -into $id
# wave add $tbpath${ps}xps_intc_0${ps}PLB_MSize -into $id
# wave add $tbpath${ps}xps_intc_0${ps}PLB_lockErr -into $id
# wave add $tbpath${ps}xps_intc_0${ps}PLB_wrBurst -into $id
# wave add $tbpath${ps}xps_intc_0${ps}PLB_rdBurst -into $id
# wave add $tbpath${ps}xps_intc_0${ps}PLB_wrPendReq -into $id
# wave add $tbpath${ps}xps_intc_0${ps}PLB_rdPendReq -into $id
# wave add $tbpath${ps}xps_intc_0${ps}PLB_wrPendPri -into $id
# wave add $tbpath${ps}xps_intc_0${ps}PLB_rdPendPri -into $id
# wave add $tbpath${ps}xps_intc_0${ps}PLB_reqPri -into $id
# wave add $tbpath${ps}xps_intc_0${ps}PLB_TAttribute -into $id
  wave add $tbpath${ps}xps_intc_0${ps}Sl_addrAck -into $id
  wave add $tbpath${ps}xps_intc_0${ps}Sl_SSize -into $id
  wave add $tbpath${ps}xps_intc_0${ps}Sl_wait -into $id
  wave add $tbpath${ps}xps_intc_0${ps}Sl_rearbitrate -into $id
  wave add $tbpath${ps}xps_intc_0${ps}Sl_wrDAck -into $id
  wave add $tbpath${ps}xps_intc_0${ps}Sl_wrComp -into $id
  wave add $tbpath${ps}xps_intc_0${ps}Sl_rdDBus -into $id
  wave add $tbpath${ps}xps_intc_0${ps}Sl_rdDAck -into $id
  wave add $tbpath${ps}xps_intc_0${ps}Sl_rdComp -into $id
  wave add $tbpath${ps}xps_intc_0${ps}Sl_MBusy -into $id
  wave add $tbpath${ps}xps_intc_0${ps}Sl_MWrErr -into $id
  wave add $tbpath${ps}xps_intc_0${ps}Sl_MRdErr -into $id
  wave add $tbpath${ps}xps_intc_0${ps}Sl_wrBTerm -into $id
  wave add $tbpath${ps}xps_intc_0${ps}Sl_rdWdAddr -into $id
  wave add $tbpath${ps}xps_intc_0${ps}Sl_rdBTerm -into $id
  wave add $tbpath${ps}xps_intc_0${ps}Sl_MIRQ -into $id
  wave add $tbpath${ps}xps_intc_0${ps}Intr -into $id
  wave add $tbpath${ps}xps_intc_0${ps}Irq -into $id

