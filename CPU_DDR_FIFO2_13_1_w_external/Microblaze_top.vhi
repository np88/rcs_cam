
-- VHDL Instantiation Created from source file Microblaze_top.vhd -- 16:31:05 08/03/2012
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Microblaze_top
	PORT(
		fpga_0_SRAM_ZBT_CLK_FB_pin : IN std_logic;
		fpga_0_clk_1_sys_clk_pin : IN std_logic;
		fpga_0_rst_1_sys_rst_pin : IN std_logic;
		gpio_fifo_I : IN std_logic_vector(17 downto 0);    
		fpga_0_SRAM_Mem_DQ_pin : INOUT std_logic_vector(0 to 31);
		fpga_0_DDR2_SDRAM_DDR2_DQ_pin : INOUT std_logic_vector(63 downto 0);
		fpga_0_DDR2_SDRAM_DDR2_DQS_pin : INOUT std_logic_vector(7 downto 0);
		fpga_0_DDR2_SDRAM_DDR2_DQS_n_pin : INOUT std_logic_vector(7 downto 0);      
		fpga_0_SRAM_Mem_A_pin : OUT std_logic_vector(7 to 30);
		fpga_0_SRAM_Mem_CEN_pin : OUT std_logic;
		fpga_0_SRAM_Mem_OEN_pin : OUT std_logic;
		fpga_0_SRAM_Mem_WEN_pin : OUT std_logic;
		fpga_0_SRAM_Mem_BEN_pin : OUT std_logic_vector(0 to 3);
		fpga_0_SRAM_Mem_ADV_LDN_pin : OUT std_logic;
		fpga_0_SRAM_ZBT_CLK_OUT_pin : OUT std_logic;
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
		LEDs_8Bit_O : OUT std_logic_vector(7 downto 0);
		LEDs_Positions_O : OUT std_logic_vector(4 downto 0);
		gpio_fifo_O : OUT std_logic
		);
	END COMPONENT;

	Inst_Microblaze_top: Microblaze_top PORT MAP(
		fpga_0_SRAM_Mem_A_pin => ,
		fpga_0_SRAM_Mem_CEN_pin => ,
		fpga_0_SRAM_Mem_OEN_pin => ,
		fpga_0_SRAM_Mem_WEN_pin => ,
		fpga_0_SRAM_Mem_BEN_pin => ,
		fpga_0_SRAM_Mem_ADV_LDN_pin => ,
		fpga_0_SRAM_Mem_DQ_pin => ,
		fpga_0_SRAM_ZBT_CLK_OUT_pin => ,
		fpga_0_SRAM_ZBT_CLK_FB_pin => ,
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
		LEDs_8Bit_O => ,
		LEDs_Positions_O => ,
		gpio_fifo_O => ,
		gpio_fifo_I => 
	);


