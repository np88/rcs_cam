--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:02:26 08/01/2012
-- Design Name:   
-- Module Name:   /DIST/home/peters/cam_repo/FIFO/FIFO/fifo_tl_test.vhd
-- Project Name:  FIFO
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fifo_tl
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY fifo_tl_test IS
END fifo_tl_test;
 
ARCHITECTURE behavior OF fifo_tl_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
	 constant data_out_width: integer := 16;
    
	 COMPONENT fifo_tl
    PORT(
         clk_i : IN  std_logic;
         rst_i : IN  std_logic;
         din_i : IN  std_logic_vector(7 downto 0);
         wr_en_i : IN  std_logic;
         rd_en_i : IN  std_logic;
         dout_o : OUT  std_logic_vector(7 downto 0);
         full_o : OUT  std_logic;
         empty_o : OUT  std_logic;
         underflow_o : OUT  std_logic;
			valid_o : OUT  std_logic;
         data_count_o : OUT  std_logic_vector(data_out_width-1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';
   signal rst_i : std_logic := '0';
   signal din_i : std_logic_vector(7 downto 0) := (others => '0');
   signal wr_en_i : std_logic := '0';
   signal rd_en_i : std_logic := '0';

 	--Outputs
   signal dout_o : std_logic_vector(7 downto 0);
   signal full_o : std_logic;
   signal empty_o : std_logic;
   signal underflow_o : std_logic;
	signal valid_o : std_logic;
   signal data_count_o : std_logic_vector(data_out_width-1 downto 0);

   -- Clock period definitions
   constant clk_i_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fifo_tl PORT MAP (
          clk_i => clk_i,
          rst_i => rst_i,
          din_i => din_i,
          wr_en_i => wr_en_i,
          rd_en_i => rd_en_i,
          dout_o => dout_o,
          full_o => full_o,
          empty_o => empty_o,
          underflow_o => underflow_o,
			 valid_o => valid_o, 
          data_count_o => data_count_o
        );

   -- Clock process definitions
   clk_i_process :process
   begin
		clk_i <= '0';
		wait for clk_i_period/2;
		clk_i <= '1';
		wait for clk_i_period/2;
   end process;
	
   -- Clock process definitions
   write_enable: process
   begin
		wait for clk_i_period*15;
		loop
			wr_en_i <= '0';
			wait for clk_i_period*5;
			wr_en_i <= '1';
			wait for clk_i_period*5;
		end loop;
   end process;	
	
   read_enable: process
   begin
		wait for clk_i_period*50;
		loop
			rd_en_i <= '0';
			wait for clk_i_period*5;
			rd_en_i <= '1';
			wait for clk_i_period*5;
		end loop;
   end process;		
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      rst_i <= '1';
		wait for clk_i_period*10;	
		rst_i <= '0';
		din_i <= "01010101";
		wait for clk_i_period*10;
		loop
			wait for clk_i_period*10;
			din_i <= STD_LOGIC_VECTOR(unsigned(din_i) + 1);
		end loop;
   end process;

END;
