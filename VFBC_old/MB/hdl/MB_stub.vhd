-------------------------------------------------------------------------------
-- MB_stub.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity MB_stub is
  port (
    fpga_0_DDR2_SDRAM_DDR2_Clk_pin : out std_logic_vector(1 downto 0);
    fpga_0_DDR2_SDRAM_DDR2_Clk_n_pin : out std_logic_vector(1 downto 0);
    fpga_0_DDR2_SDRAM_DDR2_CE_pin : out std_logic_vector(1 downto 0);
    fpga_0_DDR2_SDRAM_DDR2_CS_n_pin : out std_logic_vector(1 downto 0);
    fpga_0_DDR2_SDRAM_DDR2_ODT_pin : out std_logic_vector(1 downto 0);
    fpga_0_DDR2_SDRAM_DDR2_RAS_n_pin : out std_logic;
    fpga_0_DDR2_SDRAM_DDR2_CAS_n_pin : out std_logic;
    fpga_0_DDR2_SDRAM_DDR2_WE_n_pin : out std_logic;
    fpga_0_DDR2_SDRAM_DDR2_BankAddr_pin : out std_logic_vector(1 downto 0);
    fpga_0_DDR2_SDRAM_DDR2_Addr_pin : out std_logic_vector(12 downto 0);
    fpga_0_DDR2_SDRAM_DDR2_DQ_pin : inout std_logic_vector(63 downto 0);
    fpga_0_DDR2_SDRAM_DDR2_DM_pin : out std_logic_vector(7 downto 0);
    fpga_0_DDR2_SDRAM_DDR2_DQS_pin : inout std_logic_vector(7 downto 0);
    fpga_0_DDR2_SDRAM_DDR2_DQS_n_pin : inout std_logic_vector(7 downto 0);
    fpga_0_clk_1_sys_clk_pin : in std_logic;
    fpga_0_rst_1_sys_rst_pin : in std_logic;
    gpio_FIFO_almost_full_I : in std_logic;
    Push_Buttons_5Bit_GPIO_IO_I_pin : in std_logic_vector(4 downto 0);
    gpio_FIFO_rd_wr_en_O : out std_logic_vector(1 downto 0);
    xps_FIFO_cam_data_I : in std_logic;
    xps_FIFO_data_rd_cnt_I : in std_logic_vector(0 to 19);
    read_clk_fifo_O : out std_logic;
    xps_epc_0_PRH_Data_I_pin : in std_logic_vector(31 downto 0);
    xps_epc_0_PRH_CS_n_pin : out std_logic;
    xps_epc_0_PRH_Rdy_pin : in std_logic;
    xps_epc_0_PRH_Rst_pin : in std_logic;
    DDR2_SDRAM_VFBC2_Cmd_Clk_pin : in std_logic;
    DDR2_SDRAM_VFBC2_Cmd_Reset_pin : in std_logic;
    DDR2_SDRAM_VFBC2_Cmd_Data_pin : in std_logic_vector(31 downto 0);
    DDR2_SDRAM_VFBC2_Cmd_Write_pin : in std_logic;
    DDR2_SDRAM_VFBC2_Cmd_End_pin : in std_logic;
    DDR2_SDRAM_VFBC2_Cmd_Full_pin : out std_logic;
    DDR2_SDRAM_VFBC2_Cmd_Almost_Full_pin : out std_logic;
    DDR2_SDRAM_VFBC2_Cmd_Idle_pin : out std_logic;
    DDR2_SDRAM_VFBC2_Wd_Clk_pin : in std_logic;
    DDR2_SDRAM_VFBC2_Wd_Reset_pin : in std_logic;
    DDR2_SDRAM_VFBC2_Wd_Write_pin : in std_logic;
    DDR2_SDRAM_VFBC2_Wd_End_Burst_pin : in std_logic;
    DDR2_SDRAM_VFBC2_Wd_Flush_pin : in std_logic;
    DDR2_SDRAM_VFBC2_Wd_Data_pin : in std_logic_vector(15 downto 0);
    DDR2_SDRAM_VFBC2_Wd_Data_BE_pin : in std_logic_vector(1 downto 0);
    DDR2_SDRAM_VFBC2_Wd_Full_pin : out std_logic;
    DDR2_SDRAM_VFBC2_Wd_Almost_Full_pin : out std_logic;
    DDR2_SDRAM_VFBC2_Rd_Clk_pin : in std_logic;
    DDR2_SDRAM_VFBC2_Rd_Reset_pin : in std_logic;
    DDR2_SDRAM_VFBC2_Rd_Read_pin : in std_logic;
    DDR2_SDRAM_VFBC2_Rd_End_Burst_pin : in std_logic;
    DDR2_SDRAM_VFBC2_Rd_Flush_pin : in std_logic;
    DDR2_SDRAM_VFBC2_Rd_Data_pin : out std_logic_vector(15 downto 0);
    DDR2_SDRAM_VFBC2_Rd_Empty_pin : out std_logic;
    DDR2_SDRAM_VFBC2_Rd_Almost_Empty_pin : out std_logic;
    xps_tft_0_TFT_HSYNC_pin : out std_logic;
    xps_tft_0_TFT_VSYNC_pin : out std_logic;
    xps_tft_0_TFT_DE_pin : out std_logic;
    xps_tft_0_TFT_DPS_pin : out std_logic;
    xps_tft_0_TFT_VGA_CLK_pin : out std_logic;
    xps_tft_0_TFT_DVI_CLK_P_pin : out std_logic;
    xps_tft_0_TFT_DVI_CLK_N_pin : out std_logic;
    xps_tft_0_TFT_DVI_DATA_pin : out std_logic_vector(11 downto 0);
    xps_tft_0_TFT_IIC_SCL_pin : inout std_logic;
    xps_tft_0_TFT_IIC_SDA_pin : inout std_logic
  );
end MB_stub;

architecture STRUCTURE of MB_stub is

  component MB is
    port (
      fpga_0_DDR2_SDRAM_DDR2_Clk_pin : out std_logic_vector(1 downto 0);
      fpga_0_DDR2_SDRAM_DDR2_Clk_n_pin : out std_logic_vector(1 downto 0);
      fpga_0_DDR2_SDRAM_DDR2_CE_pin : out std_logic_vector(1 downto 0);
      fpga_0_DDR2_SDRAM_DDR2_CS_n_pin : out std_logic_vector(1 downto 0);
      fpga_0_DDR2_SDRAM_DDR2_ODT_pin : out std_logic_vector(1 downto 0);
      fpga_0_DDR2_SDRAM_DDR2_RAS_n_pin : out std_logic;
      fpga_0_DDR2_SDRAM_DDR2_CAS_n_pin : out std_logic;
      fpga_0_DDR2_SDRAM_DDR2_WE_n_pin : out std_logic;
      fpga_0_DDR2_SDRAM_DDR2_BankAddr_pin : out std_logic_vector(1 downto 0);
      fpga_0_DDR2_SDRAM_DDR2_Addr_pin : out std_logic_vector(12 downto 0);
      fpga_0_DDR2_SDRAM_DDR2_DQ_pin : inout std_logic_vector(63 downto 0);
      fpga_0_DDR2_SDRAM_DDR2_DM_pin : out std_logic_vector(7 downto 0);
      fpga_0_DDR2_SDRAM_DDR2_DQS_pin : inout std_logic_vector(7 downto 0);
      fpga_0_DDR2_SDRAM_DDR2_DQS_n_pin : inout std_logic_vector(7 downto 0);
      fpga_0_clk_1_sys_clk_pin : in std_logic;
      fpga_0_rst_1_sys_rst_pin : in std_logic;
      gpio_FIFO_almost_full_I : in std_logic;
      Push_Buttons_5Bit_GPIO_IO_I_pin : in std_logic_vector(4 downto 0);
      gpio_FIFO_rd_wr_en_O : out std_logic_vector(1 downto 0);
      xps_FIFO_cam_data_I : in std_logic;
      xps_FIFO_data_rd_cnt_I : in std_logic_vector(0 to 19);
      read_clk_fifo_O : out std_logic;
      xps_epc_0_PRH_Data_I_pin : in std_logic_vector(31 downto 0);
      xps_epc_0_PRH_CS_n_pin : out std_logic;
      xps_epc_0_PRH_Rdy_pin : in std_logic;
      xps_epc_0_PRH_Rst_pin : in std_logic;
      DDR2_SDRAM_VFBC2_Cmd_Clk_pin : in std_logic;
      DDR2_SDRAM_VFBC2_Cmd_Reset_pin : in std_logic;
      DDR2_SDRAM_VFBC2_Cmd_Data_pin : in std_logic_vector(31 downto 0);
      DDR2_SDRAM_VFBC2_Cmd_Write_pin : in std_logic;
      DDR2_SDRAM_VFBC2_Cmd_End_pin : in std_logic;
      DDR2_SDRAM_VFBC2_Cmd_Full_pin : out std_logic;
      DDR2_SDRAM_VFBC2_Cmd_Almost_Full_pin : out std_logic;
      DDR2_SDRAM_VFBC2_Cmd_Idle_pin : out std_logic;
      DDR2_SDRAM_VFBC2_Wd_Clk_pin : in std_logic;
      DDR2_SDRAM_VFBC2_Wd_Reset_pin : in std_logic;
      DDR2_SDRAM_VFBC2_Wd_Write_pin : in std_logic;
      DDR2_SDRAM_VFBC2_Wd_End_Burst_pin : in std_logic;
      DDR2_SDRAM_VFBC2_Wd_Flush_pin : in std_logic;
      DDR2_SDRAM_VFBC2_Wd_Data_pin : in std_logic_vector(15 downto 0);
      DDR2_SDRAM_VFBC2_Wd_Data_BE_pin : in std_logic_vector(1 downto 0);
      DDR2_SDRAM_VFBC2_Wd_Full_pin : out std_logic;
      DDR2_SDRAM_VFBC2_Wd_Almost_Full_pin : out std_logic;
      DDR2_SDRAM_VFBC2_Rd_Clk_pin : in std_logic;
      DDR2_SDRAM_VFBC2_Rd_Reset_pin : in std_logic;
      DDR2_SDRAM_VFBC2_Rd_Read_pin : in std_logic;
      DDR2_SDRAM_VFBC2_Rd_End_Burst_pin : in std_logic;
      DDR2_SDRAM_VFBC2_Rd_Flush_pin : in std_logic;
      DDR2_SDRAM_VFBC2_Rd_Data_pin : out std_logic_vector(15 downto 0);
      DDR2_SDRAM_VFBC2_Rd_Empty_pin : out std_logic;
      DDR2_SDRAM_VFBC2_Rd_Almost_Empty_pin : out std_logic;
      xps_tft_0_TFT_HSYNC_pin : out std_logic;
      xps_tft_0_TFT_VSYNC_pin : out std_logic;
      xps_tft_0_TFT_DE_pin : out std_logic;
      xps_tft_0_TFT_DPS_pin : out std_logic;
      xps_tft_0_TFT_VGA_CLK_pin : out std_logic;
      xps_tft_0_TFT_DVI_CLK_P_pin : out std_logic;
      xps_tft_0_TFT_DVI_CLK_N_pin : out std_logic;
      xps_tft_0_TFT_DVI_DATA_pin : out std_logic_vector(11 downto 0);
      xps_tft_0_TFT_IIC_SCL_pin : inout std_logic;
      xps_tft_0_TFT_IIC_SDA_pin : inout std_logic
    );
  end component;

  attribute BOX_TYPE : STRING;
  attribute BOX_TYPE of MB : component is "user_black_box";

begin

  MB_i : MB
    port map (
      fpga_0_DDR2_SDRAM_DDR2_Clk_pin => fpga_0_DDR2_SDRAM_DDR2_Clk_pin,
      fpga_0_DDR2_SDRAM_DDR2_Clk_n_pin => fpga_0_DDR2_SDRAM_DDR2_Clk_n_pin,
      fpga_0_DDR2_SDRAM_DDR2_CE_pin => fpga_0_DDR2_SDRAM_DDR2_CE_pin,
      fpga_0_DDR2_SDRAM_DDR2_CS_n_pin => fpga_0_DDR2_SDRAM_DDR2_CS_n_pin,
      fpga_0_DDR2_SDRAM_DDR2_ODT_pin => fpga_0_DDR2_SDRAM_DDR2_ODT_pin,
      fpga_0_DDR2_SDRAM_DDR2_RAS_n_pin => fpga_0_DDR2_SDRAM_DDR2_RAS_n_pin,
      fpga_0_DDR2_SDRAM_DDR2_CAS_n_pin => fpga_0_DDR2_SDRAM_DDR2_CAS_n_pin,
      fpga_0_DDR2_SDRAM_DDR2_WE_n_pin => fpga_0_DDR2_SDRAM_DDR2_WE_n_pin,
      fpga_0_DDR2_SDRAM_DDR2_BankAddr_pin => fpga_0_DDR2_SDRAM_DDR2_BankAddr_pin,
      fpga_0_DDR2_SDRAM_DDR2_Addr_pin => fpga_0_DDR2_SDRAM_DDR2_Addr_pin,
      fpga_0_DDR2_SDRAM_DDR2_DQ_pin => fpga_0_DDR2_SDRAM_DDR2_DQ_pin,
      fpga_0_DDR2_SDRAM_DDR2_DM_pin => fpga_0_DDR2_SDRAM_DDR2_DM_pin,
      fpga_0_DDR2_SDRAM_DDR2_DQS_pin => fpga_0_DDR2_SDRAM_DDR2_DQS_pin,
      fpga_0_DDR2_SDRAM_DDR2_DQS_n_pin => fpga_0_DDR2_SDRAM_DDR2_DQS_n_pin,
      fpga_0_clk_1_sys_clk_pin => fpga_0_clk_1_sys_clk_pin,
      fpga_0_rst_1_sys_rst_pin => fpga_0_rst_1_sys_rst_pin,
      gpio_FIFO_almost_full_I => gpio_FIFO_almost_full_I,
      Push_Buttons_5Bit_GPIO_IO_I_pin => Push_Buttons_5Bit_GPIO_IO_I_pin,
      gpio_FIFO_rd_wr_en_O => gpio_FIFO_rd_wr_en_O,
      xps_FIFO_cam_data_I => xps_FIFO_cam_data_I,
      xps_FIFO_data_rd_cnt_I => xps_FIFO_data_rd_cnt_I,
      read_clk_fifo_O => read_clk_fifo_O,
      xps_epc_0_PRH_Data_I_pin => xps_epc_0_PRH_Data_I_pin,
      xps_epc_0_PRH_CS_n_pin => xps_epc_0_PRH_CS_n_pin,
      xps_epc_0_PRH_Rdy_pin => xps_epc_0_PRH_Rdy_pin,
      xps_epc_0_PRH_Rst_pin => xps_epc_0_PRH_Rst_pin,
      DDR2_SDRAM_VFBC2_Cmd_Clk_pin => DDR2_SDRAM_VFBC2_Cmd_Clk_pin,
      DDR2_SDRAM_VFBC2_Cmd_Reset_pin => DDR2_SDRAM_VFBC2_Cmd_Reset_pin,
      DDR2_SDRAM_VFBC2_Cmd_Data_pin => DDR2_SDRAM_VFBC2_Cmd_Data_pin,
      DDR2_SDRAM_VFBC2_Cmd_Write_pin => DDR2_SDRAM_VFBC2_Cmd_Write_pin,
      DDR2_SDRAM_VFBC2_Cmd_End_pin => DDR2_SDRAM_VFBC2_Cmd_End_pin,
      DDR2_SDRAM_VFBC2_Cmd_Full_pin => DDR2_SDRAM_VFBC2_Cmd_Full_pin,
      DDR2_SDRAM_VFBC2_Cmd_Almost_Full_pin => DDR2_SDRAM_VFBC2_Cmd_Almost_Full_pin,
      DDR2_SDRAM_VFBC2_Cmd_Idle_pin => DDR2_SDRAM_VFBC2_Cmd_Idle_pin,
      DDR2_SDRAM_VFBC2_Wd_Clk_pin => DDR2_SDRAM_VFBC2_Wd_Clk_pin,
      DDR2_SDRAM_VFBC2_Wd_Reset_pin => DDR2_SDRAM_VFBC2_Wd_Reset_pin,
      DDR2_SDRAM_VFBC2_Wd_Write_pin => DDR2_SDRAM_VFBC2_Wd_Write_pin,
      DDR2_SDRAM_VFBC2_Wd_End_Burst_pin => DDR2_SDRAM_VFBC2_Wd_End_Burst_pin,
      DDR2_SDRAM_VFBC2_Wd_Flush_pin => DDR2_SDRAM_VFBC2_Wd_Flush_pin,
      DDR2_SDRAM_VFBC2_Wd_Data_pin => DDR2_SDRAM_VFBC2_Wd_Data_pin,
      DDR2_SDRAM_VFBC2_Wd_Data_BE_pin => DDR2_SDRAM_VFBC2_Wd_Data_BE_pin,
      DDR2_SDRAM_VFBC2_Wd_Full_pin => DDR2_SDRAM_VFBC2_Wd_Full_pin,
      DDR2_SDRAM_VFBC2_Wd_Almost_Full_pin => DDR2_SDRAM_VFBC2_Wd_Almost_Full_pin,
      DDR2_SDRAM_VFBC2_Rd_Clk_pin => DDR2_SDRAM_VFBC2_Rd_Clk_pin,
      DDR2_SDRAM_VFBC2_Rd_Reset_pin => DDR2_SDRAM_VFBC2_Rd_Reset_pin,
      DDR2_SDRAM_VFBC2_Rd_Read_pin => DDR2_SDRAM_VFBC2_Rd_Read_pin,
      DDR2_SDRAM_VFBC2_Rd_End_Burst_pin => DDR2_SDRAM_VFBC2_Rd_End_Burst_pin,
      DDR2_SDRAM_VFBC2_Rd_Flush_pin => DDR2_SDRAM_VFBC2_Rd_Flush_pin,
      DDR2_SDRAM_VFBC2_Rd_Data_pin => DDR2_SDRAM_VFBC2_Rd_Data_pin,
      DDR2_SDRAM_VFBC2_Rd_Empty_pin => DDR2_SDRAM_VFBC2_Rd_Empty_pin,
      DDR2_SDRAM_VFBC2_Rd_Almost_Empty_pin => DDR2_SDRAM_VFBC2_Rd_Almost_Empty_pin,
      xps_tft_0_TFT_HSYNC_pin => xps_tft_0_TFT_HSYNC_pin,
      xps_tft_0_TFT_VSYNC_pin => xps_tft_0_TFT_VSYNC_pin,
      xps_tft_0_TFT_DE_pin => xps_tft_0_TFT_DE_pin,
      xps_tft_0_TFT_DPS_pin => xps_tft_0_TFT_DPS_pin,
      xps_tft_0_TFT_VGA_CLK_pin => xps_tft_0_TFT_VGA_CLK_pin,
      xps_tft_0_TFT_DVI_CLK_P_pin => xps_tft_0_TFT_DVI_CLK_P_pin,
      xps_tft_0_TFT_DVI_CLK_N_pin => xps_tft_0_TFT_DVI_CLK_N_pin,
      xps_tft_0_TFT_DVI_DATA_pin => xps_tft_0_TFT_DVI_DATA_pin,
      xps_tft_0_TFT_IIC_SCL_pin => xps_tft_0_TFT_IIC_SCL_pin,
      xps_tft_0_TFT_IIC_SDA_pin => xps_tft_0_TFT_IIC_SDA_pin
    );

end architecture STRUCTURE;

