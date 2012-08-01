----------------------------------------------------------------------------------
-- Company: TUM - RCS
-- Engineer: Nadja Peters
-- 
-- Create Date:    17:21:59 07/31/2012 
-- Design Name: 
-- Module Name:    fifo_tl - Behavioral 
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

entity fifo_tl is PORT (
    clk_i : IN STD_LOGIC; --- mapped to user clock (FPGA reference X1)
    rst_i : IN STD_LOGIC; -- mapped to C (center button)
    din_i : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- mapped to expansion headers
    wr_en_i : IN STD_LOGIC; -- mapped to SW 10 (upper button)
    rd_en_i : IN STD_LOGIC; -- mapped to SW 11 (lower button)
    dout_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- mapped to gpio LEDs
    full_o : OUT STD_LOGIC; -- error LED
    empty_o : OUT STD_LOGIC; -- error LED
    underflow_o : OUT STD_LOGIC; -- not mapped
    valid_o : OUT STD_LOGIC; -- not mapped
	 data_count_o : OUT STD_LOGIC_VECTOR(9 DOWNTO 0) -- not mapped
  );
end fifo_tl;

architecture Behavioral of fifo_tl is
-- fifo component

constant data_out_width: integer := 16;

COMPONENT fifo_one_clock_domain
  PORT (
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC; 
    din : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
    wr_en : IN STD_LOGIC; 
    rd_en : IN STD_LOGIC; 
    dout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    full : OUT STD_LOGIC; 
    empty : OUT STD_LOGIC;
    underflow : OUT STD_LOGIC;
	 valid: OUT  std_logic;
    data_count : OUT STD_LOGIC_VECTOR(data_out_width-1 DOWNTO 0) 
  );
END COMPONENT;

-- edge detector
COMPONENT edge_detector is
    Port ( clk_i : in  STD_LOGIC;
			  rst_i : in  STD_LOGIC;
           signal_i : in  STD_LOGIC;
           edge_o : out  STD_LOGIC);
END COMPONENT;

signal read_enable_edge, write_enable_edge: STD_LOGIC;

begin

	fifo: fifo_one_clock_domain PORT MAP (
		 clk => clk_i,
		 rst => rst_i,
		 din => din_i,
		 wr_en => write_enable_edge,
		 rd_en => read_enable_edge,
		 dout => dout_o,
		 full => full_o,
		 empty => empty_o,
		 underflow => underflow_o,
		 valid => valid_o,
		 data_count => data_count_o
	);
  
	rd_en_edge_detector: edge_detector PORT MAP (
		clk_i => clk_i,
		rst_i => rst_i,
      signal_i => rd_en_i,
      edge_o => read_enable_edge
	);

	wr_en_edge_detector: edge_detector PORT MAP (
		clk_i => clk_i,
		rst_i => rst_i,
      signal_i => wr_en_i,
      edge_o => write_enable_edge
	);	

end Behavioral;

