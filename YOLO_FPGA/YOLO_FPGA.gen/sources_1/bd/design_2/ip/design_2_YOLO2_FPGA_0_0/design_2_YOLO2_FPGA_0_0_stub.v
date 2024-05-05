// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sun May  5 00:06:54 2024
// Host        : ABHIJEET running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/abhij/OneDrive/Desktop/sem8/EE712/project/vivado/YOLO_FPGA/YOLO_FPGA.gen/sources_1/bd/design_2/ip/design_2_YOLO2_FPGA_0_0/design_2_YOLO2_FPGA_0_0_stub.v
// Design      : design_2_YOLO2_FPGA_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "YOLO2_FPGA,Vivado 2020.2" *)
module design_2_YOLO2_FPGA_0_0(ap_clk, ap_rst_n, m_axi_DATA_BUS_AWVALID, 
  m_axi_DATA_BUS_AWREADY, m_axi_DATA_BUS_AWADDR, m_axi_DATA_BUS_AWID, 
  m_axi_DATA_BUS_AWLEN, m_axi_DATA_BUS_AWSIZE, m_axi_DATA_BUS_AWBURST, 
  m_axi_DATA_BUS_AWLOCK, m_axi_DATA_BUS_AWCACHE, m_axi_DATA_BUS_AWPROT, 
  m_axi_DATA_BUS_AWQOS, m_axi_DATA_BUS_AWREGION, m_axi_DATA_BUS_AWUSER, 
  m_axi_DATA_BUS_WVALID, m_axi_DATA_BUS_WREADY, m_axi_DATA_BUS_WDATA, 
  m_axi_DATA_BUS_WSTRB, m_axi_DATA_BUS_WLAST, m_axi_DATA_BUS_WID, m_axi_DATA_BUS_WUSER, 
  m_axi_DATA_BUS_ARVALID, m_axi_DATA_BUS_ARREADY, m_axi_DATA_BUS_ARADDR, 
  m_axi_DATA_BUS_ARID, m_axi_DATA_BUS_ARLEN, m_axi_DATA_BUS_ARSIZE, 
  m_axi_DATA_BUS_ARBURST, m_axi_DATA_BUS_ARLOCK, m_axi_DATA_BUS_ARCACHE, 
  m_axi_DATA_BUS_ARPROT, m_axi_DATA_BUS_ARQOS, m_axi_DATA_BUS_ARREGION, 
  m_axi_DATA_BUS_ARUSER, m_axi_DATA_BUS_RVALID, m_axi_DATA_BUS_RREADY, 
  m_axi_DATA_BUS_RDATA, m_axi_DATA_BUS_RLAST, m_axi_DATA_BUS_RID, m_axi_DATA_BUS_RUSER, 
  m_axi_DATA_BUS_RRESP, m_axi_DATA_BUS_BVALID, m_axi_DATA_BUS_BREADY, 
  m_axi_DATA_BUS_BRESP, m_axi_DATA_BUS_BID, m_axi_DATA_BUS_BUSER, 
  m_axi_DATA_BUS2_AWVALID, m_axi_DATA_BUS2_AWREADY, m_axi_DATA_BUS2_AWADDR, 
  m_axi_DATA_BUS2_AWID, m_axi_DATA_BUS2_AWLEN, m_axi_DATA_BUS2_AWSIZE, 
  m_axi_DATA_BUS2_AWBURST, m_axi_DATA_BUS2_AWLOCK, m_axi_DATA_BUS2_AWCACHE, 
  m_axi_DATA_BUS2_AWPROT, m_axi_DATA_BUS2_AWQOS, m_axi_DATA_BUS2_AWREGION, 
  m_axi_DATA_BUS2_AWUSER, m_axi_DATA_BUS2_WVALID, m_axi_DATA_BUS2_WREADY, 
  m_axi_DATA_BUS2_WDATA, m_axi_DATA_BUS2_WSTRB, m_axi_DATA_BUS2_WLAST, 
  m_axi_DATA_BUS2_WID, m_axi_DATA_BUS2_WUSER, m_axi_DATA_BUS2_ARVALID, 
  m_axi_DATA_BUS2_ARREADY, m_axi_DATA_BUS2_ARADDR, m_axi_DATA_BUS2_ARID, 
  m_axi_DATA_BUS2_ARLEN, m_axi_DATA_BUS2_ARSIZE, m_axi_DATA_BUS2_ARBURST, 
  m_axi_DATA_BUS2_ARLOCK, m_axi_DATA_BUS2_ARCACHE, m_axi_DATA_BUS2_ARPROT, 
  m_axi_DATA_BUS2_ARQOS, m_axi_DATA_BUS2_ARREGION, m_axi_DATA_BUS2_ARUSER, 
  m_axi_DATA_BUS2_RVALID, m_axi_DATA_BUS2_RREADY, m_axi_DATA_BUS2_RDATA, 
  m_axi_DATA_BUS2_RLAST, m_axi_DATA_BUS2_RID, m_axi_DATA_BUS2_RUSER, 
  m_axi_DATA_BUS2_RRESP, m_axi_DATA_BUS2_BVALID, m_axi_DATA_BUS2_BREADY, 
  m_axi_DATA_BUS2_BRESP, m_axi_DATA_BUS2_BID, m_axi_DATA_BUS2_BUSER, 
  s_axi_CTRL_BUS_AWVALID, s_axi_CTRL_BUS_AWREADY, s_axi_CTRL_BUS_AWADDR, 
  s_axi_CTRL_BUS_WVALID, s_axi_CTRL_BUS_WREADY, s_axi_CTRL_BUS_WDATA, 
  s_axi_CTRL_BUS_WSTRB, s_axi_CTRL_BUS_ARVALID, s_axi_CTRL_BUS_ARREADY, 
  s_axi_CTRL_BUS_ARADDR, s_axi_CTRL_BUS_RVALID, s_axi_CTRL_BUS_RREADY, 
  s_axi_CTRL_BUS_RDATA, s_axi_CTRL_BUS_RRESP, s_axi_CTRL_BUS_BVALID, 
  s_axi_CTRL_BUS_BREADY, s_axi_CTRL_BUS_BRESP, interrupt)
/* synthesis syn_black_box black_box_pad_pin="ap_clk,ap_rst_n,m_axi_DATA_BUS_AWVALID,m_axi_DATA_BUS_AWREADY,m_axi_DATA_BUS_AWADDR[63:0],m_axi_DATA_BUS_AWID[0:0],m_axi_DATA_BUS_AWLEN[7:0],m_axi_DATA_BUS_AWSIZE[2:0],m_axi_DATA_BUS_AWBURST[1:0],m_axi_DATA_BUS_AWLOCK[1:0],m_axi_DATA_BUS_AWCACHE[3:0],m_axi_DATA_BUS_AWPROT[2:0],m_axi_DATA_BUS_AWQOS[3:0],m_axi_DATA_BUS_AWREGION[3:0],m_axi_DATA_BUS_AWUSER[0:0],m_axi_DATA_BUS_WVALID,m_axi_DATA_BUS_WREADY,m_axi_DATA_BUS_WDATA[31:0],m_axi_DATA_BUS_WSTRB[3:0],m_axi_DATA_BUS_WLAST,m_axi_DATA_BUS_WID[0:0],m_axi_DATA_BUS_WUSER[0:0],m_axi_DATA_BUS_ARVALID,m_axi_DATA_BUS_ARREADY,m_axi_DATA_BUS_ARADDR[63:0],m_axi_DATA_BUS_ARID[0:0],m_axi_DATA_BUS_ARLEN[7:0],m_axi_DATA_BUS_ARSIZE[2:0],m_axi_DATA_BUS_ARBURST[1:0],m_axi_DATA_BUS_ARLOCK[1:0],m_axi_DATA_BUS_ARCACHE[3:0],m_axi_DATA_BUS_ARPROT[2:0],m_axi_DATA_BUS_ARQOS[3:0],m_axi_DATA_BUS_ARREGION[3:0],m_axi_DATA_BUS_ARUSER[0:0],m_axi_DATA_BUS_RVALID,m_axi_DATA_BUS_RREADY,m_axi_DATA_BUS_RDATA[31:0],m_axi_DATA_BUS_RLAST,m_axi_DATA_BUS_RID[0:0],m_axi_DATA_BUS_RUSER[0:0],m_axi_DATA_BUS_RRESP[1:0],m_axi_DATA_BUS_BVALID,m_axi_DATA_BUS_BREADY,m_axi_DATA_BUS_BRESP[1:0],m_axi_DATA_BUS_BID[0:0],m_axi_DATA_BUS_BUSER[0:0],m_axi_DATA_BUS2_AWVALID,m_axi_DATA_BUS2_AWREADY,m_axi_DATA_BUS2_AWADDR[63:0],m_axi_DATA_BUS2_AWID[0:0],m_axi_DATA_BUS2_AWLEN[7:0],m_axi_DATA_BUS2_AWSIZE[2:0],m_axi_DATA_BUS2_AWBURST[1:0],m_axi_DATA_BUS2_AWLOCK[1:0],m_axi_DATA_BUS2_AWCACHE[3:0],m_axi_DATA_BUS2_AWPROT[2:0],m_axi_DATA_BUS2_AWQOS[3:0],m_axi_DATA_BUS2_AWREGION[3:0],m_axi_DATA_BUS2_AWUSER[0:0],m_axi_DATA_BUS2_WVALID,m_axi_DATA_BUS2_WREADY,m_axi_DATA_BUS2_WDATA[31:0],m_axi_DATA_BUS2_WSTRB[3:0],m_axi_DATA_BUS2_WLAST,m_axi_DATA_BUS2_WID[0:0],m_axi_DATA_BUS2_WUSER[0:0],m_axi_DATA_BUS2_ARVALID,m_axi_DATA_BUS2_ARREADY,m_axi_DATA_BUS2_ARADDR[63:0],m_axi_DATA_BUS2_ARID[0:0],m_axi_DATA_BUS2_ARLEN[7:0],m_axi_DATA_BUS2_ARSIZE[2:0],m_axi_DATA_BUS2_ARBURST[1:0],m_axi_DATA_BUS2_ARLOCK[1:0],m_axi_DATA_BUS2_ARCACHE[3:0],m_axi_DATA_BUS2_ARPROT[2:0],m_axi_DATA_BUS2_ARQOS[3:0],m_axi_DATA_BUS2_ARREGION[3:0],m_axi_DATA_BUS2_ARUSER[0:0],m_axi_DATA_BUS2_RVALID,m_axi_DATA_BUS2_RREADY,m_axi_DATA_BUS2_RDATA[31:0],m_axi_DATA_BUS2_RLAST,m_axi_DATA_BUS2_RID[0:0],m_axi_DATA_BUS2_RUSER[0:0],m_axi_DATA_BUS2_RRESP[1:0],m_axi_DATA_BUS2_BVALID,m_axi_DATA_BUS2_BREADY,m_axi_DATA_BUS2_BRESP[1:0],m_axi_DATA_BUS2_BID[0:0],m_axi_DATA_BUS2_BUSER[0:0],s_axi_CTRL_BUS_AWVALID,s_axi_CTRL_BUS_AWREADY,s_axi_CTRL_BUS_AWADDR[7:0],s_axi_CTRL_BUS_WVALID,s_axi_CTRL_BUS_WREADY,s_axi_CTRL_BUS_WDATA[31:0],s_axi_CTRL_BUS_WSTRB[3:0],s_axi_CTRL_BUS_ARVALID,s_axi_CTRL_BUS_ARREADY,s_axi_CTRL_BUS_ARADDR[7:0],s_axi_CTRL_BUS_RVALID,s_axi_CTRL_BUS_RREADY,s_axi_CTRL_BUS_RDATA[31:0],s_axi_CTRL_BUS_RRESP[1:0],s_axi_CTRL_BUS_BVALID,s_axi_CTRL_BUS_BREADY,s_axi_CTRL_BUS_BRESP[1:0],interrupt" */;
  input ap_clk;
  input ap_rst_n;
  output m_axi_DATA_BUS_AWVALID;
  input m_axi_DATA_BUS_AWREADY;
  output [63:0]m_axi_DATA_BUS_AWADDR;
  output [0:0]m_axi_DATA_BUS_AWID;
  output [7:0]m_axi_DATA_BUS_AWLEN;
  output [2:0]m_axi_DATA_BUS_AWSIZE;
  output [1:0]m_axi_DATA_BUS_AWBURST;
  output [1:0]m_axi_DATA_BUS_AWLOCK;
  output [3:0]m_axi_DATA_BUS_AWCACHE;
  output [2:0]m_axi_DATA_BUS_AWPROT;
  output [3:0]m_axi_DATA_BUS_AWQOS;
  output [3:0]m_axi_DATA_BUS_AWREGION;
  output [0:0]m_axi_DATA_BUS_AWUSER;
  output m_axi_DATA_BUS_WVALID;
  input m_axi_DATA_BUS_WREADY;
  output [31:0]m_axi_DATA_BUS_WDATA;
  output [3:0]m_axi_DATA_BUS_WSTRB;
  output m_axi_DATA_BUS_WLAST;
  output [0:0]m_axi_DATA_BUS_WID;
  output [0:0]m_axi_DATA_BUS_WUSER;
  output m_axi_DATA_BUS_ARVALID;
  input m_axi_DATA_BUS_ARREADY;
  output [63:0]m_axi_DATA_BUS_ARADDR;
  output [0:0]m_axi_DATA_BUS_ARID;
  output [7:0]m_axi_DATA_BUS_ARLEN;
  output [2:0]m_axi_DATA_BUS_ARSIZE;
  output [1:0]m_axi_DATA_BUS_ARBURST;
  output [1:0]m_axi_DATA_BUS_ARLOCK;
  output [3:0]m_axi_DATA_BUS_ARCACHE;
  output [2:0]m_axi_DATA_BUS_ARPROT;
  output [3:0]m_axi_DATA_BUS_ARQOS;
  output [3:0]m_axi_DATA_BUS_ARREGION;
  output [0:0]m_axi_DATA_BUS_ARUSER;
  input m_axi_DATA_BUS_RVALID;
  output m_axi_DATA_BUS_RREADY;
  input [31:0]m_axi_DATA_BUS_RDATA;
  input m_axi_DATA_BUS_RLAST;
  input [0:0]m_axi_DATA_BUS_RID;
  input [0:0]m_axi_DATA_BUS_RUSER;
  input [1:0]m_axi_DATA_BUS_RRESP;
  input m_axi_DATA_BUS_BVALID;
  output m_axi_DATA_BUS_BREADY;
  input [1:0]m_axi_DATA_BUS_BRESP;
  input [0:0]m_axi_DATA_BUS_BID;
  input [0:0]m_axi_DATA_BUS_BUSER;
  output m_axi_DATA_BUS2_AWVALID;
  input m_axi_DATA_BUS2_AWREADY;
  output [63:0]m_axi_DATA_BUS2_AWADDR;
  output [0:0]m_axi_DATA_BUS2_AWID;
  output [7:0]m_axi_DATA_BUS2_AWLEN;
  output [2:0]m_axi_DATA_BUS2_AWSIZE;
  output [1:0]m_axi_DATA_BUS2_AWBURST;
  output [1:0]m_axi_DATA_BUS2_AWLOCK;
  output [3:0]m_axi_DATA_BUS2_AWCACHE;
  output [2:0]m_axi_DATA_BUS2_AWPROT;
  output [3:0]m_axi_DATA_BUS2_AWQOS;
  output [3:0]m_axi_DATA_BUS2_AWREGION;
  output [0:0]m_axi_DATA_BUS2_AWUSER;
  output m_axi_DATA_BUS2_WVALID;
  input m_axi_DATA_BUS2_WREADY;
  output [31:0]m_axi_DATA_BUS2_WDATA;
  output [3:0]m_axi_DATA_BUS2_WSTRB;
  output m_axi_DATA_BUS2_WLAST;
  output [0:0]m_axi_DATA_BUS2_WID;
  output [0:0]m_axi_DATA_BUS2_WUSER;
  output m_axi_DATA_BUS2_ARVALID;
  input m_axi_DATA_BUS2_ARREADY;
  output [63:0]m_axi_DATA_BUS2_ARADDR;
  output [0:0]m_axi_DATA_BUS2_ARID;
  output [7:0]m_axi_DATA_BUS2_ARLEN;
  output [2:0]m_axi_DATA_BUS2_ARSIZE;
  output [1:0]m_axi_DATA_BUS2_ARBURST;
  output [1:0]m_axi_DATA_BUS2_ARLOCK;
  output [3:0]m_axi_DATA_BUS2_ARCACHE;
  output [2:0]m_axi_DATA_BUS2_ARPROT;
  output [3:0]m_axi_DATA_BUS2_ARQOS;
  output [3:0]m_axi_DATA_BUS2_ARREGION;
  output [0:0]m_axi_DATA_BUS2_ARUSER;
  input m_axi_DATA_BUS2_RVALID;
  output m_axi_DATA_BUS2_RREADY;
  input [31:0]m_axi_DATA_BUS2_RDATA;
  input m_axi_DATA_BUS2_RLAST;
  input [0:0]m_axi_DATA_BUS2_RID;
  input [0:0]m_axi_DATA_BUS2_RUSER;
  input [1:0]m_axi_DATA_BUS2_RRESP;
  input m_axi_DATA_BUS2_BVALID;
  output m_axi_DATA_BUS2_BREADY;
  input [1:0]m_axi_DATA_BUS2_BRESP;
  input [0:0]m_axi_DATA_BUS2_BID;
  input [0:0]m_axi_DATA_BUS2_BUSER;
  input s_axi_CTRL_BUS_AWVALID;
  output s_axi_CTRL_BUS_AWREADY;
  input [7:0]s_axi_CTRL_BUS_AWADDR;
  input s_axi_CTRL_BUS_WVALID;
  output s_axi_CTRL_BUS_WREADY;
  input [31:0]s_axi_CTRL_BUS_WDATA;
  input [3:0]s_axi_CTRL_BUS_WSTRB;
  input s_axi_CTRL_BUS_ARVALID;
  output s_axi_CTRL_BUS_ARREADY;
  input [7:0]s_axi_CTRL_BUS_ARADDR;
  output s_axi_CTRL_BUS_RVALID;
  input s_axi_CTRL_BUS_RREADY;
  output [31:0]s_axi_CTRL_BUS_RDATA;
  output [1:0]s_axi_CTRL_BUS_RRESP;
  output s_axi_CTRL_BUS_BVALID;
  input s_axi_CTRL_BUS_BREADY;
  output [1:0]s_axi_CTRL_BUS_BRESP;
  output interrupt;
endmodule
