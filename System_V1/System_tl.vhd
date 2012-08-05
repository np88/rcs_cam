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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity System_tl is port (
		fpga_0_clk_1_sys_clk_pin : IN std_logic;
		fpga_0_rst_1_sys_rst_pin : IN std_logic;
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
		gpio_FIFO_I : IN std_logic_vector(17 downto 0);
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
		gpio_FIFO_O : OUT std_logic;
		LEDs_Positions_GPIO_IO_O_pin : OUT std_logic_vector(4 downto 0);
		LEDs_8Bit_GPIO_IO_O_pin : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

--
--	COMPONENT FIFO_asynch_tl is PORT (
--		 rst_i : IN STD_LOGIC;
--		 wr_clk_i : IN STD_LOGIC;
--		 rd_clk_i : IN STD_LOGIC;
--		 din_i : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
--		 wr_en_i : IN STD_LOGIC;
--		 rd_en_i : IN STD_LOGIC;
--		 dout_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
--		 full_o : OUT STD_LOGIC;
--		 empty_o : OUT STD_LOGIC;
--		 valid_o : OUT STD_LOGIC;
--		 underflow_o : OUT STD_LOGIC;
--		 rd_data_count_o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
--		 wr_data_count_o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
--	  );
--	END COMPONENT;
	
	
	attribute box_type : string;
	attribute box_type of MB : component is "user_black_box";
	
	signal gpio_FIFO_I : std_logic_vector(17 downto 0); 
	signal pos_leds: std_logic_vector(4 downto 0); 
	
begin
	--pos_leds <= Push_Buttons_5Bit_GPIO_IO_I_pin;

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
		gpio_FIFO_I => gpio_FIFO_I,
		gpio_FIFO_O => open,
		LEDs_Positions_GPIO_IO_O_pin => LEDs_Positions_GPIO_IO_O_pin,
		Push_Buttons_5Bit_GPIO_IO_I_pin => Push_Buttons_5Bit_GPIO_IO_I_pin,
		LEDs_8Bit_GPIO_IO_O_pin => LEDs_8Bit_GPIO_IO_O_pin
	);


--	Inst_FIFO_Asynch: FIFO_asynch_tl PORT MAP (
--		 rst_i => buttons_i(4),
--		 wr_clk_i => fpga_0_clk_1_sys_clk_pin,
--		 rd_clk_i => fpga_0_clk_1_sys_clk_pin,
--		 din_i => switches_i,
--		 wr_en_i => buttons_i(0),
--		 rd_en_i => read_enable,
--		 dout_o => fifo_data,
--		 full_o => fifo_full,
--		 empty_o => fifo_empty,
--		 valid_o => open,
--		 underflow_o => open,
--		 rd_data_count_o => open,
--		 wr_data_count_o => open
--	);

end Behavioral;


