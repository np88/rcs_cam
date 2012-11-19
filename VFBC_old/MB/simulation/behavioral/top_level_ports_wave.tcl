#  Simulation Model Generator
#  Xilinx EDK 13.4 EDK_O.87xd
#  Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
#
#  File     top_level_ports_wave.tcl (Mon Nov 19 13:50:00 2012)
#
if { [info exists PathSeparator] } { set ps $PathSeparator } else { set ps "/" }
if { ![info exists tbpath] } { set tbpath "${ps}MB_tb${ps}dut" }

wave add $tbpath${ps}fpga_0_DDR2_SDRAM_DDR2_Clk_pin -into $id 
wave add $tbpath${ps}fpga_0_DDR2_SDRAM_DDR2_Clk_n_pin -into $id 
wave add $tbpath${ps}fpga_0_DDR2_SDRAM_DDR2_CE_pin -into $id 
wave add $tbpath${ps}fpga_0_DDR2_SDRAM_DDR2_CS_n_pin -into $id 
wave add $tbpath${ps}fpga_0_DDR2_SDRAM_DDR2_ODT_pin -into $id 
wave add $tbpath${ps}fpga_0_DDR2_SDRAM_DDR2_RAS_n_pin -into $id 
wave add $tbpath${ps}fpga_0_DDR2_SDRAM_DDR2_CAS_n_pin -into $id 
wave add $tbpath${ps}fpga_0_DDR2_SDRAM_DDR2_WE_n_pin -into $id 
wave add $tbpath${ps}fpga_0_DDR2_SDRAM_DDR2_BankAddr_pin -into $id 
wave add $tbpath${ps}fpga_0_DDR2_SDRAM_DDR2_Addr_pin -into $id 
wave add $tbpath${ps}fpga_0_DDR2_SDRAM_DDR2_DQ_pin -into $id 
wave add $tbpath${ps}fpga_0_DDR2_SDRAM_DDR2_DM_pin -into $id 
wave add $tbpath${ps}fpga_0_DDR2_SDRAM_DDR2_DQS_pin -into $id 
wave add $tbpath${ps}fpga_0_DDR2_SDRAM_DDR2_DQS_n_pin -into $id 
wave add $tbpath${ps}fpga_0_clk_1_sys_clk_pin -into $id 
wave add $tbpath${ps}fpga_0_rst_1_sys_rst_pin -into $id 
wave add $tbpath${ps}gpio_FIFO_almost_full_I -into $id 
wave add $tbpath${ps}Push_Buttons_5Bit_GPIO_IO_I_pin -into $id 
wave add $tbpath${ps}gpio_FIFO_rd_wr_en_O -into $id 
wave add $tbpath${ps}xps_FIFO_cam_data_I -into $id 
wave add $tbpath${ps}xps_FIFO_data_rd_cnt_I -into $id 
wave add $tbpath${ps}read_clk_fifo_O -into $id 
wave add $tbpath${ps}xps_epc_0_PRH_Data_I_pin -into $id 
wave add $tbpath${ps}xps_epc_0_PRH_CS_n_pin -into $id 
wave add $tbpath${ps}xps_epc_0_PRH_Rdy_pin -into $id 
wave add $tbpath${ps}xps_epc_0_PRH_Rst_pin -into $id 
wave add $tbpath${ps}DDR2_SDRAM_VFBC2_Cmd_Clk_pin -into $id 
wave add $tbpath${ps}DDR2_SDRAM_VFBC2_Cmd_Reset_pin -into $id 
wave add $tbpath${ps}DDR2_SDRAM_VFBC2_Cmd_Data_pin -into $id 
wave add $tbpath${ps}DDR2_SDRAM_VFBC2_Cmd_Write_pin -into $id 
wave add $tbpath${ps}DDR2_SDRAM_VFBC2_Cmd_End_pin -into $id 
wave add $tbpath${ps}DDR2_SDRAM_VFBC2_Cmd_Full_pin -into $id 
wave add $tbpath${ps}DDR2_SDRAM_VFBC2_Cmd_Almost_Full_pin -into $id 
wave add $tbpath${ps}DDR2_SDRAM_VFBC2_Cmd_Idle_pin -into $id 
wave add $tbpath${ps}DDR2_SDRAM_VFBC2_Wd_Clk_pin -into $id 
wave add $tbpath${ps}DDR2_SDRAM_VFBC2_Wd_Reset_pin -into $id 
wave add $tbpath${ps}DDR2_SDRAM_VFBC2_Wd_Write_pin -into $id 
wave add $tbpath${ps}DDR2_SDRAM_VFBC2_Wd_End_Burst_pin -into $id 
wave add $tbpath${ps}DDR2_SDRAM_VFBC2_Wd_Flush_pin -into $id 
wave add $tbpath${ps}DDR2_SDRAM_VFBC2_Wd_Data_pin -into $id 
wave add $tbpath${ps}DDR2_SDRAM_VFBC2_Wd_Data_BE_pin -into $id 
wave add $tbpath${ps}DDR2_SDRAM_VFBC2_Wd_Full_pin -into $id 
wave add $tbpath${ps}DDR2_SDRAM_VFBC2_Wd_Almost_Full_pin -into $id 
wave add $tbpath${ps}DDR2_SDRAM_VFBC2_Rd_Clk_pin -into $id 
wave add $tbpath${ps}DDR2_SDRAM_VFBC2_Rd_Reset_pin -into $id 
wave add $tbpath${ps}DDR2_SDRAM_VFBC2_Rd_Read_pin -into $id 
wave add $tbpath${ps}DDR2_SDRAM_VFBC2_Rd_End_Burst_pin -into $id 
wave add $tbpath${ps}DDR2_SDRAM_VFBC2_Rd_Flush_pin -into $id 
wave add $tbpath${ps}DDR2_SDRAM_VFBC2_Rd_Data_pin -into $id 
wave add $tbpath${ps}DDR2_SDRAM_VFBC2_Rd_Empty_pin -into $id 
wave add $tbpath${ps}DDR2_SDRAM_VFBC2_Rd_Almost_Empty_pin -into $id 

