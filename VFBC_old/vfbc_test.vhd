--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:00:07 08/17/2012
-- Design Name:   
-- Module Name:   /DIST/home/peters/cam_repo/System_VFBC/vfbc_test.vhd
-- Project Name:  System_VFBC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SM_vfbc_control
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
 
ENTITY vfbc_test IS
END vfbc_test;
 
ARCHITECTURE behavior OF vfbc_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SM_vfbc_control
    PORT(
         clk_i : IN  std_logic;
         rst_i : IN  std_logic;
         vsync_i : IN  std_logic;
         start_transaction_i : IN  std_logic;
         DDR2_SDRAM_VFBC2_Wd_Reset_pin_o : OUT  std_logic;
         DDR2_SDRAM_VFBC2_Cmd_Reset_pin_o : OUT  std_logic;
         DDR2_SDRAM_VFBC2_Cmd_Data_pin_o : OUT  std_logic_vector(31 downto 0);
         DDR2_SDRAM_VFBC2_Cmd_Write_pin_o : OUT  std_logic;
         write_enable_o : OUT  std_logic;
         transfer_done_o : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';
   signal rst_i : std_logic := '0';
   signal vsync_i : std_logic := '0';
   signal start_transaction_i : std_logic := '0';

 	--Outputs
   signal DDR2_SDRAM_VFBC2_Wd_Reset_pin_o : std_logic;
   signal DDR2_SDRAM_VFBC2_Cmd_Reset_pin_o : std_logic;
   signal DDR2_SDRAM_VFBC2_Cmd_Data_pin_o : std_logic_vector(31 downto 0);
   signal DDR2_SDRAM_VFBC2_Cmd_Write_pin_o : std_logic;
   signal write_enable_o : std_logic;
   signal transfer_done_o : std_logic;

   -- Clock period definitions
   constant clk_i_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SM_vfbc_control PORT MAP (
          clk_i => clk_i,
          rst_i => rst_i,
          vsync_i => vsync_i,
          start_transaction_i => start_transaction_i,
          DDR2_SDRAM_VFBC2_Wd_Reset_pin_o => DDR2_SDRAM_VFBC2_Wd_Reset_pin_o,
          DDR2_SDRAM_VFBC2_Cmd_Reset_pin_o => DDR2_SDRAM_VFBC2_Cmd_Reset_pin_o,
          DDR2_SDRAM_VFBC2_Cmd_Data_pin_o => DDR2_SDRAM_VFBC2_Cmd_Data_pin_o,
          DDR2_SDRAM_VFBC2_Cmd_Write_pin_o => DDR2_SDRAM_VFBC2_Cmd_Write_pin_o,
          write_enable_o => write_enable_o,
          transfer_done_o => transfer_done_o
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
      rst_i <= '1';
		wait for 100 ns;	
		rst_i <= '0';
		start_transaction_i <= '1';
      wait for clk_i_period*15;
		start_transaction_i <= '0';
		vsync_i <= '1';
      wait for clk_i_period*25;
		vsync_i <= '0';
		wait for clk_i_period*25;
		vsync_i <= '1';
      wait for clk_i_period*25;
		vsync_i <= '0';
      wait;
   end process;

END;
