----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:54:26 10/12/2012 
-- Design Name: 
-- Module Name:    i2c_control - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;


entity i2c_control is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  pca_leds : in  STD_LOGIC_VECTOR (15 downto 0);
			  dac : in  STD_LOGIC_VECTOR (11 downto 0);
			  adc : out STD_LOGIC_VECTOR (11 downto 0);
			  i2c_sda : inout  STD_LOGIC;
           i2c_scl : inout  STD_LOGIC);
end i2c_control;

architecture i2c_control_arch of i2c_control is


--Constants for PCA9555
constant pca_cmd_in0 : STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(0,8));
constant pca_cmd_in1 : STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(1,8));
constant pca_cmd_out0 : STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(2,8));
constant pca_cmd_out1 : STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(3,8));
constant pca_cmd_polinv0 : STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(4,8));
constant pca_cmd_polinv1 : STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(5,8));
constant pca_cmd_conf0 : STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(6,8));
constant pca_cmd_conf1 : STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(7,8));

constant pca_addr_fixed : STD_LOGIC_VECTOR(3 downto 0) := "0100";
constant pca_addr_programmable : STD_LOGIC_VECTOR(2 downto 0) := "000"; --Change programmable address here
constant pca_addr_read : STD_LOGIC_VECTOR(7 downto 0) := pca_addr_fixed & pca_addr_programmable & "1";
constant pca_addr_write : STD_LOGIC_VECTOR(7 downto 0) := pca_addr_fixed & pca_addr_programmable & "0";

--Constants for DAC AD5647
constant dac_cmd_write_input : STD_LOGIC_VECTOR(2 downto 0) := "000";
constant dac_cmd_update_dac : STD_LOGIC_VECTOR(2 downto 0) := "001";
constant dac_cmd_write_and_update_all : STD_LOGIC_VECTOR(2 downto 0) := "010";
constant dac_cmd_write_and_update : STD_LOGIC_VECTOR(2 downto 0) := "011";
constant dac_cmd_power_up : STD_LOGIC_VECTOR(2 downto 0) := "100";
constant dac_cmd_reset : STD_LOGIC_VECTOR(2 downto 0) := "101";
constant dac_cmd_ldac_register : STD_LOGIC_VECTOR(2 downto 0) := "110";
constant dac_cmd_internal_reference : STD_LOGIC_VECTOR(2 downto 0) := "111";

constant dac_channel_a : STD_LOGIC_VECTOR(2 downto 0) := "000";
constant dac_channel_b : STD_LOGIC_VECTOR(2 downto 0) := "001";
constant dac_channel_both : STD_LOGIC_VECTOR(2 downto 0) := "111";


constant dac_addr_fixed : STD_LOGIC_VECTOR(4 downto 0) := "00011";
constant dac_addr_programmable : STD_LOGIC_VECTOR(1 downto 0) := "10"; --ADDR=VDD=>00;ADDR=NC=>10;ADDR=GND=>11;
constant dac_addr_read : STD_LOGIC_VECTOR(7 downto 0) := dac_addr_fixed & dac_addr_programmable & "1";
constant dac_addr_write : STD_LOGIC_VECTOR(7 downto 0) := dac_addr_fixed & dac_addr_programmable & "0";

--Constants for DAC AD7998
constant adc_cmd_conversion_result : STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(0, 8));
constant adc_cmd_alert_status : STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(1, 8));
constant adc_cmd_configuration : STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(2, 8));
constant adc_cmd_cycle_timer : STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(3, 8));
constant adc_cmd_data1l : STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(4, 8));
constant adc_cmd_data1h : STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(5, 8));
constant adc_cmd_hystersis1 : STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(6, 8));
constant adc_cmd_data2l : STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(7, 8));
constant adc_cmd_data2h : STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(8, 8));
constant adc_cmd_hystersis2 : STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(9, 8));
constant adc_cmd_data3l : STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(10, 8));
constant adc_cmd_data3h : STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(11, 8));
constant adc_cmd_hystersis3 : STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(12, 8));
constant adc_cmd_data4l : STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(13, 8));
constant adc_cmd_data4h : STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(14, 8));
constant adc_cmd_hystersis4 : STD_LOGIC_VECTOR(7 downto 0) := std_logic_vector(to_unsigned(15, 8));


constant adc_sel_chan1 : STD_LOGIC_VECTOR(7 downto 0) := "1000" & "0000";
constant adc_sel_chan2 : STD_LOGIC_VECTOR(7 downto 0) := "1001" & "0000";
constant adc_sel_chan3 : STD_LOGIC_VECTOR(7 downto 0) := "1010" & "0000";
constant adc_sel_chan4 : STD_LOGIC_VECTOR(7 downto 0) := "1011" & "0000";
constant adc_sel_chan5 : STD_LOGIC_VECTOR(7 downto 0) := "1100" & "0000";
constant adc_sel_chan6 : STD_LOGIC_VECTOR(7 downto 0) := "1101" & "0000";
constant adc_sel_chan7 : STD_LOGIC_VECTOR(7 downto 0) := "1110" & "0000";
constant adc_sel_chan8 : STD_LOGIC_VECTOR(7 downto 0) := "1111" & "0000";
constant adc_sel_sequence : STD_LOGIC_VECTOR(7 downto 0) := "0111" & "0000";


constant adc_addr_fixed : STD_LOGIC_VECTOR(3 downto 0) := "0100";
constant adc_addr_programmable : STD_LOGIC_VECTOR(2 downto 0) := "001"; --ADDR=VDD=>010;ADDR=NC=>10;ADDR=GND=>001;
constant adc_addr_read : STD_LOGIC_VECTOR(7 downto 0) := adc_addr_fixed & adc_addr_programmable & "1";
constant adc_addr_write : STD_LOGIC_VECTOR(7 downto 0) := adc_addr_fixed & adc_addr_programmable & "0";


type z_type is (
	z_reset, 
	z_waiting, 
	z_pca_conf_addr, 
	z_pca_conf_addr_wait, 
	z_pca_conf_cmd, 
	z_pca_conf_cmd_wait, 
	z_pca_conf_write1, 
	z_pca_conf_write1_wait, 
	z_pca_conf_write2, 
	z_pca_conf_write2_wait, 
	

	z_adc_conv_addr,
	z_adc_conv_addr_wait,
	z_adc_conv_sel,
	z_adc_conv_sel_wait,
	z_adc_in_addr,
	z_adc_in_addr_wait,
	z_adc_in_read1,
	z_adc_in_read1_wait,
	z_adc_in_read2,
	z_adc_in_read2_wait,

	z_dac_out_addr,
	z_dac_out_addr_wait,
	z_dac_out_cmd,
	z_dac_out_cmd_wait,
	z_dac_out_data1,
	z_dac_out_data1_wait,
	z_dac_out_data2,
	z_dac_out_data2_wait,
	
	z_pca_out_addr, 
	z_pca_out_addr_wait, 
	z_pca_out_cmd,  
	z_pca_out_cmd_wait, 
	z_pca_out_write1,
	z_pca_out_write1_wait,
	z_pca_out_write2,
	z_pca_out_write2_wait
);

signal i2cm_scl_out, i2cm_scl_in, i2cm_sda_in, i2cm_sda_out : STD_LOGIC;
signal ready, start, dir, start_condition, stop_condition, data_write_ack, data_read_ack : STD_LOGIC;
signal data_read, data_write : STD_LOGIC_VECTOR (7 downto 0);
signal z, zplus : z_type;
signal leds_buf, leds_buf_next: STD_LOGIC_VECTOR (15 downto 0);
signal dac_buf, dac_buf_next: STD_LOGIC_VECTOR (11 downto 0);
signal adc_raw, adc_raw_next: STD_LOGIC_VECTOR (15 downto 0);
signal adc_buf, adc_buf_next: STD_LOGIC_VECTOR (11 downto 0);

begin
i2cmaster_inst: entity work.i2cmaster 
	generic map (252)
	port map(
		clk => clk,
		reset => reset,
		i2c_scl_out => i2cm_scl_out,
		i2c_scl_in => i2cm_scl_in,
		i2c_sda_out => i2cm_sda_out,
		i2c_sda_in => i2cm_sda_in,
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


P_TRANS: process(clk, reset)	
	begin
		if clk'event and clk = '1' then
			if reset = '1' then
				z <= z_reset;
				leds_buf <= (others => '0');
				dac_buf <= (others => '0');
				adc_raw <= (others => '0');
				adc_buf <= (others => '0');
			else
				z <= zplus;
				leds_buf <= leds_buf_next;
				dac_buf <= dac_buf_next;
				adc_raw <= adc_raw_next;
				adc_buf <= adc_buf_next;
			end if;
		end if;
	end process;


P_NEXT: process(z, pca_leds, leds_buf, ready, dac, dac_buf, adc_raw, adc_buf, data_read)
	begin
		--default: do nothing
		zplus <= z;
		leds_buf_next <= leds_buf;
		dac_buf_next <= dac_buf;
		adc_raw_next <= adc_raw;
		adc_buf_next <= adc_buf;
		
		case z is
			when z_reset => zplus <= z_pca_conf_addr; --reset
			
			--configure outputs of pca
			when z_pca_conf_addr => zplus <= z_pca_conf_addr_wait;
			when z_pca_conf_addr_wait => 
				if ready = '1' then
					zplus <= z_pca_conf_cmd;
				end if;
			when z_pca_conf_cmd => zplus <= z_pca_conf_cmd_wait;
			when z_pca_conf_cmd_wait => 
				if ready = '1' then
					zplus <= z_pca_conf_write1;
				end if;
			when z_pca_conf_write1 => zplus <= z_pca_conf_write1_wait;
			when z_pca_conf_write1_wait =>
				if ready = '1' then
					zplus <= z_pca_conf_write2;
				end if;
			when z_pca_conf_write2 => zplus <= z_pca_conf_write2_wait;
			when z_pca_conf_write2_wait =>
				if ready = '1' then
					zplus <= z_adc_conv_addr;
				end if;


			--read data from adc
			when z_adc_conv_addr => zplus <= z_adc_conv_addr_wait;
			when z_adc_conv_addr_wait =>
				if ready = '1' then
					zplus <= z_adc_conv_sel;
				end if;
			when z_adc_conv_sel => zplus <= z_adc_conv_sel_wait;
			when z_adc_conv_sel_wait => 
				if ready = '1' then
					zplus <= z_adc_in_addr;
				end if;
			when z_adc_in_addr => zplus <= z_adc_in_addr_wait;
			when z_adc_in_addr_wait =>
				if ready = '1' then
					zplus <= z_adc_in_read1;
				end if;
			when z_adc_in_read1 => zplus <= z_adc_in_read1_wait;
			when z_adc_in_read1_wait => 
				if ready = '1' then
					adc_raw_next(15 downto 8) <= data_read;
					zplus <= z_adc_in_read2;
				end if;
			when z_adc_in_read2 => zplus <= z_adc_in_read2_wait;
			when z_adc_in_read2_wait => 
				if ready = '1' then
					adc_raw_next(7 downto 0) <= data_read;
					zplus <= z_dac_out_addr;
				end if;
								
				
	
			--write data to dac
			when z_dac_out_addr => zplus <= z_dac_out_addr_wait;
			when z_dac_out_addr_wait =>
				if ready = '1' then
					zplus <= z_dac_out_cmd;
				end if;
			when z_dac_out_cmd => zplus <= z_dac_out_cmd_wait;
			when z_dac_out_cmd_wait => 
				if ready = '1' then
					zplus <= z_dac_out_data1;
				end if;
			when z_dac_out_data1 => zplus <= z_dac_out_data1_wait;
			when z_dac_out_data1_wait =>
				if ready = '1' then
					zplus <= z_dac_out_data2;
				end if;
			when z_dac_out_data2 => zplus <= z_dac_out_data2_wait;
			when z_dac_out_data2_wait => 
				if ready = '1' then
					zplus <= z_pca_out_addr;
				end if;
				
			--write data to pca
			when z_pca_out_addr => zplus <= z_pca_out_addr_wait;
			when z_pca_out_addr_wait =>
				if ready = '1' then
					zplus <= z_pca_out_cmd;
				end if;
			when z_pca_out_cmd => zplus <= z_pca_out_cmd_wait;
			when z_pca_out_cmd_wait => 
				if ready = '1' then
					zplus <= z_pca_out_write1;
				end if;
			when z_pca_out_write1 => zplus <= z_pca_out_write1_wait;
			when z_pca_out_write1_wait =>
				if ready = '1' then
					zplus <= z_pca_out_write2;
				end if;
			when z_pca_out_write2 => zplus <= z_pca_out_write2_wait;
			when z_pca_out_write2_wait => 
				if ready = '1' then
					zplus <= z_waiting;
				end if;
			
			--wait for input data to change
			when z_waiting => 
				--if pca_leds /= leds_buf or dac /= dac_buf then
					leds_buf_next <= pca_leds;
					dac_buf_next <= dac;
					adc_buf_next <= adc_raw(11 downto 0);
					zplus <= z_adc_conv_addr;
				--end if;
			
			when others => zplus <= z_reset;
		end case;
	end process;


P_I2C: process(z, dac_buf, leds_buf)
	begin
		case z is
			when z_pca_conf_addr | z_pca_conf_addr_wait | z_pca_out_addr | z_pca_out_addr_wait => 
				dir <= '1';
				start_condition <= '1';
				stop_condition <= '0';
				data_write <= pca_addr_write;
				data_read_ack <= '0';
			when z_pca_conf_cmd | z_pca_conf_cmd_wait=> 
				dir <= '1';
				start_condition <= '0';
				stop_condition <= '0';
				data_write <= pca_cmd_conf0;
				data_read_ack <= '0';
			when z_pca_conf_write1 | z_pca_conf_write1_wait => 
				dir <= '1';
				start_condition <= '0';
				stop_condition <= '0';
				data_write <= "00000000";
				data_read_ack <= '0';

			when z_pca_conf_write2 | z_pca_conf_write2_wait=> 
				dir <= '1';
				start_condition <= '0';
				stop_condition <= '1';
				data_write <= "00000000";
				data_read_ack <= '0';
	
			--adc
			when z_adc_conv_addr | z_adc_conv_addr_wait => 
				dir <= '1';
				start_condition <= '1';
				stop_condition <= '0';
				data_write <= adc_addr_write;
				data_read_ack <= '0';
			when z_adc_conv_sel | z_adc_conv_sel_wait => 
				dir <= '1';
				start_condition <= '0';
				stop_condition <= '0';
				data_write <= adc_sel_chan1;
				data_read_ack <= '0';
			when  z_adc_in_addr | z_adc_in_addr_wait => 
				dir <= '1';
				start_condition <= '1';
				stop_condition <= '0';
				data_write <= adc_addr_read;
				data_read_ack <= '0';				
			when z_adc_in_read1 | z_adc_in_read1_wait => 
				dir <= '0';
				start_condition <= '0';
				stop_condition <= '0';
				data_write <= (others => '0');
				data_read_ack <= '1';		
			when z_adc_in_read2 | z_adc_in_read2_wait => 
				dir <= '0';
				start_condition <= '0';
				stop_condition <= '1';
				data_write <= (others => '0');
				data_read_ack <= '0';		

	
		--	dac
			when z_dac_out_addr | z_dac_out_addr_wait => 
				dir <= '1';
				start_condition <= '1';
				stop_condition <= '0';
				data_write <= dac_addr_write;
				data_read_ack <= '0';
			when z_dac_out_cmd | z_dac_out_cmd_wait => 
				dir <= '1';
				start_condition <= '0';
				stop_condition <= '0';
				data_write <= "00" & dac_cmd_write_and_update & dac_channel_a;
				data_read_ack <= '0';						
			when z_dac_out_data1 | z_dac_out_data1_wait => 
				dir <= '1';
				start_condition <= '0';
				stop_condition <= '0';
				data_write <= dac_buf(11 downto 4);
				data_read_ack <= '0';
			when z_dac_out_data2 | z_dac_out_data2_wait => 
				dir <= '1';
				start_condition <= '0';
				stop_condition <= '1';
				data_write <= dac_buf(3 downto 0) & "0000";
				data_read_ack <= '0';		
		
		--pca
				
			when z_pca_out_cmd | z_pca_out_cmd_wait => 
				dir <= '1';
				start_condition <= '0';
				stop_condition <= '0';
				data_write <= pca_cmd_out0;
				data_read_ack <= '0';						
			when z_pca_out_write1 | z_pca_out_write1_wait => 
				dir <= '1';
				start_condition <= '0';
				stop_condition <= '0';
				data_write <= leds_buf(7 downto 0);
				data_read_ack <= '0';
			when z_pca_out_write2 | z_pca_out_write2_wait => 
				dir <= '1';
				start_condition <= '0';
				stop_condition <= '1';
				data_write <= leds_buf(15 downto 8);
				data_read_ack <= '1';
				
			when z_reset | z_waiting => 
				dir <= '0';
				start_condition <= '0';
				stop_condition <= '0';
				data_write <= ( others => '0');
				data_read_ack <= '0';
		end case;
	
	
		case z is
			when 
				z_pca_conf_addr_wait | 
				z_pca_conf_cmd_wait | 
				z_pca_conf_write1_wait | 
				z_pca_conf_write2_wait | 
				z_adc_conv_addr_wait |
				z_adc_conv_sel_wait |
				z_adc_in_addr_wait |
				z_adc_in_read1_wait |
				z_adc_in_read2_wait |
				z_dac_out_addr_wait |
				z_dac_out_cmd_wait |
				z_dac_out_data1_wait |
				z_dac_out_data2_wait |
				z_pca_out_addr_wait | 
				z_pca_out_cmd_wait | 
				z_pca_out_write1_wait | 
				z_pca_out_write2_wait | 
				z_reset | 
				z_waiting=>
				start <= '0';
			when others => start <= '1';
		end case;
	end process;

	adc <= adc_buf;

	--i2c tristate
	i2c_sda <= 'Z' when i2cm_sda_out = '1' else '0';
	i2c_scl <= 'Z' when i2cm_scl_out = '1' else '0';
	
	i2cm_sda_in <= '1' when i2c_sda = '1' or i2c_sda = 'H' else '0';
	i2cm_scl_in <= '1' when i2c_scl = '1' or i2c_scl = 'H' else '0';

end i2c_control_arch;

