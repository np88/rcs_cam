----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:25:07 08/15/2012 
-- Design Name: 
-- Module Name:    enable_fifo_wr - Behavioral 
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

entity enable_fifo_wr is
    Port ( rst_i : in  STD_LOGIC;
           vsync_i : in  STD_LOGIC;
			  enable_writing_i : in  STD_LOGIC;
           clk_i : in  STD_LOGIC;
           fifo_wr_en_o : out  STD_LOGIC
	 );
end enable_fifo_wr;

architecture Behavioral of enable_fifo_wr is
	component edge_detector is
		 Port ( clk_i : in  STD_LOGIC;
				  rst_i : in  STD_LOGIC;
				  signal_i : in  STD_LOGIC;
				  edge_o : out  STD_LOGIC);
	end component;
	
	signal vsync_one_cycle: std_logic;
	
begin	

	Inst_edge_detector_vsync: edge_detector PORT MAP (
		clk_i => clk_i,
		rst_i => rst_i,
      signal_i => vsync_i,
      edge_o => vsync_one_cycle
	);
	

	set_fifo_o: process (rst_i, clk_i)
	begin
		if (rst_i = '1') then
			fifo_wr_en_o <= '0';
		else
		
			if (clk_i'event and clk_i = '1') then
				if (vsync_one_cycle = '1') then
					if (enable_writing_i = '1') then
						fifo_wr_en_o <= '1';
					else
						fifo_wr_en_o <= '0';
					end if;
				end if;
			end if;
		end if;
	end process;
end Behavioral;

