#  Simulation Model Generator
#  Xilinx EDK 13.4 EDK_O.87xd
#  Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
#
#  File     mdm_0_wave.tcl (Mon Nov 26 15:21:16 2012)
#
#  Module   mdm_0_wrapper
#  Instance mdm_0
if { [info exists PathSeparator] } { set ps $PathSeparator } else { set ps "/" }
if { ![info exists tbpath] } { set tbpath "${ps}MB_tb${ps}dut" }

# wave add $tbpath${ps}mdm_0${ps}Interrupt -into $id
  wave add $tbpath${ps}mdm_0${ps}Debug_SYS_Rst -into $id
  wave add $tbpath${ps}mdm_0${ps}Ext_BRK -into $id
  wave add $tbpath${ps}mdm_0${ps}Ext_NM_BRK -into $id
# wave add $tbpath${ps}mdm_0${ps}S_AXI_ACLK -into $id
# wave add $tbpath${ps}mdm_0${ps}S_AXI_ARESETN -into $id
# wave add $tbpath${ps}mdm_0${ps}S_AXI_AWADDR -into $id
# wave add $tbpath${ps}mdm_0${ps}S_AXI_AWVALID -into $id
# wave add $tbpath${ps}mdm_0${ps}S_AXI_AWREADY -into $id
# wave add $tbpath${ps}mdm_0${ps}S_AXI_WDATA -into $id
# wave add $tbpath${ps}mdm_0${ps}S_AXI_WSTRB -into $id
# wave add $tbpath${ps}mdm_0${ps}S_AXI_WVALID -into $id
# wave add $tbpath${ps}mdm_0${ps}S_AXI_WREADY -into $id
# wave add $tbpath${ps}mdm_0${ps}S_AXI_BRESP -into $id
# wave add $tbpath${ps}mdm_0${ps}S_AXI_BVALID -into $id
# wave add $tbpath${ps}mdm_0${ps}S_AXI_BREADY -into $id
# wave add $tbpath${ps}mdm_0${ps}S_AXI_ARADDR -into $id
# wave add $tbpath${ps}mdm_0${ps}S_AXI_ARVALID -into $id
# wave add $tbpath${ps}mdm_0${ps}S_AXI_ARREADY -into $id
# wave add $tbpath${ps}mdm_0${ps}S_AXI_RDATA -into $id
# wave add $tbpath${ps}mdm_0${ps}S_AXI_RRESP -into $id
# wave add $tbpath${ps}mdm_0${ps}S_AXI_RVALID -into $id
# wave add $tbpath${ps}mdm_0${ps}S_AXI_RREADY -into $id
# wave add $tbpath${ps}mdm_0${ps}SPLB_Clk -into $id
# wave add $tbpath${ps}mdm_0${ps}SPLB_Rst -into $id
# wave add $tbpath${ps}mdm_0${ps}PLB_ABus -into $id
# wave add $tbpath${ps}mdm_0${ps}PLB_UABus -into $id
# wave add $tbpath${ps}mdm_0${ps}PLB_PAValid -into $id
# wave add $tbpath${ps}mdm_0${ps}PLB_SAValid -into $id
# wave add $tbpath${ps}mdm_0${ps}PLB_rdPrim -into $id
# wave add $tbpath${ps}mdm_0${ps}PLB_wrPrim -into $id
# wave add $tbpath${ps}mdm_0${ps}PLB_masterID -into $id
# wave add $tbpath${ps}mdm_0${ps}PLB_abort -into $id
# wave add $tbpath${ps}mdm_0${ps}PLB_busLock -into $id
# wave add $tbpath${ps}mdm_0${ps}PLB_RNW -into $id
# wave add $tbpath${ps}mdm_0${ps}PLB_BE -into $id
# wave add $tbpath${ps}mdm_0${ps}PLB_MSize -into $id
# wave add $tbpath${ps}mdm_0${ps}PLB_size -into $id
# wave add $tbpath${ps}mdm_0${ps}PLB_type -into $id
# wave add $tbpath${ps}mdm_0${ps}PLB_lockErr -into $id
# wave add $tbpath${ps}mdm_0${ps}PLB_wrDBus -into $id
# wave add $tbpath${ps}mdm_0${ps}PLB_wrBurst -into $id
# wave add $tbpath${ps}mdm_0${ps}PLB_rdBurst -into $id
# wave add $tbpath${ps}mdm_0${ps}PLB_wrPendReq -into $id
# wave add $tbpath${ps}mdm_0${ps}PLB_rdPendReq -into $id
# wave add $tbpath${ps}mdm_0${ps}PLB_wrPendPri -into $id
# wave add $tbpath${ps}mdm_0${ps}PLB_rdPendPri -into $id
# wave add $tbpath${ps}mdm_0${ps}PLB_reqPri -into $id
# wave add $tbpath${ps}mdm_0${ps}PLB_TAttribute -into $id
  wave add $tbpath${ps}mdm_0${ps}Sl_addrAck -into $id
  wave add $tbpath${ps}mdm_0${ps}Sl_SSize -into $id
  wave add $tbpath${ps}mdm_0${ps}Sl_wait -into $id
  wave add $tbpath${ps}mdm_0${ps}Sl_rearbitrate -into $id
  wave add $tbpath${ps}mdm_0${ps}Sl_wrDAck -into $id
  wave add $tbpath${ps}mdm_0${ps}Sl_wrComp -into $id
  wave add $tbpath${ps}mdm_0${ps}Sl_wrBTerm -into $id
  wave add $tbpath${ps}mdm_0${ps}Sl_rdDBus -into $id
  wave add $tbpath${ps}mdm_0${ps}Sl_rdWdAddr -into $id
  wave add $tbpath${ps}mdm_0${ps}Sl_rdDAck -into $id
  wave add $tbpath${ps}mdm_0${ps}Sl_rdComp -into $id
  wave add $tbpath${ps}mdm_0${ps}Sl_rdBTerm -into $id
  wave add $tbpath${ps}mdm_0${ps}Sl_MBusy -into $id
  wave add $tbpath${ps}mdm_0${ps}Sl_MWrErr -into $id
  wave add $tbpath${ps}mdm_0${ps}Sl_MRdErr -into $id
  wave add $tbpath${ps}mdm_0${ps}Sl_MIRQ -into $id
  wave add $tbpath${ps}mdm_0${ps}Dbg_Clk_0 -into $id
  wave add $tbpath${ps}mdm_0${ps}Dbg_TDI_0 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_TDO_0 -into $id
  wave add $tbpath${ps}mdm_0${ps}Dbg_Reg_En_0 -into $id
  wave add $tbpath${ps}mdm_0${ps}Dbg_Capture_0 -into $id
  wave add $tbpath${ps}mdm_0${ps}Dbg_Shift_0 -into $id
  wave add $tbpath${ps}mdm_0${ps}Dbg_Update_0 -into $id
  wave add $tbpath${ps}mdm_0${ps}Dbg_Rst_0 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Clk_1 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_TDI_1 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_TDO_1 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Reg_En_1 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Capture_1 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Shift_1 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Update_1 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Rst_1 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Clk_2 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_TDI_2 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_TDO_2 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Reg_En_2 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Capture_2 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Shift_2 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Update_2 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Rst_2 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Clk_3 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_TDI_3 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_TDO_3 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Reg_En_3 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Capture_3 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Shift_3 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Update_3 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Rst_3 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Clk_4 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_TDI_4 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_TDO_4 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Reg_En_4 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Capture_4 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Shift_4 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Update_4 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Rst_4 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Clk_5 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_TDI_5 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_TDO_5 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Reg_En_5 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Capture_5 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Shift_5 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Update_5 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Rst_5 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Clk_6 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_TDI_6 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_TDO_6 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Reg_En_6 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Capture_6 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Shift_6 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Update_6 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Rst_6 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Clk_7 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_TDI_7 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_TDO_7 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Reg_En_7 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Capture_7 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Shift_7 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Update_7 -into $id
# wave add $tbpath${ps}mdm_0${ps}Dbg_Rst_7 -into $id
# wave add $tbpath${ps}mdm_0${ps}bscan_tdi -into $id
# wave add $tbpath${ps}mdm_0${ps}bscan_reset -into $id
# wave add $tbpath${ps}mdm_0${ps}bscan_shift -into $id
# wave add $tbpath${ps}mdm_0${ps}bscan_update -into $id
# wave add $tbpath${ps}mdm_0${ps}bscan_capture -into $id
# wave add $tbpath${ps}mdm_0${ps}bscan_sel1 -into $id
# wave add $tbpath${ps}mdm_0${ps}bscan_drck1 -into $id
  wave add $tbpath${ps}mdm_0${ps}bscan_tdo1 -into $id
# wave add $tbpath${ps}mdm_0${ps}Ext_JTAG_DRCK -into $id
# wave add $tbpath${ps}mdm_0${ps}Ext_JTAG_RESET -into $id
# wave add $tbpath${ps}mdm_0${ps}Ext_JTAG_SEL -into $id
# wave add $tbpath${ps}mdm_0${ps}Ext_JTAG_CAPTURE -into $id
# wave add $tbpath${ps}mdm_0${ps}Ext_JTAG_SHIFT -into $id
# wave add $tbpath${ps}mdm_0${ps}Ext_JTAG_UPDATE -into $id
# wave add $tbpath${ps}mdm_0${ps}Ext_JTAG_TDI -into $id
# wave add $tbpath${ps}mdm_0${ps}Ext_JTAG_TDO -into $id

