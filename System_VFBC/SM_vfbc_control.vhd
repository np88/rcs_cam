----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:14:57 08/16/2012 
-- Design Name: 
-- Module Name:    SM_vfbc_control - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: VFBC Control based on LogiCORE IP Multi-Port Memory Controller (MPMC) (v6.03.a), p 177 ff
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SM_vfbc_control is
    Port ( clk_i : in  STD_LOGIC;
           rst_i : in  STD_LOGIC;
           vsync_i : in  STD_LOGIC;
           start_transaction_i : in  STD_LOGIC;
			  DDR2_SDRAM_VFBC2_Wd_Reset_pin_o : out  STD_LOGIC;
           DDR2_SDRAM_VFBC2_Cmd_Reset_pin_o : out  STD_LOGIC;
			  DDR2_SDRAM_VFBC2_Cmd_Data_pin_o : out std_logic_vector(31 downto 0);
			  DDR2_SDRAM_VFBC2_Cmd_Write_pin_o : out  STD_LOGIC;
			  write_enable_o : out  STD_LOGIC;
			  transfer_done_o : out  STD_LOGIC);
end SM_vfbc_control;

architecture Behavioral of SM_vfbc_control is

	COMPONENT edge_detector
	PORT(
		clk_i : IN std_logic;
		rst_i : IN std_logic;
		signal_i : IN std_logic;          
		edge_o : OUT std_logic
		);
	END COMPONENT;

	type STATE_WRITE_TRANS is (
		WT_INIT,
		WT_RESET_VFBC,
		WT_RESET_SECOND_CYCLE,
		-- dirty quick fix to wait 6 cycles
		WT_WAIT1,
		WT_WAIT2,
		WT_WAIT3,
		WT_WAIT4,
		WT_WAIT5,
		WT_WAIT6,
		WT_WRITE_Word_1,
		WT_WRITE_Word_2,
		WT_WRITE_Word_3,
		WT_WRITE_Word_4,
		WT_WAIT_FOR_VSYNC,
		WT_WRITE_ENABLE,
		WT_WRITE_DISBALE
	);

	signal current_state, next_state: STATE_WRITE_TRANS;
	signal vsync_i_clock_edge: std_logic;
begin

	-- edge detector for vsync signal
	Inst_edge_detector: edge_detector PORT MAP(
		clk_i => clk_i,
		rst_i => rst_i,
		signal_i => vsync_i,
		edge_o => vsync_i_clock_edge
	);


	VFBC_Store: process (clk_i, rst_i)
	begin
		if (rst_i = '1') then
			-- no writing in process
			current_state <= WT_Init;		
		elsif (clk_i'event and clk_i = '1') then
			current_state <= next_state;
		end if;	
	end process VFBC_Store;
	
	VFBC_Control: process (rst_i, start_transaction_i, vsync_i_clock_edge, current_state)
	begin
		-- default instruction
		if (rst_i = '1') then
			next_state <= WT_Init;
		else
			next_state <= current_state;
		
			case current_state is
				when WT_Init =>
					if (start_transaction_i = '1') then
						next_state <= WT_RESET_VFBC;
					end if;
				when WT_RESET_VFBC =>
					next_state <= WT_RESET_SECOND_CYCLE;
				when WT_RESET_SECOND_CYCLE =>
					next_state <= WT_WAIT1;
				when WT_WAIT1 =>
					next_state <= WT_WAIT2;
				when WT_WAIT2 =>
					next_state <= WT_WAIT3;				
				when WT_WAIT3 =>
					next_state <= WT_WAIT4;
				when WT_WAIT4 =>
					next_state <= WT_WAIT5;
				when WT_WAIT5 =>
					next_state <= WT_WAIT6;
				when WT_WAIT6 =>
					next_state <= WT_WRITE_Word_1;			
				when WT_WRITE_Word_1 =>
					next_state <= WT_WRITE_Word_2;
				when WT_WRITE_Word_2 =>
					next_state <= WT_WRITE_Word_3;
				when WT_WRITE_Word_3 =>
					next_state <= WT_WRITE_Word_4;
				when WT_WRITE_Word_4 =>
					next_state <= WT_WAIT_FOR_VSYNC;
				when WT_WAIT_FOR_VSYNC =>
					if (vsync_i_clock_edge = '1') then 
						next_state <= WT_WRITE_ENABLE;
					end if;
				when WT_WRITE_ENABLE =>
					if (vsync_i_clock_edge = '1') then 
						next_state <= WT_WRITE_DISBALE;
					end if;		
				when WT_WRITE_DISBALE =>
					if (start_transaction_i = '1') then
						next_state <= WT_Init;
					end if;
				when others =>
					next_state <= WT_Init;
			end case;
		end if;
	end process VFBC_Control;
	
	VFBC_Output: process (current_state)
	begin
	
		DDR2_SDRAM_VFBC2_Cmd_Reset_pin_o <= '0';
		DDR2_SDRAM_VFBC2_Cmd_Data_pin_o <= (others => '0');
		DDR2_SDRAM_VFBC2_Cmd_Write_pin_o <= '0';
		DDR2_SDRAM_VFBC2_Wd_Reset_pin_o <= '0';
		write_enable_o <= '0';
		transfer_done_o <= '0';
		
		case current_state is		
			when WT_Init =>
			when WT_RESET_VFBC =>
				DDR2_SDRAM_VFBC2_Cmd_Reset_pin_o <= '1';
				DDR2_SDRAM_VFBC2_Wd_Reset_pin_o <= '1';
			when WT_RESET_SECOND_CYCLE =>
				DDR2_SDRAM_VFBC2_Cmd_Reset_pin_o <= '1';
				DDR2_SDRAM_VFBC2_Wd_Reset_pin_o <= '1';
			when WT_WAIT1 =>
			when WT_WAIT2 =>
			when WT_WAIT3 =>
			when WT_WAIT4 =>
			when WT_WAIT5 =>
			when WT_WAIT6 =>
			when WT_WRITE_Word_1 =>
				-- write x size in bytes
				DDR2_SDRAM_VFBC2_Cmd_Data_pin_o <= std_logic_vector( to_unsigned (1280, 32) );
				--DDR2_SDRAM_VFBC2_Cmd_Data_pin_o <= "00000000000000000000001010000000";
				--DDR2_SDRAM_VFBC2_Cmd_Data_pin_o <= std_logic_vector( to_unsigned (32, 32) );
				DDR2_SDRAM_VFBC2_Cmd_Write_pin_o <= '1';
			when WT_WRITE_Word_2 =>
				-- bit 31: 1 means write command; 30-0: start address 
				DDR2_SDRAM_VFBC2_Cmd_Data_pin_o(31) <= '1';
				-- DDR2_SDRAM_VFBC2_Cmd_Data_pin_o(0) <= '0';
				DDR2_SDRAM_VFBC2_Cmd_Data_pin_o(30 downto 0) <= (others => '0');
				DDR2_SDRAM_VFBC2_Cmd_Write_pin_o <= '1';
			when WT_WRITE_Word_3 =>
				-- write number of lines
				DDR2_SDRAM_VFBC2_Cmd_Data_pin_o <= std_logic_vector( to_unsigned (479, 32) );
				--DDR2_SDRAM_VFBC2_Cmd_Data_pin_o <= "00000000000000000000000111100000";
				--DDR2_SDRAM_VFBC2_Cmd_Data_pin_o <= std_logic_vector( to_unsigned (511, 32) );
				DDR2_SDRAM_VFBC2_Cmd_Write_pin_o <= '1';
			when WT_WRITE_Word_4 =>
				-- write stride
				DDR2_SDRAM_VFBC2_Cmd_Data_pin_o <= std_logic_vector( to_unsigned (1280, 32) );
				--DDR2_SDRAM_VFBC2_Cmd_Data_pin_o <= "00000000000000000000010100000000";
				--DDR2_SDRAM_VFBC2_Cmd_Data_pin_o <= std_logic_vector( to_unsigned (640, 32) );
				DDR2_SDRAM_VFBC2_Cmd_Write_pin_o <= '1';
			when WT_WAIT_FOR_VSYNC =>
			when WT_WRITE_ENABLE =>
				write_enable_o	<= '1';
			when WT_WRITE_DISBALE =>
				transfer_done_o <= '1';
			when others =>
		end case;
	end process VFBC_Output;

end Behavioral;

