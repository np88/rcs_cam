
-- VHDL Instantiation Created from source file Mikroblaze.vhd -- 13:35:48 08/03/2012
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Mikroblaze
	PORT(
		fpga_0_clk_1_sys_clk_pin : IN std_logic;
		fpga_0_rst_1_sys_rst_pin : IN std_logic;
		gpio_FIFO_in : IN std_logic_vector(17 downto 0);
		Push_Buttons_5Bit_GPIO_IO_I_pin : IN std_logic_vector(4 downto 0);
		DIP_Switches_8Bit_GPIO_IO_I_pin : IN std_logic_vector(7 downto 0);    
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
		gpio_FIFO_out : OUT std_logic;
		LEDs_8Bit_O : OUT std_logic_vector(7 downto 0);
		LEDs_Positions_GPIO_IO_O_pin : OUT std_logic_vector(4 downto 0)
		);
	END COMPONENT;

attribute box_type : string;
attribute box_type of Mikroblaze : component is "user_black_box";


	Inst_Mikroblaze: Mikroblaze PORT MAP(
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
		gpio_FIFO_out => ,
		gpio_FIFO_in => ,
		LEDs_8Bit_O => ,
		Push_Buttons_5Bit_GPIO_IO_I_pin => ,
		LEDs_Positions_GPIO_IO_O_pin => ,
		DIP_Switches_8Bit_GPIO_IO_I_pin => 
	);



