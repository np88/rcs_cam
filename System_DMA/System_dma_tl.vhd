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
--use IEEE.NUMERIC_STD.ALL;

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
		LEDs_Positions_GPIO_IO_O_pin : OUT std_logic_vector(4 downto 0);
		LEDs_8Bit_GPIO_IO_O_pin : OUT std_logic_vector(7 downto 0)
  );
end System_tl;

architecture Behavioral of System_tl is

	COMPONENT MB
	PORT(
		fpga_0_clk_1_sys_clk_pin : IN std_logic;
		fpga_0_rst_1_sys_rst_pin : IN std_logic;
		gpio_FIFO_almost_full_I : IN std_logic;
		Push_Buttons_5Bit_GPIO_IO_I_pin : IN std_logic_vector(4 downto 0);
		xps_FIFO_cam_data_I : IN std_logic;
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

	COMPONENT FIFO_asynch13_1_tl
	  PORT (
		 rst_i : IN STD_LOGIC;
		 wr_clk_i : IN STD_LOGIC;
		 rd_clk_i : IN STD_LOGIC;
		 din_i : IN STD_LOGIC_VECTOR(C_fifo_input_width DOWNTO 0);
		 wr_en_i : IN STD_LOGIC;
		 rd_en_i : IN STD_LOGIC;
		 dout_o : OUT STD_LOGIC_VECTOR(C_fifo_input_width DOWNTO 0);
		 full_o : OUT STD_LOGIC;
		 almost_full_o : OUT STD_LOGIC;
		 empty_o : OUT STD_LOGIC;
		 valid_o : OUT STD_LOGIC;
		 rd_data_count_o : OUT STD_LOGIC_VECTOR(C_fifo_width DOWNTO 0);
		 wr_data_count_o : OUT STD_LOGIC_VECTOR(C_fifo_width DOWNTO 0)
	  );
	END COMPONENT;
	
	
	attribute box_type : string;
	attribute box_type of MB : component is "user_black_box";
	
	signal fifo_data_in : std_logic_vector(15 downto 0); 
	signal pos_leds: std_logic_vector(4 downto 0); 
	signal fifo_almost_full, fifo_full, fifo_empty, fifo_rd_en_i, fifo_valid, fifo_wr_en_i, fifo_read_clk, xps_epc_0_PRH_CS_n_pin : std_logic;
	signal fifo_data_out: std_logic_vector(C_fifo_input_width downto 0);
	signal fifo_ready: std_logic;
	signal fifo_wr_data_count, fifo_rd_data_count: STD_LOGIC_VECTOR(C_fifo_width DOWNTO 0);
	signal gpio_camera_I2 : std_logic_vector(9 downto 0); 
	signal gpio_camera_I1: std_logic_vector(2 downto 0); 
	signal gpio_FIFO_rd_wr_en_O : std_logic_vector(1 downto 0); 
	signal epc_data_o, epc_data_i: std_logic_vector(31 downto 0); 
	signal fifo_rd_in_gpio: std_logic_vector(19 downto 0); 

begin

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
		xps_epc_0_PRH_Data_I_pin => epc_data_i,
		xps_epc_0_PRH_CS_n_pin => xps_epc_0_PRH_CS_n_pin, -- inverted logic
		xps_epc_0_PRH_Rdy_pin => fifo_ready, -- fifo is ready when it is not empty
		xps_epc_0_PRH_Rst_pin => NOT fpga_0_rst_1_sys_rst_pin -- inverted logic
	);


	Inst_FIFO_Asynch: FIFO_asynch13_1_tl PORT MAP (
		 rst_i => Push_Buttons_5Bit_GPIO_IO_I_pin(0), --(center button)
		 wr_clk_i => cam_pclk,
		 rd_clk_i => fpga_0_clk_1_sys_clk_pin,
		 din_i => fifo_data_in,
		 wr_en_i => cam_href, 
		 rd_en_i => fifo_rd_en_i,
		 dout_o => fifo_data_out,
		 full_o => fifo_full,
		 almost_full_o => fifo_almost_full,
		 empty_o => fifo_empty, --center
		 valid_o => open, -- west
		 rd_data_count_o => fifo_rd_data_count,
		 wr_data_count_o => fifo_wr_data_count
	);
	
	fifo_rd_in_gpio(14 downto 0) <= fifo_rd_data_count;
	--wr_en_i <= Push_Buttons_5Bit_GPIO_IO_I_pin(4) and gpio_camera_IO(7);
	LEDs_Positions_GPIO_IO_O_pin(0) <= fifo_empty; --center
	fifo_rd_en_i <= NOT xps_epc_0_PRH_CS_n_pin;
	LEDs_Positions_GPIO_IO_O_pin(2) <= fifo_full; -- south
	LEDs_Positions_GPIO_IO_O_pin(3) <= fifo_rd_en_i; -- east
	LEDs_Positions_GPIO_IO_O_pin(4) <= cam_href; --north
	LEDs_8Bit_GPIO_IO_O_pin <= fifo_data_out(7 downto 0);
	LEDs_Positions_GPIO_IO_O_pin(1) <= cam_pclk;


	fifo_data_in <= cam_Y & cam_uv;
	gpio_camera_I1 <= '0' & cam_vsyn & '0';
	--gpio_camera_IO <='0'&'0'&cam_sda&cam_fodd&cam_scl&cam_href&cam_vsyn&cam_pclk&cam_exclk&cam_vto;
	cam_pwdn <= '0';
	cam_rst <= '0';
	epc_data_i <= fifo_data_out & fifo_data_out;
	fifo_ready <= NOT fifo_empty;
	
end Behavioral;



