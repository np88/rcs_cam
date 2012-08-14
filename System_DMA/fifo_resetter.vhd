----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:01:17 08/14/2012 
-- Design Name: 
-- Module Name:    fifo_resetter - Behavioral 
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

-- module to reset fifo data every time a new picture can be read
-- edge_detector for v_sync signal


entity fifo_resetter is
    Port ( clk_i : in  STD_LOGIC;
           rst_i : in  STD_LOGIC;
           reset_en_i : in  STD_LOGIC;
           reset_fifo_o : out  STD_LOGIC);
end fifo_resetter;

architecture Behavioral of fifo_resetter is
	component edge_detector is
		 Port ( clk_i : in  STD_LOGIC;
				  rst_i : in  STD_LOGIC;
				  signal_i : in  STD_LOGIC;
				  edge_o : out  STD_LOGIC);
	end component;
	
	signal one_clock_cycle_reset: std_logic;

begin

	Inst_edge_detector: edge_detector PORT MAP (
		clk_i => clk_i,
		rst_i => rst_i,
      signal_i => reset_en_i,
      edge_o => reset_fifo_o
	);




end Behavioral;
