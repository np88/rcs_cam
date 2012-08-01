--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:07:18 08/01/2012
-- Design Name:   
-- Module Name:   /DIST/home/peters/cam_repo/FIFO/FIFO/edge_detector_test.vhd
-- Project Name:  FIFO
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: edge_detector
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
--USE ieee.numeric_std.ALL;
 
ENTITY edge_detector_test IS
END edge_detector_test;
 
ARCHITECTURE behavior OF edge_detector_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT edge_detector
    PORT(
         clk_i : IN  std_logic;
         rst_i : IN  std_logic;
         signal_i : IN  std_logic;
         edge_o : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';
   signal rst_i : std_logic := '0';
   signal signal_i : std_logic := '0';

 	--Outputs
   signal edge_o : std_logic;

   -- Clock period definitions
   constant clk_i_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: edge_detector PORT MAP (
          clk_i => clk_i,
          rst_i => rst_i,
          signal_i => signal_i,
          edge_o => edge_o
        );

   -- Clock process definitions
   clk_i_process :process
   begin
		clk_i <= '0';
		wait for clk_i_period/2;
		clk_i <= '1';
		wait for clk_i_period/2;
   end process;
 
 
   signal_process :process
   begin
		signal_i <= '0';
		wait for clk_i_period*5;
		signal_i <= '1';
		wait for clk_i_period*5;
   end process;

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		rst_i <= '1';
      wait for clk_i_period*10;	
		rst_i <= '0';
		
      wait for clk_i_period*10;

      wait;
   end process;

END;
