----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:28:29 08/01/2012 
-- Design Name: 
-- Module Name:    FIFO_asynch_tl - Behavioral 
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

entity FIFO_asynch_tl is PORT (
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


end FIFO_asynch_tl;

architecture Behavioral of FIFO_asynch_tl is

	-- FIFO with 2 clock domains
	COMPONENT fifo_two_clock_domains
	  PORT (
		 rst : IN STD_LOGIC;
		 wr_clk : IN STD_LOGIC;
		 rd_clk : IN STD_LOGIC;
		 din : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 wr_en : IN STD_LOGIC;
		 rd_en : IN STD_LOGIC;
		 dout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 full : OUT STD_LOGIC;
		 empty : OUT STD_LOGIC;
		 valid : OUT STD_LOGIC;
		 underflow : OUT STD_LOGIC;
		 rd_data_count : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 wr_data_count : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
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

	fifo_asynch : fifo_two_clock_domains 
		PORT MAP (
			 rst => rst_i,
			 wr_clk => wr_clk_i,
			 rd_clk => rd_clk_i,
			 din => din_i,
			 wr_en => write_enable_edge,
			 rd_en => read_enable_edge,
			 dout => dout_o,
			 full => full_o,
			 empty => empty_o,
			 valid => valid_o,
			 underflow => underflow_o,
			 rd_data_count => rd_data_count_o,
			 wr_data_count => wr_data_count_o
		);

	rd_en_edge_detector: edge_detector PORT MAP (
		clk_i => rd_clk_i,
		rst_i => rst_i,
      signal_i => rd_en_i,
      edge_o => read_enable_edge
	);

	wr_en_edge_detector: edge_detector PORT MAP (
		clk_i => wr_clk_i,
		rst_i => rst_i,
      signal_i => wr_en_i,
      edge_o => write_enable_edge
	);	
	
end Behavioral;

