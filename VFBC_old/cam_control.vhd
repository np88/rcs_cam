----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:25:39 11/26/2012 
-- Design Name: 
-- Module Name:    cam_control - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cam_control is port (
		clk_i : in  STD_LOGIC;
		rst_i : in  STD_LOGIC;
		start_transfer_i: in STD_LOGIC;		
		idle_state_o : out STD_LOGIC;
		data_read_o : out STD_LOGIC_VECTOR(7 downto 0);
		--low level bus connections
		cam_i2c_scl_io : inout  STD_LOGIC; 		--i2c scl 
		cam_i2c_sda_io : inout  STD_LOGIC 		--i2c sda 
);
end cam_control;

architecture Behavioral of cam_control is


component i2cmaster is
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
	end component;
	
	type cam_control_type is (	--type for state machine states
		CL_wait_for_transfer,
		CL_start_first_byte,
		CL_start_second_byte,
		CL_start_third_byte,
		CL_wait_first_byte,
		CL_wait_second_byte,
		CL_wait_third_byte,
		CL_start_first_read,
		CL_wait_first_read,
		CL_start_second_read,
		CL_wait_second_read,
		CL_start_third_read,
		CL_wait_third_read		
	);
	
	constant CAM_IIC_READ_ADDRESS : STD_LOGIC_VECTOR(7 downto 0) := x"43";
	constant CAM_IIC_WRITE_ADDRESS : STD_LOGIC_VECTOR(7 downto 0) := x"42";
	constant CAM_IIC_REG_12 : STD_LOGIC_VECTOR(7 downto 0) := x"12";
	constant CAM_IIC_SET_RGB : STD_LOGIC_VECTOR(7 downto 0) := "00101100";
	
	signal current_state, next_state : cam_control_type;
	signal i2c_scl_out, i2c_scl_in, i2c_sda_out, i2c_sda_in : std_logic;
	signal ready, start, dir, start_condition, stop_condition, data_write_ack, data_read_ack : std_logic;
	signal data_write, data_read : std_logic_vector(7 downto 0) := (others => '0');
	
begin

	i2cmaster_inst: entity work.i2cmaster 
		port map(
			clk => clk_i,
			reset => not rst_i,
			i2c_scl_out => i2c_scl_out,
			i2c_scl_in => i2c_scl_in,
			i2c_sda_out => i2c_sda_out,
			i2c_sda_in => i2c_sda_in,
			ready_out => ready,
			start_in => start,
			dir_in => dir,
			start_condition_in => start_condition,
			stop_condition_in => stop_condition,
			data_write_in => data_write,
			data_write_ack_out => data_write_ack,
			data_read_out => data_read,
			data_read_ack_in => data_read_ack
	);

	data_read_o <= data_read;

	Cam_control_Store: process (clk_i, rst_i)
	begin
		if rst_i = '0' then
			-- no writing in process
			current_state <= CL_wait_for_transfer;		
		elsif (clk_i'event and clk_i = '1') then
			current_state <= next_state;
		end if;	
	end process Cam_control_Store;
	
	
	control : process (current_state, rst_i, start_transfer_i, ready)
	begin 
		if rst_i = '0' then
			next_state <= CL_wait_for_transfer;
		else
			case current_state is
				-- initiate transfer of write address when a start transfer command occurs
				when CL_wait_for_transfer =>
					if start_transfer_i = '1' then 
						next_state <= CL_start_first_byte;
					else 
						next_state <= CL_wait_for_transfer;
					end if;
					
				-- put write address data on the bus after ready signal	
				when CL_start_first_byte =>
						next_state <= CL_wait_first_byte;
					
				-- wait for write ack from bus	
				when CL_wait_first_byte =>
					if ready = '1' then
						next_state <= CL_start_second_byte;
					else
						next_state <= CL_wait_first_byte;
					end if;
				
				-- put write register on the bus after ready signal	
				when CL_start_second_byte =>
						next_state <= CL_wait_second_byte;
					
				-- wait for write ack from bus	
				when CL_wait_second_byte =>
					if ready = '1' then
						next_state <= CL_start_third_byte;
					else
						next_state <= CL_wait_second_byte;
					end if;

				-- put register value on the bus after ready signal	
				when CL_start_third_byte =>
						next_state <= CL_wait_third_byte;
					
				-- wait for write ack from bus	
				when CL_wait_third_byte =>
					if ready = '1' then
						next_state <= CL_start_first_read;
					else
						next_state <= CL_wait_third_byte;
					end if;	
					
				-- start reading the byte (test)
				-- write read address
				when CL_start_first_read =>
					next_state <= CL_wait_first_read;
					
				when CL_wait_first_read =>
					if ready = '1' then
						next_state <= CL_start_second_read;
					else
						next_state <= CL_wait_first_read;
					end if;
					
				-- write register to be read
				when CL_start_second_read =>
					next_state <= CL_wait_second_read;
					
				when CL_wait_second_read =>
					if ready = '1' then
						next_state <= CL_start_third_read;
					else
						next_state <= CL_wait_second_read;
					end if;
					
				-- read register 
				when CL_start_third_read =>
					next_state <= CL_wait_third_read;
					
				when CL_wait_third_read =>	
					if ready = '1' then
						next_state <= CL_wait_for_transfer;
					else
						next_state <= CL_wait_third_read;
					end if;

			end case;
		end if;
	
	end process control;


	output : process (current_state)
	begin 
	
		data_write <= (others => '0');
		start <= '0';
		dir <= '0';
		start_condition <= '0';
		stop_condition <= '0';
		idle_state_o <= '0';
		data_read_ack <= '0';
		
		case current_state is
	
			when CL_wait_for_transfer =>
				idle_state_o <= '1';

			when CL_start_first_byte =>
					start <= '1';
					dir <= '1';
					start_condition <= '1';
					data_write <= CAM_IIC_WRITE_ADDRESS;
			
			when CL_wait_first_byte =>
					dir <= '1';
					start_condition <= '1';
					data_write <= CAM_IIC_WRITE_ADDRESS;
			
			when CL_start_second_byte =>
					start <= '1';
					dir <= '1';
					data_write <= CAM_IIC_REG_12;
			
			when CL_wait_second_byte =>
					dir <= '1';
					data_write <= CAM_IIC_REG_12;
			
			when CL_start_third_byte =>
					start <= '1';
					dir <= '1';
					stop_condition <= '1';
					data_write <= CAM_IIC_SET_RGB;			
			
			when CL_wait_third_byte =>
					dir <= '1';
					stop_condition <= '1';
					data_write <= CAM_IIC_SET_RGB;

				-- start reading the byte (test)
				when CL_start_first_read =>
					dir <= '1';
					start <= '1';
					start_condition <= '1';
					data_write <= CAM_IIC_READ_ADDRESS;
					
				when CL_wait_first_read =>
					dir <= '1';
					start_condition <= '1';
					data_write <= CAM_IIC_READ_ADDRESS;
					
				when CL_start_second_read =>
					start <= '1';
					dir <= '1';
					data_write <= CAM_IIC_REG_12;			
					
				when CL_wait_second_read =>
					dir <= '1';
					data_write <= CAM_IIC_REG_12;			
					
				when CL_start_third_read =>
					start <= '1';
					stop_condition <= '1';
					data_read_ack <= '1';
					
				when CL_wait_third_read =>	
					stop_condition <= '1';
					data_read_ack <= '1';
					
		end case;
	
	end process output;
	
	
	--i2c tristate
	cam_i2c_sda_io <= 'Z' when i2c_sda_out = '1' else '0';
	cam_i2c_scl_io <= 'Z' when i2c_scl_out = '1' else '0';
	
	i2c_sda_in <= '1' when cam_i2c_sda_io = '1' or cam_i2c_sda_io = 'H' else '0';
	i2c_scl_in <= '1' when cam_i2c_scl_io = '1' or cam_i2c_scl_io = 'H' else '0';

end Behavioral;

