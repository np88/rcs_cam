
-- VHDL Instantiation Created from source file System_tl.vhd -- 10:01:06 08/13/2012
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT System_tl
	PORT(
		fpga_0_clk_1_sys_clk_pin : IN std_logic;
		cam_clock_i : IN std_logic;
		cam_Y : IN std_logic_vector(7 downto 0);
		cam_UV : IN std_logic_vector(7 downto 0);
		cam_fodd : IN std_logic;
		cam_href : IN std_logic;
		cam_vsyn : IN std_logic;
		cam_pclk : IN std_logic;
		cam_vto : IN std_logic;
		fpga_0_rst_1_sys_rst_pin : IN std_logic;
		switches_i : IN std_logic_vector(7 downto 0);
		Push_Buttons_5Bit_GPIO_IO_I_pin : IN std_logic_vector(4 downto 0);    
		cam_sda : INOUT std_logic;
		cam_scl : INOUT std_logic;
		cam_exclk : INOUT std_logic;
		fpga_0_DDR2_SDRAM_DDR2_DQ_pin : INOUT std_logic_vector(63 downto 0);
		fpga_0_DDR2_SDRAM_DDR2_DQS_pin : INOUT std_logic_vector(7 downto 0);
		fpga_0_DDR2_SDRAM_DDR2_DQS_n_pin : INOUT std_logic_vector(7 downto 0);      
		cam_pwdn : OUT std_logic;
		cam_rst : OUT std_logic;
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
		LEDs_Positions_GPIO_IO_O_pin : OUT std_logic_vector(4 downto 0);
		LEDs_8Bit_GPIO_IO_O_pin : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_System_tl: System_tl PORT MAP(
		fpga_0_clk_1_sys_clk_pin => ,
		cam_clock_i => ,
		cam_Y => ,
		cam_UV => ,
		cam_pwdn => ,
		cam_rst => ,
		cam_sda => ,
		cam_fodd => ,
		cam_scl => ,
		cam_href => ,
		cam_vsyn => ,
		cam_pclk => ,
		cam_exclk => ,
		cam_vto => ,
		fpga_0_rst_1_sys_rst_pin => ,
		switches_i => ,
		Push_Buttons_5Bit_GPIO_IO_I_pin => ,
		fpga_0_DDR2_SDRAM_DDR2_DQ_pin => ,
		fpga_0_DDR2_SDRAM_DDR2_DQS_pin => ,
		fpga_0_DDR2_SDRAM_DDR2_DQS_n_pin => ,
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
		fpga_0_DDR2_SDRAM_DDR2_DM_pin => ,
		LEDs_Positions_GPIO_IO_O_pin => ,
		LEDs_8Bit_GPIO_IO_O_pin => 
	);


