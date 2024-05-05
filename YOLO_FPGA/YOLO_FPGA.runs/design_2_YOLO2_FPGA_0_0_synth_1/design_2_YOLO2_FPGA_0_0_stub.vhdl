-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Sun May  5 00:06:38 2024
-- Host        : ABHIJEET running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_2_YOLO2_FPGA_0_0_stub.vhdl
-- Design      : design_2_YOLO2_FPGA_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    m_axi_DATA_BUS_AWVALID : out STD_LOGIC;
    m_axi_DATA_BUS_AWREADY : in STD_LOGIC;
    m_axi_DATA_BUS_AWADDR : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_DATA_BUS_AWID : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_DATA_BUS_AWLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_DATA_BUS_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_DATA_BUS_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_DATA_BUS_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_DATA_BUS_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_DATA_BUS_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_DATA_BUS_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_DATA_BUS_AWREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_DATA_BUS_AWUSER : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_DATA_BUS_WVALID : out STD_LOGIC;
    m_axi_DATA_BUS_WREADY : in STD_LOGIC;
    m_axi_DATA_BUS_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_DATA_BUS_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_DATA_BUS_WLAST : out STD_LOGIC;
    m_axi_DATA_BUS_WID : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_DATA_BUS_WUSER : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_DATA_BUS_ARVALID : out STD_LOGIC;
    m_axi_DATA_BUS_ARREADY : in STD_LOGIC;
    m_axi_DATA_BUS_ARADDR : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_DATA_BUS_ARID : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_DATA_BUS_ARLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_DATA_BUS_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_DATA_BUS_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_DATA_BUS_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_DATA_BUS_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_DATA_BUS_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_DATA_BUS_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_DATA_BUS_ARREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_DATA_BUS_ARUSER : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_DATA_BUS_RVALID : in STD_LOGIC;
    m_axi_DATA_BUS_RREADY : out STD_LOGIC;
    m_axi_DATA_BUS_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_DATA_BUS_RLAST : in STD_LOGIC;
    m_axi_DATA_BUS_RID : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_DATA_BUS_RUSER : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_DATA_BUS_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_DATA_BUS_BVALID : in STD_LOGIC;
    m_axi_DATA_BUS_BREADY : out STD_LOGIC;
    m_axi_DATA_BUS_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_DATA_BUS_BID : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_DATA_BUS_BUSER : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_DATA_BUS2_AWVALID : out STD_LOGIC;
    m_axi_DATA_BUS2_AWREADY : in STD_LOGIC;
    m_axi_DATA_BUS2_AWADDR : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_DATA_BUS2_AWID : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_DATA_BUS2_AWLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_DATA_BUS2_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_DATA_BUS2_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_DATA_BUS2_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_DATA_BUS2_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_DATA_BUS2_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_DATA_BUS2_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_DATA_BUS2_AWREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_DATA_BUS2_AWUSER : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_DATA_BUS2_WVALID : out STD_LOGIC;
    m_axi_DATA_BUS2_WREADY : in STD_LOGIC;
    m_axi_DATA_BUS2_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_DATA_BUS2_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_DATA_BUS2_WLAST : out STD_LOGIC;
    m_axi_DATA_BUS2_WID : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_DATA_BUS2_WUSER : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_DATA_BUS2_ARVALID : out STD_LOGIC;
    m_axi_DATA_BUS2_ARREADY : in STD_LOGIC;
    m_axi_DATA_BUS2_ARADDR : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_DATA_BUS2_ARID : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_DATA_BUS2_ARLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_DATA_BUS2_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_DATA_BUS2_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_DATA_BUS2_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_DATA_BUS2_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_DATA_BUS2_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_DATA_BUS2_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_DATA_BUS2_ARREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_DATA_BUS2_ARUSER : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_DATA_BUS2_RVALID : in STD_LOGIC;
    m_axi_DATA_BUS2_RREADY : out STD_LOGIC;
    m_axi_DATA_BUS2_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_DATA_BUS2_RLAST : in STD_LOGIC;
    m_axi_DATA_BUS2_RID : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_DATA_BUS2_RUSER : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_DATA_BUS2_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_DATA_BUS2_BVALID : in STD_LOGIC;
    m_axi_DATA_BUS2_BREADY : out STD_LOGIC;
    m_axi_DATA_BUS2_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_DATA_BUS2_BID : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_DATA_BUS2_BUSER : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_CTRL_BUS_AWVALID : in STD_LOGIC;
    s_axi_CTRL_BUS_AWREADY : out STD_LOGIC;
    s_axi_CTRL_BUS_AWADDR : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_CTRL_BUS_WVALID : in STD_LOGIC;
    s_axi_CTRL_BUS_WREADY : out STD_LOGIC;
    s_axi_CTRL_BUS_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_CTRL_BUS_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_CTRL_BUS_ARVALID : in STD_LOGIC;
    s_axi_CTRL_BUS_ARREADY : out STD_LOGIC;
    s_axi_CTRL_BUS_ARADDR : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_CTRL_BUS_RVALID : out STD_LOGIC;
    s_axi_CTRL_BUS_RREADY : in STD_LOGIC;
    s_axi_CTRL_BUS_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_CTRL_BUS_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_CTRL_BUS_BVALID : out STD_LOGIC;
    s_axi_CTRL_BUS_BREADY : in STD_LOGIC;
    s_axi_CTRL_BUS_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    interrupt : out STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "ap_clk,ap_rst_n,m_axi_DATA_BUS_AWVALID,m_axi_DATA_BUS_AWREADY,m_axi_DATA_BUS_AWADDR[63:0],m_axi_DATA_BUS_AWID[0:0],m_axi_DATA_BUS_AWLEN[7:0],m_axi_DATA_BUS_AWSIZE[2:0],m_axi_DATA_BUS_AWBURST[1:0],m_axi_DATA_BUS_AWLOCK[1:0],m_axi_DATA_BUS_AWCACHE[3:0],m_axi_DATA_BUS_AWPROT[2:0],m_axi_DATA_BUS_AWQOS[3:0],m_axi_DATA_BUS_AWREGION[3:0],m_axi_DATA_BUS_AWUSER[0:0],m_axi_DATA_BUS_WVALID,m_axi_DATA_BUS_WREADY,m_axi_DATA_BUS_WDATA[31:0],m_axi_DATA_BUS_WSTRB[3:0],m_axi_DATA_BUS_WLAST,m_axi_DATA_BUS_WID[0:0],m_axi_DATA_BUS_WUSER[0:0],m_axi_DATA_BUS_ARVALID,m_axi_DATA_BUS_ARREADY,m_axi_DATA_BUS_ARADDR[63:0],m_axi_DATA_BUS_ARID[0:0],m_axi_DATA_BUS_ARLEN[7:0],m_axi_DATA_BUS_ARSIZE[2:0],m_axi_DATA_BUS_ARBURST[1:0],m_axi_DATA_BUS_ARLOCK[1:0],m_axi_DATA_BUS_ARCACHE[3:0],m_axi_DATA_BUS_ARPROT[2:0],m_axi_DATA_BUS_ARQOS[3:0],m_axi_DATA_BUS_ARREGION[3:0],m_axi_DATA_BUS_ARUSER[0:0],m_axi_DATA_BUS_RVALID,m_axi_DATA_BUS_RREADY,m_axi_DATA_BUS_RDATA[31:0],m_axi_DATA_BUS_RLAST,m_axi_DATA_BUS_RID[0:0],m_axi_DATA_BUS_RUSER[0:0],m_axi_DATA_BUS_RRESP[1:0],m_axi_DATA_BUS_BVALID,m_axi_DATA_BUS_BREADY,m_axi_DATA_BUS_BRESP[1:0],m_axi_DATA_BUS_BID[0:0],m_axi_DATA_BUS_BUSER[0:0],m_axi_DATA_BUS2_AWVALID,m_axi_DATA_BUS2_AWREADY,m_axi_DATA_BUS2_AWADDR[63:0],m_axi_DATA_BUS2_AWID[0:0],m_axi_DATA_BUS2_AWLEN[7:0],m_axi_DATA_BUS2_AWSIZE[2:0],m_axi_DATA_BUS2_AWBURST[1:0],m_axi_DATA_BUS2_AWLOCK[1:0],m_axi_DATA_BUS2_AWCACHE[3:0],m_axi_DATA_BUS2_AWPROT[2:0],m_axi_DATA_BUS2_AWQOS[3:0],m_axi_DATA_BUS2_AWREGION[3:0],m_axi_DATA_BUS2_AWUSER[0:0],m_axi_DATA_BUS2_WVALID,m_axi_DATA_BUS2_WREADY,m_axi_DATA_BUS2_WDATA[31:0],m_axi_DATA_BUS2_WSTRB[3:0],m_axi_DATA_BUS2_WLAST,m_axi_DATA_BUS2_WID[0:0],m_axi_DATA_BUS2_WUSER[0:0],m_axi_DATA_BUS2_ARVALID,m_axi_DATA_BUS2_ARREADY,m_axi_DATA_BUS2_ARADDR[63:0],m_axi_DATA_BUS2_ARID[0:0],m_axi_DATA_BUS2_ARLEN[7:0],m_axi_DATA_BUS2_ARSIZE[2:0],m_axi_DATA_BUS2_ARBURST[1:0],m_axi_DATA_BUS2_ARLOCK[1:0],m_axi_DATA_BUS2_ARCACHE[3:0],m_axi_DATA_BUS2_ARPROT[2:0],m_axi_DATA_BUS2_ARQOS[3:0],m_axi_DATA_BUS2_ARREGION[3:0],m_axi_DATA_BUS2_ARUSER[0:0],m_axi_DATA_BUS2_RVALID,m_axi_DATA_BUS2_RREADY,m_axi_DATA_BUS2_RDATA[31:0],m_axi_DATA_BUS2_RLAST,m_axi_DATA_BUS2_RID[0:0],m_axi_DATA_BUS2_RUSER[0:0],m_axi_DATA_BUS2_RRESP[1:0],m_axi_DATA_BUS2_BVALID,m_axi_DATA_BUS2_BREADY,m_axi_DATA_BUS2_BRESP[1:0],m_axi_DATA_BUS2_BID[0:0],m_axi_DATA_BUS2_BUSER[0:0],s_axi_CTRL_BUS_AWVALID,s_axi_CTRL_BUS_AWREADY,s_axi_CTRL_BUS_AWADDR[7:0],s_axi_CTRL_BUS_WVALID,s_axi_CTRL_BUS_WREADY,s_axi_CTRL_BUS_WDATA[31:0],s_axi_CTRL_BUS_WSTRB[3:0],s_axi_CTRL_BUS_ARVALID,s_axi_CTRL_BUS_ARREADY,s_axi_CTRL_BUS_ARADDR[7:0],s_axi_CTRL_BUS_RVALID,s_axi_CTRL_BUS_RREADY,s_axi_CTRL_BUS_RDATA[31:0],s_axi_CTRL_BUS_RRESP[1:0],s_axi_CTRL_BUS_BVALID,s_axi_CTRL_BUS_BREADY,s_axi_CTRL_BUS_BRESP[1:0],interrupt";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "YOLO2_FPGA,Vivado 2020.2";
begin
end;
