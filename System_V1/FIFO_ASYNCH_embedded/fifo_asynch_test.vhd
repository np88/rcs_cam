--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:44:23 08/01/2012
-- Design Name:   
-- Module Name:   /DIST/home/peters/cam_repo/FIFO/FIFO_ASYNCH/fifo_asynch_test.vhd
-- Project Name:  FIFO_ASYNCH
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FIFO_asynch_tl
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
 
ENTITY fifo_asynch_test IS
END fifo_asynch_test;
 
ARCHITECTURE behavior OF fifo_asynch_test IS 

	 constant C_fifo_width		: integer := 3;
	 constant C_fifo_input_width		: integer := 15;
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FIFO_asynch_tl
    PORT(
         rst_i : IN  std_logic;
         wr_clk_i : IN  std_logic;
         rd_clk_i : IN  std_logic;
         din_i : IN  std_logic_vector(C_fifo_input_width downto 0);
         wr_en_i : IN  std_logic;
         rd_en_i : IN  std_logic;
         dout_o : OUT  std_logic_vector(C_fifo_input_width downto 0);
         full_o : OUT  std_logic;
         empty_o : OUT  std_logic;
         valid_o : OUT  std_logic;
         underflow_o : OUT  std_logic;
         rd_data_count_o : OUT  std_logic_vector(C_fifo_width downto 0);
         wr_data_count_o : OUT  std_logic_vector(C_fifo_width downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst_i : std_logic := '0';
   signal wr_clk_i : std_logic := '0';
   signal rd_clk_i : std_logic := '0';
   signal din_i : std_logic_vector(C_fifo_input_width downto 0) := (others => '0');
   signal wr_en_i : std_logic := '0';
   signal rd_en_i : std_logic := '0';

 	--Outputs
   signal dout_o : std_logic_vector(C_fifo_input_width downto 0);
   signal full_o : std_logic;
   signal empty_o : std_logic;
   signal valid_o : std_logic;
   signal underflow_o : std_logic;
   signal rd_data_count_o : std_logic_vector(C_fifo_width downto 0);
   signal wr_data_count_o : std_logic_vector(C_fifo_width downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clock_period_wr : time := 10 ns;
   constant clock_period_rd : time := 20 ns;
	
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FIFO_asynch_tl PORT MAP (
          rst_i => rst_i,
          wr_clk_i => wr_clk_i,
          rd_clk_i => rd_clk_i,
          din_i => din_i,
          wr_en_i => wr_en_i,
          rd_en_i => rd_en_i,
          dout_o => dout_o,
          full_o => full_o,
          empty_o => empty_o,
          valid_o => valid_o,
          underflow_o => underflow_o,
          rd_data_count_o => rd_data_count_o,
          wr_data_count_o => wr_data_count_o
        );

   -- Clock process definitions
   clock_process_rd :process
   begin
		rd_clk_i  <= '0';
		wait for clock_period_rd/2;
		rd_clk_i  <= '1';
		wait for clock_period_rd/2;
   end process;
	
	clock_process_wr :process
   begin
		wr_clk_i  <= '0';
		wait for clock_period_wr/2;
		wr_clk_i  <= '1';
		wait for clock_period_wr/2;
   end process;
	
	write_enable: process
   begin
		wait for clock_period_wr*15;
		loop
			wr_en_i <= '0';
			wait for clock_period_wr*5;
			wr_en_i <= '1';
			wait for clock_period_wr*5;
		end loop;
   end process;	
	
   read_enable: process
   begin
		wait for clock_period_rd*50;
		loop
			rd_en_i <= '0';
			wait for clock_period_rd*5;
			rd_en_i <= '1';
			wait for clock_period_rd*5;
		end loop;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clock_period_rd*10;
		
		loop
			wait for clock_period_rd*5;
			din_i <= STD_LOGIC_VECTOR(unsigned(din_i) + 1);
		end loop;
      -- insert stimulus here 

      wait;
   end process;

END;
