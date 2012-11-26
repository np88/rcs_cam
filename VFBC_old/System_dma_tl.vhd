----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:45:27 08/05/2012 
-- Design Name: 
-- Module Name:    System_tl - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- local library with constants
use WORK.FIFO_CONST.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity System_tl is port (
		fpga_0_clk_1_sys_clk_pin : IN std_logic;
		cam_Y: IN std_logic_vector(7 downto 0);
		cam_UV: IN std_logic_vector(7 downto 0);
		cam_pwdn: OUT std_logic;
		cam_rst: OUT std_logic;
		cam_sda: INOUT std_logic;
		cam_fodd: IN std_logic;
		cam_scl: INOUT std_logic;
		cam_href: IN std_logic;
		cam_vsyn: IN std_logic;
		cam_pclk: IN std_logic;
		cam_exclk: INOUT std_logic;
		cam_vto: IN std_logic;
		fpga_0_rst_1_sys_rst_pin : IN std_logic;
		switches_i : IN std_logic_vector(7 downto 0);
		Push_Buttons_5Bit_GPIO_IO_I_pin : IN std_logic_vector(4 downto 0);    
		fpga_0_DDR2_SDRAM_DDR2_DQ_pin : INOUT std_logic_vector(63 downto 0);
		fpga_0_DDR2_SDRAM_DDR2_DQS_pin : INOUT std_logic_vector(7 downto 0);
		fpga_0_DDR2_SDRAM_DDR2_DQS_n_pin : INOUT std_logic_vector(7 downto 0);      
		fpga_0_DDR2_SDRAM_DDR2_Clk_pin : OUT std_logic_vector(1 downto 0);
		fpga_0_DDR2_SDRAM_DDR2_Clk_n_pin : OUT std_logic_vector(1 downto 0);
		fpga_0_DDR2_SDRAM_DDR2_CE_pin : OUT std_logic_vector(1 downto 0);
		fpga_0_DDR2_SDRAM_DDR2_CS_n_pin : OUT std_logic_vector(1 downto 0);
		fpga_0_DDR2_SDRAM_DDR2_ODT_pin : OUT std_logic_vector(1 downto 0);
		fpga_0_DDR2_SDRAM_DDR2_RAS_n_pin : OUT std_logic;
		fpga_0_DDR2_SDRAM_DDR2_CAS_n_pin : OUT std_logic;
		fpga_0_DDR2_SDRAM_DDR2_WE_n_pin : OUT std_logic;
		fpga_0_DDR2_SDRAM_DDR2_BankAddr_pin : OUT std_logic_vector(1 downto 0);
		fpga_0_DDR2_SDRAM_DDR2_Addr_pin : OUT std_logic_vector(12 downto 0);
		fpga_0_DDR2_SDRAM_DDR2_DM_pin : OUT std_logic_vector(7 downto 0);
		xps_tft_0_TFT_IIC_SCL_pin : INOUT std_logic;
		xps_tft_0_TFT_IIC_SDA_pin : INOUT std_logic;   
		LEDs_Positions_GPIO_IO_O_pin : OUT std_logic_vector(4 downto 0);
		LEDs_8Bit_GPIO_IO_O_pin : OUT std_logic_vector(7 downto 0);
		test1 : OUT STD_LOGIC;
		test2 : OUT STD_LOGIC;
		test3 : OUT STD_LOGIC;
		xps_tft_0_reset_pin : OUT std_logic;
		xps_tft_0_TFT_HSYNC_pin : OUT std_logic;
		xps_tft_0_TFT_VSYNC_pin : OUT std_logic;
		xps_tft_0_TFT_DE_pin : OUT std_logic;
		xps_tft_0_TFT_DPS_pin : OUT std_logic;
		xps_tft_0_TFT_VGA_CLK_pin : OUT std_logic;
		xps_tft_0_TFT_DVI_CLK_P_pin : OUT std_logic;
		xps_tft_0_TFT_DVI_CLK_N_pin : OUT std_logic;
		xps_tft_0_TFT_DVI_DATA_pin : OUT std_logic_vector(11 downto 0)
  );
end System_tl;

architecture Behavioral of System_tl is

	COMPONENT cam_control
	PORT(
		clk_i : IN std_logic;
		rst_i : IN std_logic;
		start_transfer_i : IN std_logic;       
		cam_i2c_scl_io : INOUT std_logic;
		cam_i2c_sda_io : INOUT std_logic;
		idle_state_o : OUT std_logic
		);
	END COMPONENT;
	

	COMPONENT edge_detector
	PORT(
		clk_i : IN std_logic;
		rst_i : IN std_logic;
		signal_i : IN std_logic;          
		edge_f : OUT std_logic;
		edge_r : OUT std_logic
		);
	END COMPONENT;
	
	
	COMPONENT SM_vfbc_control
	PORT(
		clk_i : IN std_logic;
		rst_i : IN std_logic;
		vsync_i : IN std_logic;
		start_transaction_i : IN std_logic; 
		end_transaction_i : IN std_logic; 
		DDR2_SDRAM_VFBC2_Wd_Reset_pin_o : OUT std_logic;		
		DDR2_SDRAM_VFBC2_Cmd_Reset_pin_o : OUT std_logic;
		DDR2_SDRAM_VFBC2_Cmd_Data_pin_o : OUT std_logic_vector(31 downto 0);
		DDR2_SDRAM_VFBC2_Cmd_Write_pin_o : OUT std_logic;
		write_enable_o : OUT std_logic;
		transfer_done_o : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT MB
	PORT(
		fpga_0_clk_1_sys_clk_pin : IN std_logic;
		fpga_0_rst_1_sys_rst_pin : IN std_logic;
		gpio_FIFO_almost_full_I : IN std_logic;
		Push_Buttons_5Bit_GPIO_IO_I_pin : IN std_logic_vector(4 downto 0);
		xps_FIFO_cam_data_I : IN std_logic;
		xps_FIFO_data_rd_cnt_I : IN std_logic_vector(0 to 19);
		xps_epc_0_PRH_Data_I_pin : IN std_logic_vector(31 downto 0);
		xps_epc_0_PRH_Rdy_pin : IN std_logic;
		xps_epc_0_PRH_Rst_pin : IN std_logic;
		DDR2_SDRAM_VFBC2_Cmd_Clk_pin : IN std_logic;
		DDR2_SDRAM_VFBC2_Cmd_Reset_pin : IN std_logic;
		DDR2_SDRAM_VFBC2_Cmd_Data_pin : IN std_logic_vector(31 downto 0);
		DDR2_SDRAM_VFBC2_Cmd_Write_pin : IN std_logic;
		DDR2_SDRAM_VFBC2_Cmd_End_pin : IN std_logic;
		DDR2_SDRAM_VFBC2_Wd_Clk_pin : IN std_logic;
		DDR2_SDRAM_VFBC2_Wd_Reset_pin : IN std_logic;
		DDR2_SDRAM_VFBC2_Wd_Write_pin : IN std_logic;
		DDR2_SDRAM_VFBC2_Wd_End_Burst_pin : IN std_logic;
		DDR2_SDRAM_VFBC2_Wd_Flush_pin : IN std_logic;
		DDR2_SDRAM_VFBC2_Wd_Data_pin : IN std_logic_vector(15 downto 0);
		DDR2_SDRAM_VFBC2_Wd_Data_BE_pin : IN std_logic_vector(1 downto 0);
		DDR2_SDRAM_VFBC2_Rd_Clk_pin : IN std_logic;
		DDR2_SDRAM_VFBC2_Rd_Reset_pin : IN std_logic;
		DDR2_SDRAM_VFBC2_Rd_Read_pin : IN std_logic;
		DDR2_SDRAM_VFBC2_Rd_End_Burst_pin : IN std_logic;
		DDR2_SDRAM_VFBC2_Rd_Flush_pin : IN std_logic;    
		fpga_0_DDR2_SDRAM_DDR2_DQ_pin : INOUT std_logic_vector(63 downto 0);
		fpga_0_DDR2_SDRAM_DDR2_DQS_pin : INOUT std_logic_vector(7 downto 0);
		fpga_0_DDR2_SDRAM_DDR2_DQS_n_pin : INOUT std_logic_vector(7 downto 0);
		xps_tft_0_TFT_IIC_SCL_pin : INOUT std_logic;
		xps_tft_0_TFT_IIC_SDA_pin : INOUT std_logic;      
		fpga_0_DDR2_SDRAM_DDR2_Clk_pin : OUT std_logic_vector(1 downto 0);
		fpga_0_DDR2_SDRAM_DDR2_Clk_n_pin : OUT std_logic_vector(1 downto 0);
		fpga_0_DDR2_SDRAM_DDR2_CE_pin : OUT std_logic_vector(1 downto 0);
		fpga_0_DDR2_SDRAM_DDR2_CS_n_pin : OUT std_logic_vector(1 downto 0);
		fpga_0_DDR2_SDRAM_DDR2_ODT_pin : OUT std_logic_vector(1 downto 0);
		fpga_0_DDR2_SDRAM_DDR2_RAS_n_pin : OUT std_logic;
		fpga_0_DDR2_SDRAM_DDR2_CAS_n_pin : OUT std_logic;
		fpga_0_DDR2_SDRAM_DDR2_WE_n_pin : OUT std_logic;
		fpga_0_DDR2_SDRAM_DDR2_BankAddr_pin : OUT std_logic_vector(1 downto 0);
		fpga_0_DDR2_SDRAM_DDR2_Addr_pin : OUT std_logic_vector(12 downto 0);
		fpga_0_DDR2_SDRAM_DDR2_DM_pin : OUT std_logic_vector(7 downto 0);
		gpio_FIFO_rd_wr_en_O : OUT std_logic_vector(1 downto 0);
		read_clk_fifo_O : OUT std_logic;
		xps_epc_0_PRH_CS_n_pin : OUT std_logic;
		DDR2_SDRAM_VFBC2_Cmd_Full_pin : OUT std_logic;
		DDR2_SDRAM_VFBC2_Cmd_Almost_Full_pin : OUT std_logic;
		DDR2_SDRAM_VFBC2_Cmd_Idle_pin : OUT std_logic;
		DDR2_SDRAM_VFBC2_Wd_Full_pin : OUT std_logic;
		DDR2_SDRAM_VFBC2_Wd_Almost_Full_pin : OUT std_logic;
		DDR2_SDRAM_VFBC2_Rd_Data_pin : OUT std_logic_vector(15 downto 0);
		DDR2_SDRAM_VFBC2_Rd_Empty_pin : OUT std_logic;
		DDR2_SDRAM_VFBC2_Rd_Almost_Empty_pin : OUT std_logic;
		xps_tft_0_TFT_HSYNC_pin : OUT std_logic;
		xps_tft_0_TFT_VSYNC_pin : OUT std_logic;
		xps_tft_0_TFT_DE_pin : OUT std_logic;
		xps_tft_0_TFT_DPS_pin : OUT std_logic;
		xps_tft_0_TFT_VGA_CLK_pin : OUT std_logic;
		xps_tft_0_TFT_DVI_CLK_P_pin : OUT std_logic;
		xps_tft_0_TFT_DVI_CLK_N_pin : OUT std_logic;
		xps_tft_0_TFT_DVI_DATA_pin : OUT std_logic_vector(11 downto 0)
		);
	END COMPONENT;

	attribute box_type : string;
	attribute box_type of MB : component is "user_black_box";
	
	signal DDR2_SDRAM_VFBC2_Cmd_Clk_pin : std_logic;
	signal DDR2_SDRAM_VFBC2_Cmd_Reset_pin : std_logic;
	signal DDR2_SDRAM_VFBC2_Cmd_Data_pin : std_logic_vector(31 downto 0);
	signal DDR2_SDRAM_VFBC2_Cmd_Write_pin : std_logic;
	signal DDR2_SDRAM_VFBC2_Cmd_End_pin : std_logic;
	signal DDR2_SDRAM_VFBC2_Wd_Clk_pin : std_logic;
	signal DDR2_SDRAM_VFBC2_Wd_Reset_pin : std_logic;
	signal DDR2_SDRAM_VFBC2_Wd_Write_pin : std_logic;
	signal DDR2_SDRAM_VFBC2_Wd_End_Burst_pin : std_logic;
	signal DDR2_SDRAM_VFBC2_Wd_Flush_pin : std_logic;
	signal DDR2_SDRAM_VFBC2_Wd_Data_pin : std_logic_vector(15 downto 0);
	signal DDR2_SDRAM_VFBC2_Wd_Data_BE_pin : std_logic_vector(1 downto 0);
	signal DDR2_SDRAM_VFBC2_Cmd_Full_pin : std_logic;
	signal DDR2_SDRAM_VFBC2_Cmd_Almost_Full_pin : std_logic;
	signal DDR2_SDRAM_VFBC2_Cmd_Idle_pin : std_logic;
	signal DDR2_SDRAM_VFBC2_Wd_Full_pin : std_logic;
	signal DDR2_SDRAM_VFBC2_Wd_Almost_Full_pin : std_logic;
	signal fifo_data_in : std_logic_vector(15 downto 0); 
	signal pos_leds: std_logic_vector(4 downto 0); 
	signal btn_south_edge, btn_center_edge, fifo_empty, fifo_rd_en_i, fifo_valid, fifo_wr_en_i, fifo_read_clk, xps_epc_0_PRH_CS_n_pin : std_logic;
	signal fifo_data_out: std_logic_vector(C_fifo_input_width downto 0);
	signal idle_state_o, btn_north_edge, cmd_reset, fifo_almost_full, fifo_ready, cam_pclk_edge, write_enable, button_edge, fifo_ready_tmp: std_logic;
	signal fifo_wr_data_count, fifo_rd_data_count: STD_LOGIC_VECTOR(C_fifo_width DOWNTO 0);
	signal gpio_camera_I2 : std_logic_vector(9 downto 0); 
	signal gpio_camera_I1: std_logic_vector(2 downto 0); 
	signal gpio_FIFO_rd_wr_en_O : std_logic_vector(1 downto 0); 
	signal epc_data_o, epc_data_i: std_logic_vector(31 downto 0); 
	signal fifo_rd_in_gpio: std_logic_vector(19 downto 0); 
	signal rd_cnt, rd_cnt_reg : std_logic_vector(31 downto 0); 
	signal wd_fifo_full_reg, counted, stop_counting, cam_href_edge, write_enable_edge_r, write_enable_edge_f, cam_vsyn_edge: std_logic := '0';
	signal rd_cnt_reg_reverse : std_logic_vector(0 to 31) := (others => '0');

begin

	Inst_cam_control: cam_control PORT MAP(
		clk_i => fpga_0_clk_1_sys_clk_pin,
		rst_i => fpga_0_rst_1_sys_rst_pin,
		start_transfer_i => btn_north_edge,
		cam_i2c_scl_io => cam_scl,
		cam_i2c_sda_io => cam_sda,
		idle_state_o => LEDs_Positions_GPIO_IO_O_pin(2)
	);

	-- edge detector to get positive edges from camera pixel clock signal
	Inst_edge_detector: edge_detector PORT MAP(
		clk_i => fpga_0_clk_1_sys_clk_pin,
		rst_i => fpga_0_rst_1_sys_rst_pin,
		signal_i => cam_pclk,
		edge_r => cam_pclk_edge,
		edge_f => open
	);
	
	Inst_edge_detector_Button_center: edge_detector PORT MAP(
		clk_i => fpga_0_clk_1_sys_clk_pin,
		rst_i => fpga_0_rst_1_sys_rst_pin,
		signal_i => Push_Buttons_5Bit_GPIO_IO_I_pin(0),
		edge_r => btn_center_edge,
		edge_f => open
	);
	
	Inst_edge_detector_Button_south: edge_detector PORT MAP(
		clk_i => fpga_0_clk_1_sys_clk_pin,
		rst_i => fpga_0_rst_1_sys_rst_pin,
		signal_i => Push_Buttons_5Bit_GPIO_IO_I_pin(2),
		edge_r => btn_south_edge,
		edge_f => open
	);
	
	Inst_edge_detector_Button_north: edge_detector PORT MAP(
		clk_i => fpga_0_clk_1_sys_clk_pin,
		rst_i => fpga_0_rst_1_sys_rst_pin,
		signal_i => Push_Buttons_5Bit_GPIO_IO_I_pin(4),
		edge_r => btn_north_edge,
		edge_f => open
	);
	
	Inst_edge_detector_HRef: edge_detector PORT MAP(
		clk_i => fpga_0_clk_1_sys_clk_pin,
		rst_i => fpga_0_rst_1_sys_rst_pin,
		signal_i => cam_href,
		edge_r => cam_href_edge,
		edge_f => open
	);
	
	Inst_edge_detector_VSync: edge_detector PORT MAP(
		clk_i => fpga_0_clk_1_sys_clk_pin,
		rst_i => fpga_0_rst_1_sys_rst_pin,
		signal_i => cam_vsyn,
		edge_r => cam_vsyn_edge,
		edge_f => open
	);	
	
	Inst_edge_detector_write_enable: edge_detector PORT MAP(
		clk_i => fpga_0_clk_1_sys_clk_pin,
		rst_i => fpga_0_rst_1_sys_rst_pin,
		signal_i => write_enable,
		edge_r => write_enable_edge_r,
		edge_f => write_enable_edge_f
	);	
	
	Inst_SM_vfbc_control: SM_vfbc_control PORT MAP(
		clk_i => fpga_0_clk_1_sys_clk_pin,
		rst_i =>  fpga_0_rst_1_sys_rst_pin,
		vsync_i => cam_vsyn,
		start_transaction_i => btn_center_edge, --center button
		end_transaction_i => btn_south_edge, -- south button
		DDR2_SDRAM_VFBC2_Wd_Reset_pin_o => DDR2_SDRAM_VFBC2_Wd_Reset_pin,
		DDR2_SDRAM_VFBC2_Cmd_Reset_pin_o => cmd_reset,
		DDR2_SDRAM_VFBC2_Cmd_Data_pin_o => DDR2_SDRAM_VFBC2_Cmd_Data_pin,
		DDR2_SDRAM_VFBC2_Cmd_Write_pin_o => DDR2_SDRAM_VFBC2_Cmd_Write_pin,
		write_enable_o => write_enable,
		transfer_done_o => LEDs_Positions_GPIO_IO_O_pin(1) -- west LED
	);

	Inst_MB: MB PORT MAP(
		fpga_0_DDR2_SDRAM_DDR2_Clk_pin => fpga_0_DDR2_SDRAM_DDR2_Clk_pin,
		fpga_0_DDR2_SDRAM_DDR2_Clk_n_pin => fpga_0_DDR2_SDRAM_DDR2_Clk_n_pin,
		fpga_0_DDR2_SDRAM_DDR2_CE_pin => fpga_0_DDR2_SDRAM_DDR2_CE_pin,
		fpga_0_DDR2_SDRAM_DDR2_CS_n_pin => fpga_0_DDR2_SDRAM_DDR2_CS_n_pin,
		fpga_0_DDR2_SDRAM_DDR2_ODT_pin => fpga_0_DDR2_SDRAM_DDR2_ODT_pin,
		fpga_0_DDR2_SDRAM_DDR2_RAS_n_pin => fpga_0_DDR2_SDRAM_DDR2_RAS_n_pin,
		fpga_0_DDR2_SDRAM_DDR2_CAS_n_pin => fpga_0_DDR2_SDRAM_DDR2_CAS_n_pin,
		fpga_0_DDR2_SDRAM_DDR2_WE_n_pin => fpga_0_DDR2_SDRAM_DDR2_WE_n_pin,
		fpga_0_DDR2_SDRAM_DDR2_BankAddr_pin => fpga_0_DDR2_SDRAM_DDR2_BankAddr_pin,
		fpga_0_DDR2_SDRAM_DDR2_Addr_pin => fpga_0_DDR2_SDRAM_DDR2_Addr_pin,
		fpga_0_DDR2_SDRAM_DDR2_DQ_pin => fpga_0_DDR2_SDRAM_DDR2_DQ_pin,
		fpga_0_DDR2_SDRAM_DDR2_DM_pin => fpga_0_DDR2_SDRAM_DDR2_DM_pin,
		fpga_0_DDR2_SDRAM_DDR2_DQS_pin => fpga_0_DDR2_SDRAM_DDR2_DQS_pin,
		fpga_0_DDR2_SDRAM_DDR2_DQS_n_pin => fpga_0_DDR2_SDRAM_DDR2_DQS_n_pin,
		fpga_0_clk_1_sys_clk_pin => fpga_0_clk_1_sys_clk_pin,
		fpga_0_rst_1_sys_rst_pin => fpga_0_rst_1_sys_rst_pin,
		gpio_FIFO_almost_full_I => fifo_almost_full,
		Push_Buttons_5Bit_GPIO_IO_I_pin => Push_Buttons_5Bit_GPIO_IO_I_pin,
		xps_FIFO_cam_data_I => cam_vsyn,
		gpio_FIFO_rd_wr_en_O => gpio_FIFO_rd_wr_en_O,
		xps_FIFO_data_rd_cnt_I => fifo_rd_in_gpio,
		read_clk_fifo_O => fifo_read_clk,
		xps_epc_0_PRH_Data_I_pin => rd_cnt_reg_reverse,
		xps_epc_0_PRH_CS_n_pin => xps_epc_0_PRH_CS_n_pin, -- inverted logic
		xps_epc_0_PRH_Rdy_pin => fifo_ready_tmp, -- fifo is ready when it is not empty
		xps_epc_0_PRH_Rst_pin => NOT fpga_0_rst_1_sys_rst_pin, -- inverted logic
		DDR2_SDRAM_VFBC2_Cmd_Clk_pin => fpga_0_clk_1_sys_clk_pin,
		DDR2_SDRAM_VFBC2_Cmd_Reset_pin => DDR2_SDRAM_VFBC2_Cmd_Reset_pin,
		DDR2_SDRAM_VFBC2_Cmd_Data_pin => DDR2_SDRAM_VFBC2_Cmd_Data_pin,
		DDR2_SDRAM_VFBC2_Cmd_Write_pin => DDR2_SDRAM_VFBC2_Cmd_Write_pin,
		DDR2_SDRAM_VFBC2_Cmd_End_pin => DDR2_SDRAM_VFBC2_Cmd_End_pin,
		DDR2_SDRAM_VFBC2_Cmd_Full_pin => DDR2_SDRAM_VFBC2_Cmd_Full_pin,
		DDR2_SDRAM_VFBC2_Cmd_Almost_Full_pin => open,
		DDR2_SDRAM_VFBC2_Cmd_Idle_pin => DDR2_SDRAM_VFBC2_Cmd_Idle_pin,
		DDR2_SDRAM_VFBC2_Wd_Clk_pin => cam_pclk,
		DDR2_SDRAM_VFBC2_Wd_Reset_pin => DDR2_SDRAM_VFBC2_Wd_Reset_pin,
		DDR2_SDRAM_VFBC2_Wd_Write_pin => DDR2_SDRAM_VFBC2_Wd_Write_pin,
		DDR2_SDRAM_VFBC2_Wd_End_Burst_pin => '0',
		DDR2_SDRAM_VFBC2_Wd_Flush_pin => '0',
		DDR2_SDRAM_VFBC2_Wd_Data_pin => DDR2_SDRAM_VFBC2_Wd_Data_pin,
		DDR2_SDRAM_VFBC2_Wd_Data_BE_pin => DDR2_SDRAM_VFBC2_Wd_Data_BE_pin,
		DDR2_SDRAM_VFBC2_Wd_Full_pin => DDR2_SDRAM_VFBC2_Wd_Full_pin,
		DDR2_SDRAM_VFBC2_Wd_Almost_Full_pin =>DDR2_SDRAM_VFBC2_Wd_Almost_Full_pin,
		DDR2_SDRAM_VFBC2_Rd_Clk_pin => fpga_0_clk_1_sys_clk_pin,
		DDR2_SDRAM_VFBC2_Rd_Reset_pin => not fpga_0_rst_1_sys_rst_pin,
		DDR2_SDRAM_VFBC2_Rd_Read_pin => '0',
		DDR2_SDRAM_VFBC2_Rd_End_Burst_pin => '0',
		DDR2_SDRAM_VFBC2_Rd_Flush_pin => '0',
		DDR2_SDRAM_VFBC2_Rd_Data_pin => open,
		DDR2_SDRAM_VFBC2_Rd_Empty_pin => open,
		DDR2_SDRAM_VFBC2_Rd_Almost_Empty_pin => open, 
		xps_tft_0_TFT_HSYNC_pin => xps_tft_0_TFT_HSYNC_pin,
		xps_tft_0_TFT_VSYNC_pin => xps_tft_0_TFT_VSYNC_pin,
		xps_tft_0_TFT_DE_pin => xps_tft_0_TFT_DE_pin,
		xps_tft_0_TFT_DPS_pin => xps_tft_0_TFT_DPS_pin,
		xps_tft_0_TFT_VGA_CLK_pin => xps_tft_0_TFT_VGA_CLK_pin,
		xps_tft_0_TFT_DVI_CLK_P_pin => xps_tft_0_TFT_DVI_CLK_P_pin,
		xps_tft_0_TFT_DVI_CLK_N_pin => xps_tft_0_TFT_DVI_CLK_N_pin,
		xps_tft_0_TFT_DVI_DATA_pin => xps_tft_0_TFT_DVI_DATA_pin,
		xps_tft_0_TFT_IIC_SCL_pin => xps_tft_0_TFT_IIC_SCL_pin,
		xps_tft_0_TFT_IIC_SDA_pin => xps_tft_0_TFT_IIC_SDA_pin
	);
	
	DDR2_SDRAM_VFBC2_Cmd_Reset_pin <= cmd_reset or Push_Buttons_5Bit_GPIO_IO_I_pin(4);
	
	-- debug process to count href
	dubug: process (fpga_0_clk_1_sys_clk_pin, button_edge)
	begin
		if (fpga_0_rst_1_sys_rst_pin = '0') then
			rd_cnt <= (others => '0');
			fifo_ready <= '0';
		else
			if fpga_0_clk_1_sys_clk_pin'event and fpga_0_clk_1_sys_clk_pin = '1' then
				fifo_ready <= '0';
				if (cam_href_edge = '1' and write_enable = '1') then
					rd_cnt <= STD_LOGIC_VECTOR(unsigned(rd_cnt) + 1);
					fifo_ready <= '1';
				elsif write_enable_edge_f = '1' then
					rd_cnt <= (others => '0');
				end if;
			end if;
		end if;
	end process dubug;
		
	check_fifo_full: process (fpga_0_clk_1_sys_clk_pin, write_enable_edge_f)
	begin
		if (fpga_0_rst_1_sys_rst_pin = '0') then
			wd_fifo_full_reg <= '0';
		elsif fpga_0_clk_1_sys_clk_pin'event and fpga_0_clk_1_sys_clk_pin = '1' then 
			if (DDR2_SDRAM_VFBC2_Wd_Full_pin = '1') then
				wd_fifo_full_reg <= '1';
			end if;
		end if;			
	end process check_fifo_full;
	
--	reverse_val: process (rd_cnt)
--	begin
--		for i in 0 to 31 loop
--			rd_cnt_reg_reverse(i) <= rd_cnt(i);
--		end loop;
--	end process;
	
	rd_cnt_reg_reverse(31) <= write_enable_edge_f;
	--rd_cnt_reg_reverse(0 to 31) <= "00000000000000001111111111111111";
	fifo_ready_tmp <= fifo_ready;
	
	--DDR2_SDRAM_VFBC2_Wd_Data_pin <= "11111111" & switches_i;
	DDR2_SDRAM_VFBC2_Wd_Write_pin <= cam_href and write_enable;
	test1 <= wd_fifo_full_reg;
	test2 <= cam_href and write_enable;
	test3 <= write_enable;
	
	fifo_rd_in_gpio(14 downto 0) <= fifo_rd_data_count;
	--wr_en_i <= Push_Buttons_5Bit_GPIO_IO_I_pin(4) and gpio_camera_IO(7);
	LEDs_Positions_GPIO_IO_O_pin(0) <= DDR2_SDRAM_VFBC2_Wd_Full_pin; --center
	fifo_rd_en_i <= NOT xps_epc_0_PRH_CS_n_pin;
	--LEDs_Positions_GPIO_IO_O_pin(2) <= fifo_ready; -- south
	LEDs_Positions_GPIO_IO_O_pin(3) <= DDR2_SDRAM_VFBC2_Cmd_Idle_pin; -- east
	LEDs_Positions_GPIO_IO_O_pin(4) <= fpga_0_rst_1_sys_rst_pin; --north
	LEDs_8Bit_GPIO_IO_O_pin <= fifo_data_out(7 downto 0);
	--LEDs_Positions_GPIO_IO_O_pin(1) <= cam_pclk;


	fifo_data_in <= cam_Y & cam_uv;
	gpio_camera_I1 <= '0' & cam_vsyn & '0';
	--gpio_camera_IO <='0'&'0'&cam_sda&cam_fodd&cam_scl&cam_href&cam_vsyn&cam_pclk&cam_exclk&cam_vto;
	cam_pwdn <= '0';
	cam_rst <= '0';
	epc_data_i <= fifo_data_out & fifo_data_out;
	--fifo_ready <= NOT fifo_empty;
	DDR2_SDRAM_VFBC2_Wd_Data_pin <= cam_Y & cam_UV;
	
	
	xps_tft_0_reset_pin <= '1'; -- Chrontel Video Converter has active low 
	
end Behavioral;



