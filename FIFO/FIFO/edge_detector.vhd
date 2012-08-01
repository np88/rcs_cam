----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:39:01 08/01/2012 
-- Design Name: 
-- Module Name:    edge_detector - Behavioral 
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

entity edge_detector is
    Port ( clk_i : in  STD_LOGIC;
			  rst_i : in  STD_LOGIC;
           signal_i : in  STD_LOGIC;
           edge_o : out  STD_LOGIC);
end edge_detector;

architecture Behavioral of edge_detector is
	signal signal_buffer: STD_LOGIC;
begin
	if (rst_i = '1') then
		edge_o = '0';
		signal_buffer = '0';
	else
		if (clk_i'event and clk_i = '1') then
			
		end if;
	end if;

end Behavioral;

