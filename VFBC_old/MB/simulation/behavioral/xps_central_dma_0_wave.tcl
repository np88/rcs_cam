#  Simulation Model Generator
#  Xilinx EDK 13.4 EDK_O.87xd
#  Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
#
#  File     xps_central_dma_0_wave.tcl (Mon Nov 26 15:21:16 2012)
#
#  Module   xps_central_dma_0_wrapper
#  Instance xps_central_dma_0
if { [info exists PathSeparator] } { set ps $PathSeparator } else { set ps "/" }
if { ![info exists tbpath] } { set tbpath "${ps}MB_tb${ps}dut" }

# wave add $tbpath${ps}xps_central_dma_0${ps}SPLB_Clk -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}SPLB_Rst -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}MPLB_Clk -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}MPLB_Rst -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}SPLB_ABus -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}SPLB_BE -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}SPLB_UABus -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}SPLB_PAValid -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}SPLB_SAValid -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}SPLB_rdPrim -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}SPLB_wrPrim -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}SPLB_masterID -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}SPLB_abort -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}SPLB_busLock -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}SPLB_RNW -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}SPLB_MSize -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}SPLB_size -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}SPLB_type -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}SPLB_lockErr -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}SPLB_wrDBus -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}SPLB_wrBurst -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}SPLB_rdBurst -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}SPLB_wrPendReq -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}SPLB_rdPendReq -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}SPLB_wrPendPri -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}SPLB_rdPendPri -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}SPLB_reqPri -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}SPLB_TAttribute -into $id
  wave add $tbpath${ps}xps_central_dma_0${ps}Sl_addrAck -into $id
  wave add $tbpath${ps}xps_central_dma_0${ps}Sl_SSize -into $id
  wave add $tbpath${ps}xps_central_dma_0${ps}Sl_wait -into $id
  wave add $tbpath${ps}xps_central_dma_0${ps}Sl_rearbitrate -into $id
  wave add $tbpath${ps}xps_central_dma_0${ps}Sl_wrDAck -into $id
  wave add $tbpath${ps}xps_central_dma_0${ps}Sl_wrComp -into $id
  wave add $tbpath${ps}xps_central_dma_0${ps}Sl_wrBTerm -into $id
  wave add $tbpath${ps}xps_central_dma_0${ps}Sl_rdDBus -into $id
  wave add $tbpath${ps}xps_central_dma_0${ps}Sl_rdWdAddr -into $id
  wave add $tbpath${ps}xps_central_dma_0${ps}Sl_rdDAck -into $id
  wave add $tbpath${ps}xps_central_dma_0${ps}Sl_rdComp -into $id
  wave add $tbpath${ps}xps_central_dma_0${ps}Sl_rdBTerm -into $id
  wave add $tbpath${ps}xps_central_dma_0${ps}Sl_MBusy -into $id
  wave add $tbpath${ps}xps_central_dma_0${ps}Sl_MWrErr -into $id
  wave add $tbpath${ps}xps_central_dma_0${ps}Sl_MRdErr -into $id
  wave add $tbpath${ps}xps_central_dma_0${ps}Sl_MIRQ -into $id
  wave add $tbpath${ps}xps_central_dma_0${ps}IP2INTC_Irpt -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}MPLB_MAddrAck -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}MPLB_MSSize -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}MPLB_MRearbitrate -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}MPLB_MTimeout -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}MPLB_MBusy -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}MPLB_MRdErr -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}MPLB_MWrErr -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}MPLB_MIRQ -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}MPLB_MRdDBus -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}MPLB_MRdWdAddr -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}MPLB_MRdDAck -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}MPLB_MRdBTerm -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}MPLB_MWrDAck -into $id
# wave add $tbpath${ps}xps_central_dma_0${ps}MPLB_MWrBTerm -into $id
  wave add $tbpath${ps}xps_central_dma_0${ps}M_request -into $id
  wave add $tbpath${ps}xps_central_dma_0${ps}M_priority -into $id
  wave add $tbpath${ps}xps_central_dma_0${ps}M_busLock -into $id
  wave add $tbpath${ps}xps_central_dma_0${ps}M_RNW -into $id
  wave add $tbpath${ps}xps_central_dma_0${ps}M_BE -into $id
  wave add $tbpath${ps}xps_central_dma_0${ps}M_MSize -into $id
  wave add $tbpath${ps}xps_central_dma_0${ps}M_size -into $id
  wave add $tbpath${ps}xps_central_dma_0${ps}M_type -into $id
  wave add $tbpath${ps}xps_central_dma_0${ps}M_TAttribute -into $id
  wave add $tbpath${ps}xps_central_dma_0${ps}M_lockErr -into $id
  wave add $tbpath${ps}xps_central_dma_0${ps}M_abort -into $id
  wave add $tbpath${ps}xps_central_dma_0${ps}M_UABus -into $id
  wave add $tbpath${ps}xps_central_dma_0${ps}M_ABus -into $id
  wave add $tbpath${ps}xps_central_dma_0${ps}M_wrDBus -into $id
  wave add $tbpath${ps}xps_central_dma_0${ps}M_wrBurst -into $id
  wave add $tbpath${ps}xps_central_dma_0${ps}M_rdBurst -into $id

