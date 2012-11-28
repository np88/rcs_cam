#  Simulation Model Generator
#  Xilinx EDK 13.4 EDK_O.87xd
#  Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
#
#  File     xps_tft_0_wave.tcl (Tue Nov 27 16:45:12 2012)
#
#  Module   xps_tft_0_wrapper
#  Instance xps_tft_0
if { [info exists PathSeparator] } { set ps $PathSeparator } else { set ps "/" }
if { ![info exists tbpath] } { set tbpath "${ps}MB_tb${ps}dut" }

# wave add $tbpath${ps}xps_tft_0${ps}SPLB_Clk -into $id
# wave add $tbpath${ps}xps_tft_0${ps}SPLB_Rst -into $id
# wave add $tbpath${ps}xps_tft_0${ps}MPLB_Clk -into $id
# wave add $tbpath${ps}xps_tft_0${ps}MPLB_Rst -into $id
# wave add $tbpath${ps}xps_tft_0${ps}MD_error -into $id
# wave add $tbpath${ps}xps_tft_0${ps}IP2INTC_Irpt -into $id
  wave add $tbpath${ps}xps_tft_0${ps}M_request -into $id
  wave add $tbpath${ps}xps_tft_0${ps}M_priority -into $id
  wave add $tbpath${ps}xps_tft_0${ps}M_busLock -into $id
  wave add $tbpath${ps}xps_tft_0${ps}M_RNW -into $id
  wave add $tbpath${ps}xps_tft_0${ps}M_BE -into $id
  wave add $tbpath${ps}xps_tft_0${ps}M_MSize -into $id
  wave add $tbpath${ps}xps_tft_0${ps}M_size -into $id
  wave add $tbpath${ps}xps_tft_0${ps}M_type -into $id
  wave add $tbpath${ps}xps_tft_0${ps}M_ABus -into $id
  wave add $tbpath${ps}xps_tft_0${ps}M_wrBurst -into $id
  wave add $tbpath${ps}xps_tft_0${ps}M_rdBurst -into $id
  wave add $tbpath${ps}xps_tft_0${ps}M_wrDBus -into $id
# wave add $tbpath${ps}xps_tft_0${ps}PLB_MSSize -into $id
# wave add $tbpath${ps}xps_tft_0${ps}PLB_MAddrAck -into $id
# wave add $tbpath${ps}xps_tft_0${ps}PLB_MRearbitrate -into $id
# wave add $tbpath${ps}xps_tft_0${ps}PLB_MTimeout -into $id
# wave add $tbpath${ps}xps_tft_0${ps}PLB_MRdErr -into $id
# wave add $tbpath${ps}xps_tft_0${ps}PLB_MWrErr -into $id
# wave add $tbpath${ps}xps_tft_0${ps}PLB_MRdDBus -into $id
# wave add $tbpath${ps}xps_tft_0${ps}PLB_MRdDAck -into $id
# wave add $tbpath${ps}xps_tft_0${ps}PLB_MWrDAck -into $id
# wave add $tbpath${ps}xps_tft_0${ps}PLB_MRdBTerm -into $id
# wave add $tbpath${ps}xps_tft_0${ps}PLB_MWrBTerm -into $id
  wave add $tbpath${ps}xps_tft_0${ps}M_TAttribute -into $id
  wave add $tbpath${ps}xps_tft_0${ps}M_lockErr -into $id
  wave add $tbpath${ps}xps_tft_0${ps}M_abort -into $id
  wave add $tbpath${ps}xps_tft_0${ps}M_UABus -into $id
# wave add $tbpath${ps}xps_tft_0${ps}PLB_MBusy -into $id
# wave add $tbpath${ps}xps_tft_0${ps}PLB_MIRQ -into $id
# wave add $tbpath${ps}xps_tft_0${ps}PLB_MRdWdAddr -into $id
# wave add $tbpath${ps}xps_tft_0${ps}PLB_ABus -into $id
# wave add $tbpath${ps}xps_tft_0${ps}PLB_PAValid -into $id
# wave add $tbpath${ps}xps_tft_0${ps}PLB_masterID -into $id
# wave add $tbpath${ps}xps_tft_0${ps}PLB_RNW -into $id
# wave add $tbpath${ps}xps_tft_0${ps}PLB_BE -into $id
# wave add $tbpath${ps}xps_tft_0${ps}PLB_size -into $id
# wave add $tbpath${ps}xps_tft_0${ps}PLB_type -into $id
# wave add $tbpath${ps}xps_tft_0${ps}PLB_wrDBus -into $id
  wave add $tbpath${ps}xps_tft_0${ps}Sl_addrAck -into $id
  wave add $tbpath${ps}xps_tft_0${ps}Sl_SSize -into $id
  wave add $tbpath${ps}xps_tft_0${ps}Sl_wait -into $id
  wave add $tbpath${ps}xps_tft_0${ps}Sl_rearbitrate -into $id
  wave add $tbpath${ps}xps_tft_0${ps}Sl_wrDAck -into $id
  wave add $tbpath${ps}xps_tft_0${ps}Sl_wrComp -into $id
  wave add $tbpath${ps}xps_tft_0${ps}Sl_rdDBus -into $id
  wave add $tbpath${ps}xps_tft_0${ps}Sl_rdDAck -into $id
  wave add $tbpath${ps}xps_tft_0${ps}Sl_rdComp -into $id
  wave add $tbpath${ps}xps_tft_0${ps}Sl_MBusy -into $id
  wave add $tbpath${ps}xps_tft_0${ps}Sl_MWrErr -into $id
  wave add $tbpath${ps}xps_tft_0${ps}Sl_MRdErr -into $id
# wave add $tbpath${ps}xps_tft_0${ps}PLB_UABus -into $id
# wave add $tbpath${ps}xps_tft_0${ps}PLB_SAValid -into $id
# wave add $tbpath${ps}xps_tft_0${ps}PLB_rdPrim -into $id
# wave add $tbpath${ps}xps_tft_0${ps}PLB_wrPrim -into $id
# wave add $tbpath${ps}xps_tft_0${ps}PLB_abort -into $id
# wave add $tbpath${ps}xps_tft_0${ps}PLB_busLock -into $id
# wave add $tbpath${ps}xps_tft_0${ps}PLB_MSize -into $id
# wave add $tbpath${ps}xps_tft_0${ps}PLB_lockErr -into $id
# wave add $tbpath${ps}xps_tft_0${ps}PLB_wrBurst -into $id
# wave add $tbpath${ps}xps_tft_0${ps}PLB_rdBurst -into $id
# wave add $tbpath${ps}xps_tft_0${ps}PLB_wrPendReq -into $id
# wave add $tbpath${ps}xps_tft_0${ps}PLB_rdPendReq -into $id
# wave add $tbpath${ps}xps_tft_0${ps}PLB_wrPendPri -into $id
# wave add $tbpath${ps}xps_tft_0${ps}PLB_rdPendPri -into $id
# wave add $tbpath${ps}xps_tft_0${ps}PLB_reqPri -into $id
# wave add $tbpath${ps}xps_tft_0${ps}PLB_TAttribute -into $id
  wave add $tbpath${ps}xps_tft_0${ps}Sl_wrBTerm -into $id
  wave add $tbpath${ps}xps_tft_0${ps}Sl_rdWdAddr -into $id
  wave add $tbpath${ps}xps_tft_0${ps}Sl_rdBTerm -into $id
  wave add $tbpath${ps}xps_tft_0${ps}Sl_MIRQ -into $id
  wave add $tbpath${ps}xps_tft_0${ps}DCR_Clk -into $id
  wave add $tbpath${ps}xps_tft_0${ps}DCR_Rst -into $id
# wave add $tbpath${ps}xps_tft_0${ps}DCR_Read -into $id
# wave add $tbpath${ps}xps_tft_0${ps}DCR_Write -into $id
# wave add $tbpath${ps}xps_tft_0${ps}DCR_ABus -into $id
# wave add $tbpath${ps}xps_tft_0${ps}DCR_Sl_DBus -into $id
# wave add $tbpath${ps}xps_tft_0${ps}Sl_DCRDBus -into $id
# wave add $tbpath${ps}xps_tft_0${ps}Sl_DCRAck -into $id
  wave add $tbpath${ps}xps_tft_0${ps}SYS_TFT_Clk -into $id
  wave add $tbpath${ps}xps_tft_0${ps}TFT_HSYNC -into $id
  wave add $tbpath${ps}xps_tft_0${ps}TFT_VSYNC -into $id
  wave add $tbpath${ps}xps_tft_0${ps}TFT_DE -into $id
  wave add $tbpath${ps}xps_tft_0${ps}TFT_DPS -into $id
  wave add $tbpath${ps}xps_tft_0${ps}TFT_VGA_CLK -into $id
# wave add $tbpath${ps}xps_tft_0${ps}TFT_VGA_R -into $id
# wave add $tbpath${ps}xps_tft_0${ps}TFT_VGA_G -into $id
# wave add $tbpath${ps}xps_tft_0${ps}TFT_VGA_B -into $id
  wave add $tbpath${ps}xps_tft_0${ps}TFT_DVI_CLK_P -into $id
  wave add $tbpath${ps}xps_tft_0${ps}TFT_DVI_CLK_N -into $id
  wave add $tbpath${ps}xps_tft_0${ps}TFT_DVI_DATA -into $id
  wave add $tbpath${ps}xps_tft_0${ps}TFT_IIC_SCL_I -into $id
  wave add $tbpath${ps}xps_tft_0${ps}TFT_IIC_SCL_O -into $id
  wave add $tbpath${ps}xps_tft_0${ps}TFT_IIC_SCL_T -into $id
  wave add $tbpath${ps}xps_tft_0${ps}TFT_IIC_SDA_I -into $id
  wave add $tbpath${ps}xps_tft_0${ps}TFT_IIC_SDA_O -into $id
  wave add $tbpath${ps}xps_tft_0${ps}TFT_IIC_SDA_T -into $id

