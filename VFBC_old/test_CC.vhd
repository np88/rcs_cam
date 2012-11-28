--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:16:51 11/26/2012
-- Design Name:   
-- Module Name:   /DIST/home/peters/nadja_cam_repo/VFBC_old/test_CC.vhd
-- Project Name:  System_VFBC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cam_control
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
 
ENTITY test_CC IS
END test_CC;
 
ARCHITECTURE behavior OF test_CC IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cam_control
    PORT(
         clk_i : IN  std_logic;
         rst_i : IN  std_logic;
         start_transfer_i : IN  std_logic;
			idle_state_o : out STD_LOGIC;
			data_read_o : out STD_LOGIC_VECTOR;			
         cam_i2c_scl_io : INOUT  std_logic;
         cam_i2c_sda_io : INOUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';
   signal rst_i : std_logic := '0';
   signal start_transfer_i : std_logic := '0';
	signal idle_state_o : STD_LOGIC;
	signal data_read_o : STD_LOGIC_VECTOR(7 downto 0);
	--BiDirs
   signal cam_i2c_scl_io : std_logic := 'H';
   signal cam_i2c_sda_io : std_logic := 'H';

   -- Clock period definitions
   constant clk_i_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cam_control PORT MAP (
          clk_i => clk_i,
          rst_i => rst_i,
			 data_read_o => data_read_o,
			 idle_state_o => idle_state_o,
          start_transfer_i => start_transfer_i,
          cam_i2c_scl_io => cam_i2c_scl_io,
          cam_i2c_sda_io => cam_i2c_sda_io
        );

   -- Clock process definitions
   clk_i_process :process
   begin
		clk_i <= '0';
		wait for clk_i_period/2;
		clk_i <= '1';
		wait for clk_i_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		rst_i <= '0';
      wait for 100 ns;	
		rst_i <= '1';
      wait for clk_i_period*10;
		
		start_transfer_i <= '1';
		wait for clk_i_period*5;
		start_transfer_i <= '0';
      

      wait;
   end process;
	
	cam_i2c_sda_io <= 'H';
	cam_i2c_scl_io <= 'H';

END;
