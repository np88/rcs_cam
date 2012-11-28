#  Simulation Model Generator
#  Xilinx EDK 13.4 EDK_O.87xd
#  Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
#
#  File     xps_epc_0_wave.tcl (Tue Nov 27 16:45:12 2012)
#
#  Module   xps_epc_0_wrapper
#  Instance xps_epc_0
if { [info exists PathSeparator] } { set ps $PathSeparator } else { set ps "/" }
if { ![info exists tbpath] } { set tbpath "${ps}MB_tb${ps}dut" }

# wave add $tbpath${ps}xps_epc_0${ps}SPLB_Clk -into $id
# wave add $tbpath${ps}xps_epc_0${ps}SPLB_Rst -into $id
# wave add $tbpath${ps}xps_epc_0${ps}PLB_ABus -into $id
# wave add $tbpath${ps}xps_epc_0${ps}PLB_PAValid -into $id
# wave add $tbpath${ps}xps_epc_0${ps}PLB_masterID -into $id
# wave add $tbpath${ps}xps_epc_0${ps}PLB_RNW -into $id
# wave add $tbpath${ps}xps_epc_0${ps}PLB_BE -into $id
# wave add $tbpath${ps}xps_epc_0${ps}PLB_size -into $id
# wave add $tbpath${ps}xps_epc_0${ps}PLB_type -into $id
# wave add $tbpath${ps}xps_epc_0${ps}PLB_wrDBus -into $id
  wave add $tbpath${ps}xps_epc_0${ps}Sl_addrAck -into $id
  wave add $tbpath${ps}xps_epc_0${ps}Sl_SSize -into $id
  wave add $tbpath${ps}xps_epc_0${ps}Sl_wait -into $id
  wave add $tbpath${ps}xps_epc_0${ps}Sl_rearbitrate -into $id
  wave add $tbpath${ps}xps_epc_0${ps}Sl_wrDAck -into $id
  wave add $tbpath${ps}xps_epc_0${ps}Sl_wrComp -into $id
  wave add $tbpath${ps}xps_epc_0${ps}Sl_rdDBus -into $id
  wave add $tbpath${ps}xps_epc_0${ps}Sl_rdDAck -into $id
  wave add $tbpath${ps}xps_epc_0${ps}Sl_rdComp -into $id
  wave add $tbpath${ps}xps_epc_0${ps}Sl_MBusy -into $id
  wave add $tbpath${ps}xps_epc_0${ps}Sl_MWrErr -into $id
  wave add $tbpath${ps}xps_epc_0${ps}Sl_MRdErr -into $id
# wave add $tbpath${ps}xps_epc_0${ps}PLB_UABus -into $id
# wave add $tbpath${ps}xps_epc_0${ps}PLB_SAValid -into $id
# wave add $tbpath${ps}xps_epc_0${ps}PLB_rdPrim -into $id
# wave add $tbpath${ps}xps_epc_0${ps}PLB_wrPrim -into $id
# wave add $tbpath${ps}xps_epc_0${ps}PLB_abort -into $id
# wave add $tbpath${ps}xps_epc_0${ps}PLB_busLock -into $id
# wave add $tbpath${ps}xps_epc_0${ps}PLB_MSize -into $id
# wave add $tbpath${ps}xps_epc_0${ps}PLB_lockErr -into $id
# wave add $tbpath${ps}xps_epc_0${ps}PLB_wrBurst -into $id
# wave add $tbpath${ps}xps_epc_0${ps}PLB_rdBurst -into $id
# wave add $tbpath${ps}xps_epc_0${ps}PLB_wrPendReq -into $id
# wave add $tbpath${ps}xps_epc_0${ps}PLB_rdPendReq -into $id
# wave add $tbpath${ps}xps_epc_0${ps}PLB_wrPendPri -into $id
# wave add $tbpath${ps}xps_epc_0${ps}PLB_rdPendPri -into $id
# wave add $tbpath${ps}xps_epc_0${ps}PLB_reqPri -into $id
# wave add $tbpath${ps}xps_epc_0${ps}PLB_TAttribute -into $id
  wave add $tbpath${ps}xps_epc_0${ps}Sl_wrBTerm -into $id
  wave add $tbpath${ps}xps_epc_0${ps}Sl_rdWdAddr -into $id
  wave add $tbpath${ps}xps_epc_0${ps}Sl_rdBTerm -into $id
  wave add $tbpath${ps}xps_epc_0${ps}Sl_MIRQ -into $id
  wave add $tbpath${ps}xps_epc_0${ps}PRH_Clk -into $id
  wave add $tbpath${ps}xps_epc_0${ps}PRH_Rst -into $id
  wave add $tbpath${ps}xps_epc_0${ps}PRH_CS_n -into $id
# wave add $tbpath${ps}xps_epc_0${ps}PRH_Addr -into $id
# wave add $tbpath${ps}xps_epc_0${ps}PRH_ADS -into $id
# wave add $tbpath${ps}xps_epc_0${ps}PRH_BE -into $id
# wave add $tbpath${ps}xps_epc_0${ps}PRH_RNW -into $id
# wave add $tbpath${ps}xps_epc_0${ps}PRH_Rd_n -into $id
# wave add $tbpath${ps}xps_epc_0${ps}PRH_Wr_n -into $id
# wave add $tbpath${ps}xps_epc_0${ps}PRH_Burst -into $id
  wave add $tbpath${ps}xps_epc_0${ps}PRH_Rdy -into $id
  wave add $tbpath${ps}xps_epc_0${ps}PRH_Data_I -into $id
# wave add $tbpath${ps}xps_epc_0${ps}PRH_Data_O -into $id
# wave add $tbpath${ps}xps_epc_0${ps}PRH_Data_T -into $id

