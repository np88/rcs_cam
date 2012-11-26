----------------------------------------------------------------------------------
-- Name:	Nils Heitmann
-- 
-- Create Date:    12:25:09 09/24/2012 
-- Design Name: 
-- Module Name:    i2c - i2c_arch 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity i2cmaster is
	generic(
		i2c_cycles : natural := 252 --determines the i2c frequency: f_i2c = f_clk/i2c_cycles
	);
    Port ( 
		clk : in  STD_LOGIC;
		reset : in  STD_LOGIC;
	 
		--low level bus connections
		i2c_scl_out : out  STD_LOGIC; 		--i2c scl out
		i2c_scl_in : in  STD_LOGIC; 			--i2c scl in
		i2c_sda_out : out  STD_LOGIC;			--i2c sda output
		i2c_sda_in  : in  STD_LOGIC;			--i2c sda input
		
		--data-interface
		ready_out : out STD_LOGIC;	--i2c master is ready for the next tranfer
		start_in : in  STD_LOGIC;	--start a transfer an the i2c master: '1' and not busy -> start
		dir_in : in STD_LOGIC; 		--read/write to i2c: '1' -> write, '0' -> read
		start_condition_in : in STD_LOGIC;	--generate a start conditon before the next byte
		stop_condition_in : in STD_LOGIC;	--generate a stop conditon after the next byte
		data_write_in : in  STD_LOGIC_VECTOR (7 downto 0); --the data for write mode (dir='1')
		data_write_ack_out : out  STD_LOGIC;		--did the slave send a ack after writing: '1' -> ack

		data_read_out : out  STD_LOGIC_VECTOR (7 downto 0); --the data from read mode (dir='0')
		data_read_ack_in: in STD_LOGIC --should the master send ack after reading a byte
		);
end i2cmaster;

architecture i2cmaster_arch of i2cmaster is

type z_type is (	--type for state machine states
	z_init,						--after reset
	z_waiting,					--ready for new input
	z_start_condition_1,		--issue start condition on i2c bus
	z_start_condition_2,		
	z_start_condition_3,		
	z_start_condition_4,	
	z_data_setup,				--setup data on i2c bus, scl low
	z_data_stretch,			--wait for clk stretching of i2c slave
	z_data_hold,				--hold data on i2c bus, scl high
	z_data_wait,				--hold time after falling scl edge
	z_stop_condition_1,		--issue stop condition
	z_stop_condition_2,		
	z_stop_condition_3
	);
	
signal z, zplus : z_type;	--statemachine
signal last_transfer_stopped, last_transfer_stopped_next : boolean; --did the last transferred byte end with a stop condition
signal stop_condition, stop_condition_next: boolean; --should the next byte end with a stop condition
signal read_ack, read_ack_next: boolean; --should an ack be sent after reading from the slave
signal write_ack, write_ack_next: boolean; --was the last written byte terminated with a ack from the slave
signal data_dir, data_dir_next: boolean; --which direction should the next transfer go: true -> write

signal bit_cntr, bit_cntr_next: natural range 8 downto 0;	--counter register for shift register
signal bus_delay_cntr, bus_delay_cntr_next: natural range i2c_cycles/2 downto 0;	--counter for i2c bus timing
signal data_read, data_read_next : STD_LOGIC_VECTOR (7 downto 0);	--data register for reading
signal data_write, data_write_next : STD_LOGIC_VECTOR (7 downto 0);	--data register for writing



begin
P_TRANSITION: process(clk)
	begin
		if clk'event and clk = '1' then
			if reset = '1' then
				--reset values
				z<=z_waiting;
				last_transfer_stopped<=true;
				stop_condition<=false;
				data_dir <= false;
				write_ack<=false;
				read_ack<=false;
				bit_cntr<=0;
				bus_delay_cntr<=0;
				data_read<= (others => '0');
				data_write<= (others => '0');
			else
				--transitions on rising clk edge
				z<=zplus;
				last_transfer_stopped <= last_transfer_stopped_next;
				stop_condition<=stop_condition_next;
				data_dir <= data_dir_next;
				write_ack<=write_ack_next;
				read_ack<=read_ack_next;
				bit_cntr<=bit_cntr_next;
				bus_delay_cntr<=bus_delay_cntr_next;
				data_read<= data_read_next;
				data_write<= data_write_next;
			end if;
		end if;
	end process;

P_NEXT: process(z, last_transfer_stopped, stop_condition, data_dir, write_ack, read_ack, bit_cntr, bus_delay_cntr, data_write, data_read, bus_delay_cntr, start_in, dir_in, start_condition_in, stop_condition_in, i2c_scl_in, i2c_sda_in, data_read_ack_in, data_write_in)
	variable bus_delay_cntr_rdy : boolean;
	variable bus_delay_cntr_set : boolean;
	begin

		--default: do nothing
		zplus<=z;
		last_transfer_stopped_next <= last_transfer_stopped;
		stop_condition_next<=stop_condition;
		data_dir_next <= data_dir;
		write_ack_next<=write_ack;
		read_ack_next<=read_ack;
		bit_cntr_next<=bit_cntr;
		bus_delay_cntr_next<=bus_delay_cntr;
		data_write_next <= data_write;
		data_read_next <= data_read;



		--bus cntr
		--using variables for easier code
		bus_delay_cntr_rdy := false;
		bus_delay_cntr_set := false;
		if bus_delay_cntr = 0 then
			bus_delay_cntr_next <= 0;
			bus_delay_cntr_rdy := true;
		else
			bus_delay_cntr_next <= bus_delay_cntr - 1;
		end if;
			
		--state dependent
		zplus <= z;
		case z is 
			when z_init => 	zplus <= z_waiting;
			when z_waiting => 			
				if start_in = '1' then 
					if dir_in = '1' then	--remember data dir
						data_dir_next<=true;
					else
						data_dir_next<=false;
					end if;
					
					bit_cntr_next <= 0; --reset bit cntr
					
					if stop_condition_in = '1' then	--remember if the byte transmission should end with a stop condition
						stop_condition_next<=true;
					else
						stop_condition_next<=false;
					end if;
					
					if data_read_ack_in = '1' then	--remember if the read should be acked by the master
						read_ack_next<=true;
					else
						read_ack_next<=false;
					end if;
					
					if start_condition_in = '1' then --should the transmission start with a start condition
						if last_transfer_stopped then
							zplus <= z_start_condition_3;
						else
							zplus <= z_start_condition_1;
						end if;
						
						bus_delay_cntr_set := true;
					else
						zplus <= z_data_setup;
						bus_delay_cntr_set := true;
					end if;
					
					data_write_next <= data_write_in; --remember the data
				
				end if;


			when z_start_condition_1 => 	
				if bus_delay_cntr_rdy then
					zplus <= z_start_condition_2;
					bus_delay_cntr_set := true;
				end if;

			when z_start_condition_2 => 	
				if bus_delay_cntr_rdy then
					zplus <= z_start_condition_3;
					bus_delay_cntr_set := true;
				end if;

			when z_start_condition_3 => 	
				if bus_delay_cntr_rdy then
					zplus <= z_start_condition_4;
					bus_delay_cntr_set := true;
				end if;

			when z_start_condition_4 => 
				if bus_delay_cntr_rdy then
					zplus <= z_data_setup;
					bus_delay_cntr_set := true;
				end if;
				
			when z_data_setup => --wait quarter a i2cclk period
				if bus_delay_cntr_rdy then
					zplus <= z_data_stretch;
				end if;
			
			when z_data_stretch => --wait for the slave to release the bus
				if i2c_scl_in = '1' then
					zplus <= z_data_hold;
					bus_delay_cntr_set := true;
				end if;
			
			when z_data_hold => 	--wait i2cclk period/2 
				if bus_delay_cntr_rdy then
					if bit_cntr = 8 then --have 9 bits been sent?
						if i2c_sda_in = '1' then --then is this the ack bit
							write_ack_next<=false;
						else
							write_ack_next<=true;
						end if;
					else --next bit
						data_read_next(7 - bit_cntr) <= i2c_sda_in; 
					end if;
					
					bus_delay_cntr_next <= i2c_cycles/4-1;
					zplus <= z_data_wait;
					
				end if;
			
			when z_data_wait => --wait quarter a i2cclk period
				if bus_delay_cntr_rdy then
					if bit_cntr = 8 then --have 9 bits been sent?
						if stop_condition then
							zplus <= z_stop_condition_1;
							last_transfer_stopped_next <= true;
							bus_delay_cntr_set := true;
						else
							zplus <= z_waiting;
							last_transfer_stopped_next <= false;
						end if;
					else
						bit_cntr_next <= bit_cntr+1;
						zplus <= z_data_setup;
						bus_delay_cntr_next <= i2c_cycles/4-1;
					end if;
				end if;
			
			when z_stop_condition_1 => 	
				if bus_delay_cntr_rdy then
					zplus <= z_stop_condition_2;
					bus_delay_cntr_set := true;
				end if;

			when z_stop_condition_2 => 	
				if bus_delay_cntr_rdy then
					zplus <= z_stop_condition_3;
					bus_delay_cntr_set := true;
				end if;

			when z_stop_condition_3 => 
				if bus_delay_cntr_rdy then
					zplus <= z_waiting;
				end if;
			when others => zplus <= z_init;
		end case;
		
		--set bus cntr if needed
		if bus_delay_cntr_set then
			bus_delay_cntr_next <= i2c_cycles/2-1;
		end if;
	end process;

P_OUT: process(z, write_ack, data_read, last_transfer_stopped, bit_cntr, data_dir)
	begin
			ready_out <= '0';
			data_write_ack_out <= '0';
			data_read_out <= (others => '0');
			
			case z is 
			when z_init =>
				i2c_scl_out <= '1';
				i2c_sda_out <= '1';
			when z_waiting => 	
				ready_out <= '1';
				if write_ack then
					data_write_ack_out <= '1';
				else
					data_write_ack_out <= '0';
				end if;
				
				data_read_out <= data_read;
				
				if last_transfer_stopped then
					i2c_scl_out <= '1';
					i2c_sda_out <= '1';				
				else
					i2c_scl_out <= '0';
					i2c_sda_out <= '0';						
				end if;
				
			when z_start_condition_1 => 	
				i2c_scl_out <= '0';
				i2c_sda_out <= '0';				

			when z_start_condition_2 => 	
				i2c_scl_out <= '0';
				i2c_sda_out <= '1';				

			when z_start_condition_3 => 
				i2c_scl_out <= '1';
				i2c_sda_out <= '1';				
			
			when z_start_condition_4 => 
				i2c_scl_out <= '1';
				i2c_sda_out <= '0';

			when z_data_setup | z_data_wait => 
				i2c_scl_out <= '0';
				if bit_cntr /= 8 and data_dir then
					i2c_sda_out <= data_write(7-bit_cntr);
				else
					if (bit_cntr = 8) and (not data_dir) and (read_ack) then
						i2c_sda_out <= '0';
					else
						i2c_sda_out <= '1';
					end if;
				end if;
				
			when z_data_stretch | z_data_hold => 
				i2c_scl_out <= '1';
				if bit_cntr /= 8 and data_dir then
					i2c_sda_out <= data_write(7-bit_cntr);
				else
					if (bit_cntr = 8) and (not data_dir) and (read_ack) then
						i2c_sda_out <= '0';
					else
						i2c_sda_out <= '1';
					end if;
				end if;
				
			when z_stop_condition_1 => 	
				i2c_scl_out <= '0';
				i2c_sda_out <= '0';	
				
			when z_stop_condition_2 => 	
				i2c_scl_out <= '1';
				i2c_sda_out <= '0';	
				
			when z_stop_condition_3 => 
				i2c_scl_out <= '1';
				i2c_sda_out <= '1';	
				
		end case;
	end process;


	
end i2cmaster_arch;

