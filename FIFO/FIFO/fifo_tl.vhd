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
    clk : IN STD_LOGIC; --- mapped to user clock (FPGA reference X1)
    rst : IN STD_LOGIC; -- mapped to C (center button)
    din : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- mapped to expansion headers
    wr_en : IN STD_LOGIC; -- mapped to SW 10 (upper button)
    rd_en : IN STD_LOGIC; -- mapped to SW 11 (lower button)
    dout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- mapped to gpio LEDs
    full : OUT STD_LOGIC; -- error LED
    empty : OUT STD_LOGIC; -- error LED
    underflow : OUT STD_LOGIC; -- not mapped
    data_count : OUT STD_LOGIC_VECTOR(15 DOWNTO 0) -- not mapped
  );
end fifo_tl;

architecture Behavioral of fifo_tl is
-- fifo component
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
    data_count : OUT STD_LOGIC_VECTOR(15 DOWNTO 0) 
  );
END COMPONENT;


begin
fifo: fifo_one_clock_domain PORT MAP (
    clk => clk,
    rst => rst,
    din => din,
    wr_en => wr_en,
    rd_en => rd_en,
    dout => dout,
    full => full,
    empty => empty,
    underflow => underflow,
    data_count => data_count
  );

end Behavioral;

