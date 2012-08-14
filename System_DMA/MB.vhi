
-- VHDL Instantiation Created from source file MB.vhd -- 18:35:30 08/14/2012
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT MB
	PORT(
		fpga_0_clk_1_sys_clk_pin : IN std_logic;
		fpga_0_rst_1_sys_rst_pin : IN std_logic;
		gpio_FIFO_almost_full_I : IN std_logic;
		Push_Buttons_5Bit_GPIO_IO_I_pin : IN std_logic_vector(4 downto 0);
		xps_FIFO_cam_data_I : IN std_logic_vector(31 downto 0);
		xps_FIFO_data_rd_cnt_I : IN std_logic_vector(19 downto 0);
		xps_epc_0_PRH_Data_I_pin : IN std_logic_vector(0 to 31);
		xps_epc_0_PRH_Rdy_pin : IN std_logic;
		xps_epc_0_PRH_Rst_pin : IN std_logic;    
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
		gpio_FIFO_rd_wr_en_O : OUT std_logic_vector(1 downto 0);
		read_clk_fifo_O : OUT std_logic;
		xps_epc_0_PRH_CS_n_pin : OUT std_logic
		);
	END COMPONENT;

attribute box_type : string;
attribute box_type of MB : component is "user_black_box";


	Inst_MB: MB PORT MAP(
		fpga_0_DDR2_SDRAM_DDR2_Clk_pin => ,
		fpga_0_DDR2_SDRAM_DDR2_Clk_n_pin => ,
		fpga_0_DDR2_SDRAM_DDR2_CE_pin => ,
		fpga_0_DDR2_SDRAM_DDR2_CS_n_pin => ,
		fpga_0_DDR2_SDRAM_DDR2_ODT_pin => ,
		fpga_0_DDR2_SDRAM_DDR2_RAS_n_pin => ,
		fpga_0_DDR2_SDRAM_DDR2_CAS_n_pin => ,
		fpga_0_DDR2_SDRAM_DDR2_WE_n_pin => ,
		fpga_0_DDR2_SDRAM_DDR2_BankAddr_pin => ,
		fpga_0_DDR2_SDRAM_DDR2_Addr_pin => ,
		fpga_0_DDR2_SDRAM_DDR2_DQ_pin => ,
		fpga_0_DDR2_SDRAM_DDR2_DM_pin => ,
		fpga_0_DDR2_SDRAM_DDR2_DQS_pin => ,
		fpga_0_DDR2_SDRAM_DDR2_DQS_n_pin => ,
		fpga_0_clk_1_sys_clk_pin => ,
		fpga_0_rst_1_sys_rst_pin => ,
		gpio_FIFO_almost_full_I => ,
		Push_Buttons_5Bit_GPIO_IO_I_pin => ,
		gpio_FIFO_rd_wr_en_O => ,
		xps_FIFO_cam_data_I => ,
		xps_FIFO_data_rd_cnt_I => ,
		read_clk_fifo_O => ,
		xps_epc_0_PRH_Data_I_pin => ,
		xps_epc_0_PRH_CS_n_pin => ,
		xps_epc_0_PRH_Rdy_pin => ,
		xps_epc_0_PRH_Rst_pin => 
	);



