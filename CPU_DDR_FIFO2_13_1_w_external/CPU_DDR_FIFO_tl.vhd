----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:53:55 08/02/2012 
-- Design Name: 
-- Module Name:    CPU_DDR_FIFO_tl - Behavioral 
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

entity CPU_DDR_FIFO_tl is port (
    fpga_0_DDR2_SDRAM_DDR2_Clk_pin : out std_logic_vector(1 downto 0);
    fpga_0_DDR2_SDRAM_DDR2_Clk_n_pin : out std_logic_vector(1 downto 0);
    fpga_0_DDR2_SDRAM_DDR2_CE_pin : out std_logic_vector(1 downto 0);
    fpga_0_DDR2_SDRAM_DDR2_CS_n_pin : out std_logic_vector(1 downto 0);
    fpga_0_DDR2_SDRAM_DDR2_ODT_pin : out std_logic_vector(1 downto 0);
    fpga_0_DDR2_SDRAM_DDR2_RAS_n_pin : out std_logic;
    fpga_0_DDR2_SDRAM_DDR2_CAS_n_pin : out std_logic;
    fpga_0_DDR2_SDRAM_DDR2_WE_n_pin : out std_logic;
    fpga_0_DDR2_SDRAM_DDR2_BankAddr_pin : out std_logic_vector(1 downto 0);
    fpga_0_DDR2_SDRAM_DDR2_Addr_pin : out std_logic_vector(12 downto 0);
    fpga_0_DDR2_SDRAM_DDR2_DQ_pin : inout std_logic_vector(63 downto 0);
    fpga_0_DDR2_SDRAM_DDR2_DM_pin : out std_logic_vector(7 downto 0);
    fpga_0_DDR2_SDRAM_DDR2_DQS_pin : inout std_logic_vector(7 downto 0);
    fpga_0_DDR2_SDRAM_DDR2_DQS_n_pin : inout std_logic_vector(7 downto 0);
    fpga_0_clk_1_sys_clk_pin : in std_logic;
    fpga_0_rst_1_sys_rst_pin : in std_logic;
    LEDs_8Bit_O : out std_logic_vector(7 downto 0);
    LEDs_Positions_O : out std_logic_vector(4 downto 0);
	 buttons_i : in std_logic_vector(4 downto 0);
	 switches_i : in std_logic_vector(7 downto 0)
	);
end CPU_DDR_FIFO_tl;

architecture Behavioral of CPU_DDR_FIFO_tl is

  component Microblaze is
    port (
      fpga_0_DDR2_SDRAM_DDR2_Clk_pin : out std_logic_vector(1 downto 0);
      fpga_0_DDR2_SDRAM_DDR2_Clk_n_pin : out std_logic_vector(1 downto 0);
      fpga_0_DDR2_SDRAM_DDR2_CE_pin : out std_logic_vector(1 downto 0);
      fpga_0_DDR2_SDRAM_DDR2_CS_n_pin : out std_logic_vector(1 downto 0);
      fpga_0_DDR2_SDRAM_DDR2_ODT_pin : out std_logic_vector(1 downto 0);
      fpga_0_DDR2_SDRAM_DDR2_RAS_n_pin : out std_logic;
      fpga_0_DDR2_SDRAM_DDR2_CAS_n_pin : out std_logic;
      fpga_0_DDR2_SDRAM_DDR2_WE_n_pin : out std_logic;
      fpga_0_DDR2_SDRAM_DDR2_BankAddr_pin : out std_logic_vector(1 downto 0);
      fpga_0_DDR2_SDRAM_DDR2_Addr_pin : out std_logic_vector(12 downto 0);
      fpga_0_DDR2_SDRAM_DDR2_DQ_pin : inout std_logic_vector(63 downto 0);
      fpga_0_DDR2_SDRAM_DDR2_DM_pin : out std_logic_vector(7 downto 0);
      fpga_0_DDR2_SDRAM_DDR2_DQS_pin : inout std_logic_vector(7 downto 0);
      fpga_0_DDR2_SDRAM_DDR2_DQS_n_pin : inout std_logic_vector(7 downto 0);
      fpga_0_clk_1_sys_clk_pin : in std_logic;
      fpga_0_rst_1_sys_rst_pin : in std_logic;
      LEDs_8Bit_O : out std_logic_vector(7 downto 0);
      LEDs_Positions_O : out std_logic_vector(4 downto 0);
      gpio_fifo_O : out std_logic;
      gpio_fifo_I : in std_logic_vector(17 downto 0)
    );
  end component;

--	COMPONENT Mikroblaze
--	PORT(
--		fpga_0_clk_1_sys_clk_pin : IN std_logic;
--		fpga_0_rst_1_sys_rst_pin : IN std_logic;
--		gpio_FIFO_in : IN std_logic_vector(17 downto 0);
--		Push_Buttons_5Bit_GPIO_IO_I_pin : IN std_logic_vector(4 downto 0);
--		DIP_Switches_8Bit_GPIO_IO_I_pin : IN std_logic_vector(7 downto 0);    
--		fpga_0_DDR2_SDRAM_DDR2_DQ_pin : INOUT std_logic_vector(63 downto 0);
--		fpga_0_DDR2_SDRAM_DDR2_DQS_pin : INOUT std_logic_vector(7 downto 0);
--		fpga_0_DDR2_SDRAM_DDR2_DQS_n_pin : INOUT std_logic_vector(7 downto 0);      
--		fpga_0_DDR2_SDRAM_DDR2_Clk_pin : OUT std_logic_vector(1 downto 0);
--		fpga_0_DDR2_SDRAM_DDR2_Clk_n_pin : OUT std_logic_vector(1 downto 0);
--		fpga_0_DDR2_SDRAM_DDR2_CE_pin : OUT std_logic_vector(1 downto 0);
--		fpga_0_DDR2_SDRAM_DDR2_CS_n_pin : OUT std_logic_vector(1 downto 0);
--		fpga_0_DDR2_SDRAM_DDR2_ODT_pin : OUT std_logic_vector(1 downto 0);
--		fpga_0_DDR2_SDRAM_DDR2_RAS_n_pin : OUT std_logic;
--		fpga_0_DDR2_SDRAM_DDR2_CAS_n_pin : OUT std_logic;
--		fpga_0_DDR2_SDRAM_DDR2_WE_n_pin : OUT std_logic;
--		fpga_0_DDR2_SDRAM_DDR2_BankAddr_pin : OUT std_logic_vector(1 downto 0);
--		fpga_0_DDR2_SDRAM_DDR2_Addr_pin : OUT std_logic_vector(12 downto 0);
--		fpga_0_DDR2_SDRAM_DDR2_DM_pin : OUT std_logic_vector(7 downto 0);
--		gpio_FIFO_out : OUT std_logic;
--		LEDs_8Bit_O : OUT std_logic_vector(7 downto 0);
--		LEDs_Positions_GPIO_IO_O_pin : OUT std_logic_vector(4 downto 0)
--		);
--	END COMPONENT;
	
	
	COMPONENT FIFO_asynch_tl is PORT (
		 rst_i : IN STD_LOGIC;
		 wr_clk_i : IN STD_LOGIC;
		 rd_clk_i : IN STD_LOGIC;
		 din_i : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 wr_en_i : IN STD_LOGIC;
		 rd_en_i : IN STD_LOGIC;
		 dout_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 full_o : OUT STD_LOGIC;
		 empty_o : OUT STD_LOGIC;
		 valid_o : OUT STD_LOGIC;
		 underflow_o : OUT STD_LOGIC;
		 rd_data_count_o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 wr_data_count_o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	  );
	END COMPONENT;
	
	attribute box_type : string;
	attribute box_type of Microblaze : component is "user_black_box";
	
	signal fifo_data: std_logic_vector(7 downto 0);
	signal gpio_fifo_in: std_logic_vector(17 downto 0);
	signal fifo_full, fifo_empty, read_enable: std_logic;
begin

	gpio_fifo_in(7 downto 0) <= fifo_data(7 downto 0);
	gpio_fifo_in(17 downto 16) <= fifo_full & fifo_empty;
	
	
Inst_Microblaze: Microblaze PORT MAP(
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
		LEDs_8Bit_O => LEDs_8Bit_O,
		LEDs_Positions_O => LEDs_Positions_O,
		gpio_fifo_O => read_enable,
		gpio_fifo_I => gpio_fifo_in
	);	
	
--	Inst_Mikroblaze: Mikroblaze PORT MAP(
--		fpga_0_DDR2_SDRAM_DDR2_Clk_pin => fpga_0_DDR2_SDRAM_DDR2_Clk_pin,
--		fpga_0_DDR2_SDRAM_DDR2_Clk_n_pin =>fpga_0_DDR2_SDRAM_DDR2_Clk_n_pin, 
--		fpga_0_DDR2_SDRAM_DDR2_CE_pin => fpga_0_DDR2_SDRAM_DDR2_CE_pin,
--		fpga_0_DDR2_SDRAM_DDR2_CS_n_pin => fpga_0_DDR2_SDRAM_DDR2_CS_n_pin,
--		fpga_0_DDR2_SDRAM_DDR2_ODT_pin => fpga_0_DDR2_SDRAM_DDR2_ODT_pin,
--		fpga_0_DDR2_SDRAM_DDR2_RAS_n_pin => fpga_0_DDR2_SDRAM_DDR2_RAS_n_pin,
--		fpga_0_DDR2_SDRAM_DDR2_CAS_n_pin => fpga_0_DDR2_SDRAM_DDR2_CAS_n_pin,
--		fpga_0_DDR2_SDRAM_DDR2_WE_n_pin => fpga_0_DDR2_SDRAM_DDR2_WE_n_pin,
--		fpga_0_DDR2_SDRAM_DDR2_BankAddr_pin => fpga_0_DDR2_SDRAM_DDR2_BankAddr_pin,
--		fpga_0_DDR2_SDRAM_DDR2_Addr_pin => fpga_0_DDR2_SDRAM_DDR2_Addr_pin,
--		fpga_0_DDR2_SDRAM_DDR2_DQ_pin => fpga_0_DDR2_SDRAM_DDR2_DQ_pin,
--		fpga_0_DDR2_SDRAM_DDR2_DM_pin => fpga_0_DDR2_SDRAM_DDR2_DM_pin,
--		fpga_0_DDR2_SDRAM_DDR2_DQS_pin => fpga_0_DDR2_SDRAM_DDR2_DQS_pin,
--		fpga_0_DDR2_SDRAM_DDR2_DQS_n_pin => fpga_0_DDR2_SDRAM_DDR2_DQS_n_pin,
--		fpga_0_clk_1_sys_clk_pin => fpga_0_clk_1_sys_clk_pin,
--		fpga_0_rst_1_sys_rst_pin => NOT Push_Buttons_5Bit_GPIO_IO_I_pin(4),
--		gpio_FIFO_in => gpio_fifo_in,
--		gpio_FIFO_out => read_enable,
--		Push_Buttons_5Bit_GPIO_IO_I_pin => Push_Buttons_5Bit_GPIO_IO_I_pin,
--		DIP_Switches_8Bit_GPIO_IO_I_pin => DIP_Switches_8Bit_GPIO_IO_I_pin,
--		LEDs_8Bit_O => LEDs_8Bit_GPIO_IO_O_pin,
--		LEDs_Positions_GPIO_IO_O_pin => LEDs_Positions_GPIO_IO_O_pin 
--	);
	
	Inst_FIFO_Asynch: FIFO_asynch_tl PORT MAP (
		 rst_i => buttons_i(4),
		 wr_clk_i => fpga_0_clk_1_sys_clk_pin,
		 rd_clk_i => fpga_0_clk_1_sys_clk_pin,
		 din_i => switches_i,
		 wr_en_i => buttons_i(0),
		 rd_en_i => read_enable,
		 dout_o => fifo_data,
		 full_o => fifo_full,
		 empty_o => fifo_empty,
		 valid_o => open,
		 underflow_o => open,
		 rd_data_count_o => open,
		 wr_data_count_o => open
	);

end Behavioral;

