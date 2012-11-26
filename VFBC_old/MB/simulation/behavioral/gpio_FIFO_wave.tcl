#  Simulation Model Generator
#  Xilinx EDK 13.4 EDK_O.87xd
#  Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
#
#  File     gpio_FIFO_wave.tcl (Mon Nov 26 15:21:16 2012)
#
#  Module   gpio_fifo_wrapper
#  Instance gpio_FIFO
if { [info exists PathSeparator] } { set ps $PathSeparator } else { set ps "/" }
if { ![info exists tbpath] } { set tbpath "${ps}MB_tb${ps}dut" }

# wave add $tbpath${ps}gpio_FIFO${ps}SPLB_Clk -into $id
# wave add $tbpath${ps}gpio_FIFO${ps}SPLB_Rst -into $id
# wave add $tbpath${ps}gpio_FIFO${ps}PLB_ABus -into $id
# wave add $tbpath${ps}gpio_FIFO${ps}PLB_UABus -into $id
# wave add $tbpath${ps}gpio_FIFO${ps}PLB_PAValid -into $id
# wave add $tbpath${ps}gpio_FIFO${ps}PLB_SAValid -into $id
# wave add $tbpath${ps}gpio_FIFO${ps}PLB_rdPrim -into $id
# wave add $tbpath${ps}gpio_FIFO${ps}PLB_wrPrim -into $id
# wave add $tbpath${ps}gpio_FIFO${ps}PLB_masterID -into $id
# wave add $tbpath${ps}gpio_FIFO${ps}PLB_abort -into $id
# wave add $tbpath${ps}gpio_FIFO${ps}PLB_busLock -into $id
# wave add $tbpath${ps}gpio_FIFO${ps}PLB_RNW -into $id
# wave add $tbpath${ps}gpio_FIFO${ps}PLB_BE -into $id
# wave add $tbpath${ps}gpio_FIFO${ps}PLB_MSize -into $id
# wave add $tbpath${ps}gpio_FIFO${ps}PLB_size -into $id
# wave add $tbpath${ps}gpio_FIFO${ps}PLB_type -into $id
# wave add $tbpath${ps}gpio_FIFO${ps}PLB_lockErr -into $id
# wave add $tbpath${ps}gpio_FIFO${ps}PLB_wrDBus -into $id
# wave add $tbpath${ps}gpio_FIFO${ps}PLB_wrBurst -into $id
# wave add $tbpath${ps}gpio_FIFO${ps}PLB_rdBurst -into $id
# wave add $tbpath${ps}gpio_FIFO${ps}PLB_wrPendReq -into $id
# wave add $tbpath${ps}gpio_FIFO${ps}PLB_rdPendReq -into $id
# wave add $tbpath${ps}gpio_FIFO${ps}PLB_wrPendPri -into $id
# wave add $tbpath${ps}gpio_FIFO${ps}PLB_rdPendPri -into $id
# wave add $tbpath${ps}gpio_FIFO${ps}PLB_reqPri -into $id
# wave add $tbpath${ps}gpio_FIFO${ps}PLB_TAttribute -into $id
  wave add $tbpath${ps}gpio_FIFO${ps}Sl_addrAck -into $id
  wave add $tbpath${ps}gpio_FIFO${ps}Sl_SSize -into $id
  wave add $tbpath${ps}gpio_FIFO${ps}Sl_wait -into $id
  wave add $tbpath${ps}gpio_FIFO${ps}Sl_rearbitrate -into $id
  wave add $tbpath${ps}gpio_FIFO${ps}Sl_wrDAck -into $id
  wave add $tbpath${ps}gpio_FIFO${ps}Sl_wrComp -into $id
  wave add $tbpath${ps}gpio_FIFO${ps}Sl_wrBTerm -into $id
  wave add $tbpath${ps}gpio_FIFO${ps}Sl_rdDBus -into $id
  wave add $tbpath${ps}gpio_FIFO${ps}Sl_rdWdAddr -into $id
  wave add $tbpath${ps}gpio_FIFO${ps}Sl_rdDAck -into $id
  wave add $tbpath${ps}gpio_FIFO${ps}Sl_rdComp -into $id
  wave add $tbpath${ps}gpio_FIFO${ps}Sl_rdBTerm -into $id
  wave add $tbpath${ps}gpio_FIFO${ps}Sl_MBusy -into $id
  wave add $tbpath${ps}gpio_FIFO${ps}Sl_MWrErr -into $id
  wave add $tbpath${ps}gpio_FIFO${ps}Sl_MRdErr -into $id
  wave add $tbpath${ps}gpio_FIFO${ps}Sl_MIRQ -into $id
  wave add $tbpath${ps}gpio_FIFO${ps}IP2INTC_Irpt -into $id
  wave add $tbpath${ps}gpio_FIFO${ps}GPIO_IO_I -into $id
# wave add $tbpath${ps}gpio_FIFO${ps}GPIO_IO_O -into $id
# wave add $tbpath${ps}gpio_FIFO${ps}GPIO_IO_T -into $id
  wave add $tbpath${ps}gpio_FIFO${ps}GPIO2_IO_I -into $id
  wave add $tbpath${ps}gpio_FIFO${ps}GPIO2_IO_O -into $id
# wave add $tbpath${ps}gpio_FIFO${ps}GPIO2_IO_T -into $id

