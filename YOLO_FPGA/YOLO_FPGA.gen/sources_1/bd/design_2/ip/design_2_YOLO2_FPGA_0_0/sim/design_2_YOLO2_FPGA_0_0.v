// (c) Copyright 1995-2024 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:YOLO2_FPGA:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_2_YOLO2_FPGA_0_0 (
  ap_clk,
  ap_rst_n,
  m_axi_DATA_BUS_AWVALID,
  m_axi_DATA_BUS_AWREADY,
  m_axi_DATA_BUS_AWADDR,
  m_axi_DATA_BUS_AWID,
  m_axi_DATA_BUS_AWLEN,
  m_axi_DATA_BUS_AWSIZE,
  m_axi_DATA_BUS_AWBURST,
  m_axi_DATA_BUS_AWLOCK,
  m_axi_DATA_BUS_AWCACHE,
  m_axi_DATA_BUS_AWPROT,
  m_axi_DATA_BUS_AWQOS,
  m_axi_DATA_BUS_AWREGION,
  m_axi_DATA_BUS_AWUSER,
  m_axi_DATA_BUS_WVALID,
  m_axi_DATA_BUS_WREADY,
  m_axi_DATA_BUS_WDATA,
  m_axi_DATA_BUS_WSTRB,
  m_axi_DATA_BUS_WLAST,
  m_axi_DATA_BUS_WID,
  m_axi_DATA_BUS_WUSER,
  m_axi_DATA_BUS_ARVALID,
  m_axi_DATA_BUS_ARREADY,
  m_axi_DATA_BUS_ARADDR,
  m_axi_DATA_BUS_ARID,
  m_axi_DATA_BUS_ARLEN,
  m_axi_DATA_BUS_ARSIZE,
  m_axi_DATA_BUS_ARBURST,
  m_axi_DATA_BUS_ARLOCK,
  m_axi_DATA_BUS_ARCACHE,
  m_axi_DATA_BUS_ARPROT,
  m_axi_DATA_BUS_ARQOS,
  m_axi_DATA_BUS_ARREGION,
  m_axi_DATA_BUS_ARUSER,
  m_axi_DATA_BUS_RVALID,
  m_axi_DATA_BUS_RREADY,
  m_axi_DATA_BUS_RDATA,
  m_axi_DATA_BUS_RLAST,
  m_axi_DATA_BUS_RID,
  m_axi_DATA_BUS_RUSER,
  m_axi_DATA_BUS_RRESP,
  m_axi_DATA_BUS_BVALID,
  m_axi_DATA_BUS_BREADY,
  m_axi_DATA_BUS_BRESP,
  m_axi_DATA_BUS_BID,
  m_axi_DATA_BUS_BUSER,
  m_axi_DATA_BUS2_AWVALID,
  m_axi_DATA_BUS2_AWREADY,
  m_axi_DATA_BUS2_AWADDR,
  m_axi_DATA_BUS2_AWID,
  m_axi_DATA_BUS2_AWLEN,
  m_axi_DATA_BUS2_AWSIZE,
  m_axi_DATA_BUS2_AWBURST,
  m_axi_DATA_BUS2_AWLOCK,
  m_axi_DATA_BUS2_AWCACHE,
  m_axi_DATA_BUS2_AWPROT,
  m_axi_DATA_BUS2_AWQOS,
  m_axi_DATA_BUS2_AWREGION,
  m_axi_DATA_BUS2_AWUSER,
  m_axi_DATA_BUS2_WVALID,
  m_axi_DATA_BUS2_WREADY,
  m_axi_DATA_BUS2_WDATA,
  m_axi_DATA_BUS2_WSTRB,
  m_axi_DATA_BUS2_WLAST,
  m_axi_DATA_BUS2_WID,
  m_axi_DATA_BUS2_WUSER,
  m_axi_DATA_BUS2_ARVALID,
  m_axi_DATA_BUS2_ARREADY,
  m_axi_DATA_BUS2_ARADDR,
  m_axi_DATA_BUS2_ARID,
  m_axi_DATA_BUS2_ARLEN,
  m_axi_DATA_BUS2_ARSIZE,
  m_axi_DATA_BUS2_ARBURST,
  m_axi_DATA_BUS2_ARLOCK,
  m_axi_DATA_BUS2_ARCACHE,
  m_axi_DATA_BUS2_ARPROT,
  m_axi_DATA_BUS2_ARQOS,
  m_axi_DATA_BUS2_ARREGION,
  m_axi_DATA_BUS2_ARUSER,
  m_axi_DATA_BUS2_RVALID,
  m_axi_DATA_BUS2_RREADY,
  m_axi_DATA_BUS2_RDATA,
  m_axi_DATA_BUS2_RLAST,
  m_axi_DATA_BUS2_RID,
  m_axi_DATA_BUS2_RUSER,
  m_axi_DATA_BUS2_RRESP,
  m_axi_DATA_BUS2_BVALID,
  m_axi_DATA_BUS2_BREADY,
  m_axi_DATA_BUS2_BRESP,
  m_axi_DATA_BUS2_BID,
  m_axi_DATA_BUS2_BUSER,
  s_axi_CTRL_BUS_AWVALID,
  s_axi_CTRL_BUS_AWREADY,
  s_axi_CTRL_BUS_AWADDR,
  s_axi_CTRL_BUS_WVALID,
  s_axi_CTRL_BUS_WREADY,
  s_axi_CTRL_BUS_WDATA,
  s_axi_CTRL_BUS_WSTRB,
  s_axi_CTRL_BUS_ARVALID,
  s_axi_CTRL_BUS_ARREADY,
  s_axi_CTRL_BUS_ARADDR,
  s_axi_CTRL_BUS_RVALID,
  s_axi_CTRL_BUS_RREADY,
  s_axi_CTRL_BUS_RDATA,
  s_axi_CTRL_BUS_RRESP,
  s_axi_CTRL_BUS_BVALID,
  s_axi_CTRL_BUS_BREADY,
  s_axi_CTRL_BUS_BRESP,
  interrupt
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *)
input wire ap_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *)
input wire ap_rst_n;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS AWVALID" *)
output wire m_axi_DATA_BUS_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS AWREADY" *)
input wire m_axi_DATA_BUS_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS AWADDR" *)
output wire [63 : 0] m_axi_DATA_BUS_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS AWID" *)
output wire [0 : 0] m_axi_DATA_BUS_AWID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS AWLEN" *)
output wire [7 : 0] m_axi_DATA_BUS_AWLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS AWSIZE" *)
output wire [2 : 0] m_axi_DATA_BUS_AWSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS AWBURST" *)
output wire [1 : 0] m_axi_DATA_BUS_AWBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS AWLOCK" *)
output wire [1 : 0] m_axi_DATA_BUS_AWLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS AWCACHE" *)
output wire [3 : 0] m_axi_DATA_BUS_AWCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS AWPROT" *)
output wire [2 : 0] m_axi_DATA_BUS_AWPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS AWQOS" *)
output wire [3 : 0] m_axi_DATA_BUS_AWQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS AWREGION" *)
output wire [3 : 0] m_axi_DATA_BUS_AWREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS AWUSER" *)
output wire [0 : 0] m_axi_DATA_BUS_AWUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS WVALID" *)
output wire m_axi_DATA_BUS_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS WREADY" *)
input wire m_axi_DATA_BUS_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS WDATA" *)
output wire [31 : 0] m_axi_DATA_BUS_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS WSTRB" *)
output wire [3 : 0] m_axi_DATA_BUS_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS WLAST" *)
output wire m_axi_DATA_BUS_WLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS WID" *)
output wire [0 : 0] m_axi_DATA_BUS_WID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS WUSER" *)
output wire [0 : 0] m_axi_DATA_BUS_WUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS ARVALID" *)
output wire m_axi_DATA_BUS_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS ARREADY" *)
input wire m_axi_DATA_BUS_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS ARADDR" *)
output wire [63 : 0] m_axi_DATA_BUS_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS ARID" *)
output wire [0 : 0] m_axi_DATA_BUS_ARID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS ARLEN" *)
output wire [7 : 0] m_axi_DATA_BUS_ARLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS ARSIZE" *)
output wire [2 : 0] m_axi_DATA_BUS_ARSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS ARBURST" *)
output wire [1 : 0] m_axi_DATA_BUS_ARBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS ARLOCK" *)
output wire [1 : 0] m_axi_DATA_BUS_ARLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS ARCACHE" *)
output wire [3 : 0] m_axi_DATA_BUS_ARCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS ARPROT" *)
output wire [2 : 0] m_axi_DATA_BUS_ARPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS ARQOS" *)
output wire [3 : 0] m_axi_DATA_BUS_ARQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS ARREGION" *)
output wire [3 : 0] m_axi_DATA_BUS_ARREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS ARUSER" *)
output wire [0 : 0] m_axi_DATA_BUS_ARUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS RVALID" *)
input wire m_axi_DATA_BUS_RVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS RREADY" *)
output wire m_axi_DATA_BUS_RREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS RDATA" *)
input wire [31 : 0] m_axi_DATA_BUS_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS RLAST" *)
input wire m_axi_DATA_BUS_RLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS RID" *)
input wire [0 : 0] m_axi_DATA_BUS_RID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS RUSER" *)
input wire [0 : 0] m_axi_DATA_BUS_RUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS RRESP" *)
input wire [1 : 0] m_axi_DATA_BUS_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS BVALID" *)
input wire m_axi_DATA_BUS_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS BREADY" *)
output wire m_axi_DATA_BUS_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS BRESP" *)
input wire [1 : 0] m_axi_DATA_BUS_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS BID" *)
input wire [0 : 0] m_axi_DATA_BUS_BID;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi_DATA_BUS, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 1, ADDR_WIDTH 64, AWUSER_WIDTH 1, ARUSER_WIDTH 1, WUSER_WIDTH 1, RUSER_WIDTH 1, BUSER_WIDTH 1, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.000, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0\
, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS BUSER" *)
input wire [0 : 0] m_axi_DATA_BUS_BUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 AWVALID" *)
output wire m_axi_DATA_BUS2_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 AWREADY" *)
input wire m_axi_DATA_BUS2_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 AWADDR" *)
output wire [63 : 0] m_axi_DATA_BUS2_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 AWID" *)
output wire [0 : 0] m_axi_DATA_BUS2_AWID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 AWLEN" *)
output wire [7 : 0] m_axi_DATA_BUS2_AWLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 AWSIZE" *)
output wire [2 : 0] m_axi_DATA_BUS2_AWSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 AWBURST" *)
output wire [1 : 0] m_axi_DATA_BUS2_AWBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 AWLOCK" *)
output wire [1 : 0] m_axi_DATA_BUS2_AWLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 AWCACHE" *)
output wire [3 : 0] m_axi_DATA_BUS2_AWCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 AWPROT" *)
output wire [2 : 0] m_axi_DATA_BUS2_AWPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 AWQOS" *)
output wire [3 : 0] m_axi_DATA_BUS2_AWQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 AWREGION" *)
output wire [3 : 0] m_axi_DATA_BUS2_AWREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 AWUSER" *)
output wire [0 : 0] m_axi_DATA_BUS2_AWUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 WVALID" *)
output wire m_axi_DATA_BUS2_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 WREADY" *)
input wire m_axi_DATA_BUS2_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 WDATA" *)
output wire [31 : 0] m_axi_DATA_BUS2_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 WSTRB" *)
output wire [3 : 0] m_axi_DATA_BUS2_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 WLAST" *)
output wire m_axi_DATA_BUS2_WLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 WID" *)
output wire [0 : 0] m_axi_DATA_BUS2_WID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 WUSER" *)
output wire [0 : 0] m_axi_DATA_BUS2_WUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 ARVALID" *)
output wire m_axi_DATA_BUS2_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 ARREADY" *)
input wire m_axi_DATA_BUS2_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 ARADDR" *)
output wire [63 : 0] m_axi_DATA_BUS2_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 ARID" *)
output wire [0 : 0] m_axi_DATA_BUS2_ARID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 ARLEN" *)
output wire [7 : 0] m_axi_DATA_BUS2_ARLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 ARSIZE" *)
output wire [2 : 0] m_axi_DATA_BUS2_ARSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 ARBURST" *)
output wire [1 : 0] m_axi_DATA_BUS2_ARBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 ARLOCK" *)
output wire [1 : 0] m_axi_DATA_BUS2_ARLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 ARCACHE" *)
output wire [3 : 0] m_axi_DATA_BUS2_ARCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 ARPROT" *)
output wire [2 : 0] m_axi_DATA_BUS2_ARPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 ARQOS" *)
output wire [3 : 0] m_axi_DATA_BUS2_ARQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 ARREGION" *)
output wire [3 : 0] m_axi_DATA_BUS2_ARREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 ARUSER" *)
output wire [0 : 0] m_axi_DATA_BUS2_ARUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 RVALID" *)
input wire m_axi_DATA_BUS2_RVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 RREADY" *)
output wire m_axi_DATA_BUS2_RREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 RDATA" *)
input wire [31 : 0] m_axi_DATA_BUS2_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 RLAST" *)
input wire m_axi_DATA_BUS2_RLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 RID" *)
input wire [0 : 0] m_axi_DATA_BUS2_RID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 RUSER" *)
input wire [0 : 0] m_axi_DATA_BUS2_RUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 RRESP" *)
input wire [1 : 0] m_axi_DATA_BUS2_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 BVALID" *)
input wire m_axi_DATA_BUS2_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 BREADY" *)
output wire m_axi_DATA_BUS2_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 BRESP" *)
input wire [1 : 0] m_axi_DATA_BUS2_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 BID" *)
input wire [0 : 0] m_axi_DATA_BUS2_BID;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi_DATA_BUS2, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 1, ADDR_WIDTH 64, AWUSER_WIDTH 1, ARUSER_WIDTH 1, WUSER_WIDTH 1, RUSER_WIDTH 1, BUSER_WIDTH 1, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.000, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE \
0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_DATA_BUS2 BUSER" *)
input wire [0 : 0] m_axi_DATA_BUS2_BUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CTRL_BUS AWVALID" *)
input wire s_axi_CTRL_BUS_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CTRL_BUS AWREADY" *)
output wire s_axi_CTRL_BUS_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CTRL_BUS AWADDR" *)
input wire [7 : 0] s_axi_CTRL_BUS_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CTRL_BUS WVALID" *)
input wire s_axi_CTRL_BUS_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CTRL_BUS WREADY" *)
output wire s_axi_CTRL_BUS_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CTRL_BUS WDATA" *)
input wire [31 : 0] s_axi_CTRL_BUS_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CTRL_BUS WSTRB" *)
input wire [3 : 0] s_axi_CTRL_BUS_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CTRL_BUS ARVALID" *)
input wire s_axi_CTRL_BUS_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CTRL_BUS ARREADY" *)
output wire s_axi_CTRL_BUS_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CTRL_BUS ARADDR" *)
input wire [7 : 0] s_axi_CTRL_BUS_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CTRL_BUS RVALID" *)
output wire s_axi_CTRL_BUS_RVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CTRL_BUS RREADY" *)
input wire s_axi_CTRL_BUS_RREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CTRL_BUS RDATA" *)
output wire [31 : 0] s_axi_CTRL_BUS_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CTRL_BUS RRESP" *)
output wire [1 : 0] s_axi_CTRL_BUS_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CTRL_BUS BVALID" *)
output wire s_axi_CTRL_BUS_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CTRL_BUS BREADY" *)
input wire s_axi_CTRL_BUS_BREADY;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_CTRL_BUS, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 8, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE \
0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_CTRL_BUS BRESP" *)
output wire [1 : 0] s_axi_CTRL_BUS_BRESP;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME interrupt, SENSITIVITY LEVEL_HIGH, PortWidth 1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT" *)
output wire interrupt;

  YOLO2_FPGA #(
    .ap_ST_fsm_state1(65'B00000000000000000000000000000000000000000000000000000000000000001),
    .ap_ST_fsm_state2(65'B00000000000000000000000000000000000000000000000000000000000000010),
    .ap_ST_fsm_state3(65'B00000000000000000000000000000000000000000000000000000000000000100),
    .ap_ST_fsm_state4(65'B00000000000000000000000000000000000000000000000000000000000001000),
    .ap_ST_fsm_state5(65'B00000000000000000000000000000000000000000000000000000000000010000),
    .ap_ST_fsm_state6(65'B00000000000000000000000000000000000000000000000000000000000100000),
    .ap_ST_fsm_state7(65'B00000000000000000000000000000000000000000000000000000000001000000),
    .ap_ST_fsm_state8(65'B00000000000000000000000000000000000000000000000000000000010000000),
    .ap_ST_fsm_state9(65'B00000000000000000000000000000000000000000000000000000000100000000),
    .ap_ST_fsm_state10(65'B00000000000000000000000000000000000000000000000000000001000000000),
    .ap_ST_fsm_state11(65'B00000000000000000000000000000000000000000000000000000010000000000),
    .ap_ST_fsm_state12(65'B00000000000000000000000000000000000000000000000000000100000000000),
    .ap_ST_fsm_state13(65'B00000000000000000000000000000000000000000000000000001000000000000),
    .ap_ST_fsm_state14(65'B00000000000000000000000000000000000000000000000000010000000000000),
    .ap_ST_fsm_state15(65'B00000000000000000000000000000000000000000000000000100000000000000),
    .ap_ST_fsm_state16(65'B00000000000000000000000000000000000000000000000001000000000000000),
    .ap_ST_fsm_state17(65'B00000000000000000000000000000000000000000000000010000000000000000),
    .ap_ST_fsm_state18(65'B00000000000000000000000000000000000000000000000100000000000000000),
    .ap_ST_fsm_state19(65'B00000000000000000000000000000000000000000000001000000000000000000),
    .ap_ST_fsm_state20(65'B00000000000000000000000000000000000000000000010000000000000000000),
    .ap_ST_fsm_state21(65'B00000000000000000000000000000000000000000000100000000000000000000),
    .ap_ST_fsm_state22(65'B00000000000000000000000000000000000000000001000000000000000000000),
    .ap_ST_fsm_state23(65'B00000000000000000000000000000000000000000010000000000000000000000),
    .ap_ST_fsm_state24(65'B00000000000000000000000000000000000000000100000000000000000000000),
    .ap_ST_fsm_state25(65'B00000000000000000000000000000000000000001000000000000000000000000),
    .ap_ST_fsm_state26(65'B00000000000000000000000000000000000000010000000000000000000000000),
    .ap_ST_fsm_state27(65'B00000000000000000000000000000000000000100000000000000000000000000),
    .ap_ST_fsm_state28(65'B00000000000000000000000000000000000001000000000000000000000000000),
    .ap_ST_fsm_state29(65'B00000000000000000000000000000000000010000000000000000000000000000),
    .ap_ST_fsm_state30(65'B00000000000000000000000000000000000100000000000000000000000000000),
    .ap_ST_fsm_state31(65'B00000000000000000000000000000000001000000000000000000000000000000),
    .ap_ST_fsm_state32(65'B00000000000000000000000000000000010000000000000000000000000000000),
    .ap_ST_fsm_state33(65'B00000000000000000000000000000000100000000000000000000000000000000),
    .ap_ST_fsm_state34(65'B00000000000000000000000000000001000000000000000000000000000000000),
    .ap_ST_fsm_state35(65'B00000000000000000000000000000010000000000000000000000000000000000),
    .ap_ST_fsm_state36(65'B00000000000000000000000000000100000000000000000000000000000000000),
    .ap_ST_fsm_state37(65'B00000000000000000000000000001000000000000000000000000000000000000),
    .ap_ST_fsm_state38(65'B00000000000000000000000000010000000000000000000000000000000000000),
    .ap_ST_fsm_state39(65'B00000000000000000000000000100000000000000000000000000000000000000),
    .ap_ST_fsm_state40(65'B00000000000000000000000001000000000000000000000000000000000000000),
    .ap_ST_fsm_state41(65'B00000000000000000000000010000000000000000000000000000000000000000),
    .ap_ST_fsm_state42(65'B00000000000000000000000100000000000000000000000000000000000000000),
    .ap_ST_fsm_state43(65'B00000000000000000000001000000000000000000000000000000000000000000),
    .ap_ST_fsm_state44(65'B00000000000000000000010000000000000000000000000000000000000000000),
    .ap_ST_fsm_state45(65'B00000000000000000000100000000000000000000000000000000000000000000),
    .ap_ST_fsm_state46(65'B00000000000000000001000000000000000000000000000000000000000000000),
    .ap_ST_fsm_state47(65'B00000000000000000010000000000000000000000000000000000000000000000),
    .ap_ST_fsm_state48(65'B00000000000000000100000000000000000000000000000000000000000000000),
    .ap_ST_fsm_state49(65'B00000000000000001000000000000000000000000000000000000000000000000),
    .ap_ST_fsm_state50(65'B00000000000000010000000000000000000000000000000000000000000000000),
    .ap_ST_fsm_state51(65'B00000000000000100000000000000000000000000000000000000000000000000),
    .ap_ST_fsm_state52(65'B00000000000001000000000000000000000000000000000000000000000000000),
    .ap_ST_fsm_state53(65'B00000000000010000000000000000000000000000000000000000000000000000),
    .ap_ST_fsm_pp0_stage0(65'B00000000000100000000000000000000000000000000000000000000000000000),
    .ap_ST_fsm_state57(65'B00000000001000000000000000000000000000000000000000000000000000000),
    .ap_ST_fsm_pp1_stage0(65'B00000000010000000000000000000000000000000000000000000000000000000),
    .ap_ST_fsm_state61(65'B00000000100000000000000000000000000000000000000000000000000000000),
    .ap_ST_fsm_state62(65'B00000001000000000000000000000000000000000000000000000000000000000),
    .ap_ST_fsm_state63(65'B00000010000000000000000000000000000000000000000000000000000000000),
    .ap_ST_fsm_state64(65'B00000100000000000000000000000000000000000000000000000000000000000),
    .ap_ST_fsm_state65(65'B00001000000000000000000000000000000000000000000000000000000000000),
    .ap_ST_fsm_state66(65'B00010000000000000000000000000000000000000000000000000000000000000),
    .ap_ST_fsm_state67(65'B00100000000000000000000000000000000000000000000000000000000000000),
    .ap_ST_fsm_state68(65'B01000000000000000000000000000000000000000000000000000000000000000),
    .ap_ST_fsm_state69(65'B10000000000000000000000000000000000000000000000000000000000000000),
    .C_S_AXI_CTRL_BUS_DATA_WIDTH(32),
    .C_S_AXI_CTRL_BUS_ADDR_WIDTH(8),
    .C_S_AXI_DATA_WIDTH(32),
    .C_M_AXI_DATA_BUS_ID_WIDTH(1),
    .C_M_AXI_DATA_BUS_ADDR_WIDTH(64),
    .C_M_AXI_DATA_BUS_DATA_WIDTH(32),
    .C_M_AXI_DATA_BUS_AWUSER_WIDTH(1),
    .C_M_AXI_DATA_BUS_ARUSER_WIDTH(1),
    .C_M_AXI_DATA_BUS_WUSER_WIDTH(1),
    .C_M_AXI_DATA_BUS_RUSER_WIDTH(1),
    .C_M_AXI_DATA_BUS_BUSER_WIDTH(1),
    .C_M_AXI_DATA_BUS_USER_VALUE(0),
    .C_M_AXI_DATA_BUS_PROT_VALUE(0),
    .C_M_AXI_DATA_BUS_CACHE_VALUE(3),
    .C_M_AXI_DATA_WIDTH(32),
    .C_M_AXI_DATA_BUS2_ID_WIDTH(1),
    .C_M_AXI_DATA_BUS2_ADDR_WIDTH(64),
    .C_M_AXI_DATA_BUS2_DATA_WIDTH(32),
    .C_M_AXI_DATA_BUS2_AWUSER_WIDTH(1),
    .C_M_AXI_DATA_BUS2_ARUSER_WIDTH(1),
    .C_M_AXI_DATA_BUS2_WUSER_WIDTH(1),
    .C_M_AXI_DATA_BUS2_RUSER_WIDTH(1),
    .C_M_AXI_DATA_BUS2_BUSER_WIDTH(1),
    .C_M_AXI_DATA_BUS2_USER_VALUE(0),
    .C_M_AXI_DATA_BUS2_PROT_VALUE(0),
    .C_M_AXI_DATA_BUS2_CACHE_VALUE(3),
    .C_S_AXI_CTRL_BUS_WSTRB_WIDTH(4),
    .C_S_AXI_WSTRB_WIDTH(4),
    .C_M_AXI_DATA_BUS_WSTRB_WIDTH(4),
    .C_M_AXI_WSTRB_WIDTH(4),
    .C_M_AXI_DATA_BUS2_WSTRB_WIDTH(4)
  ) inst (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .m_axi_DATA_BUS_AWVALID(m_axi_DATA_BUS_AWVALID),
    .m_axi_DATA_BUS_AWREADY(m_axi_DATA_BUS_AWREADY),
    .m_axi_DATA_BUS_AWADDR(m_axi_DATA_BUS_AWADDR),
    .m_axi_DATA_BUS_AWID(m_axi_DATA_BUS_AWID),
    .m_axi_DATA_BUS_AWLEN(m_axi_DATA_BUS_AWLEN),
    .m_axi_DATA_BUS_AWSIZE(m_axi_DATA_BUS_AWSIZE),
    .m_axi_DATA_BUS_AWBURST(m_axi_DATA_BUS_AWBURST),
    .m_axi_DATA_BUS_AWLOCK(m_axi_DATA_BUS_AWLOCK),
    .m_axi_DATA_BUS_AWCACHE(m_axi_DATA_BUS_AWCACHE),
    .m_axi_DATA_BUS_AWPROT(m_axi_DATA_BUS_AWPROT),
    .m_axi_DATA_BUS_AWQOS(m_axi_DATA_BUS_AWQOS),
    .m_axi_DATA_BUS_AWREGION(m_axi_DATA_BUS_AWREGION),
    .m_axi_DATA_BUS_AWUSER(m_axi_DATA_BUS_AWUSER),
    .m_axi_DATA_BUS_WVALID(m_axi_DATA_BUS_WVALID),
    .m_axi_DATA_BUS_WREADY(m_axi_DATA_BUS_WREADY),
    .m_axi_DATA_BUS_WDATA(m_axi_DATA_BUS_WDATA),
    .m_axi_DATA_BUS_WSTRB(m_axi_DATA_BUS_WSTRB),
    .m_axi_DATA_BUS_WLAST(m_axi_DATA_BUS_WLAST),
    .m_axi_DATA_BUS_WID(m_axi_DATA_BUS_WID),
    .m_axi_DATA_BUS_WUSER(m_axi_DATA_BUS_WUSER),
    .m_axi_DATA_BUS_ARVALID(m_axi_DATA_BUS_ARVALID),
    .m_axi_DATA_BUS_ARREADY(m_axi_DATA_BUS_ARREADY),
    .m_axi_DATA_BUS_ARADDR(m_axi_DATA_BUS_ARADDR),
    .m_axi_DATA_BUS_ARID(m_axi_DATA_BUS_ARID),
    .m_axi_DATA_BUS_ARLEN(m_axi_DATA_BUS_ARLEN),
    .m_axi_DATA_BUS_ARSIZE(m_axi_DATA_BUS_ARSIZE),
    .m_axi_DATA_BUS_ARBURST(m_axi_DATA_BUS_ARBURST),
    .m_axi_DATA_BUS_ARLOCK(m_axi_DATA_BUS_ARLOCK),
    .m_axi_DATA_BUS_ARCACHE(m_axi_DATA_BUS_ARCACHE),
    .m_axi_DATA_BUS_ARPROT(m_axi_DATA_BUS_ARPROT),
    .m_axi_DATA_BUS_ARQOS(m_axi_DATA_BUS_ARQOS),
    .m_axi_DATA_BUS_ARREGION(m_axi_DATA_BUS_ARREGION),
    .m_axi_DATA_BUS_ARUSER(m_axi_DATA_BUS_ARUSER),
    .m_axi_DATA_BUS_RVALID(m_axi_DATA_BUS_RVALID),
    .m_axi_DATA_BUS_RREADY(m_axi_DATA_BUS_RREADY),
    .m_axi_DATA_BUS_RDATA(m_axi_DATA_BUS_RDATA),
    .m_axi_DATA_BUS_RLAST(m_axi_DATA_BUS_RLAST),
    .m_axi_DATA_BUS_RID(m_axi_DATA_BUS_RID),
    .m_axi_DATA_BUS_RUSER(m_axi_DATA_BUS_RUSER),
    .m_axi_DATA_BUS_RRESP(m_axi_DATA_BUS_RRESP),
    .m_axi_DATA_BUS_BVALID(m_axi_DATA_BUS_BVALID),
    .m_axi_DATA_BUS_BREADY(m_axi_DATA_BUS_BREADY),
    .m_axi_DATA_BUS_BRESP(m_axi_DATA_BUS_BRESP),
    .m_axi_DATA_BUS_BID(m_axi_DATA_BUS_BID),
    .m_axi_DATA_BUS_BUSER(m_axi_DATA_BUS_BUSER),
    .m_axi_DATA_BUS2_AWVALID(m_axi_DATA_BUS2_AWVALID),
    .m_axi_DATA_BUS2_AWREADY(m_axi_DATA_BUS2_AWREADY),
    .m_axi_DATA_BUS2_AWADDR(m_axi_DATA_BUS2_AWADDR),
    .m_axi_DATA_BUS2_AWID(m_axi_DATA_BUS2_AWID),
    .m_axi_DATA_BUS2_AWLEN(m_axi_DATA_BUS2_AWLEN),
    .m_axi_DATA_BUS2_AWSIZE(m_axi_DATA_BUS2_AWSIZE),
    .m_axi_DATA_BUS2_AWBURST(m_axi_DATA_BUS2_AWBURST),
    .m_axi_DATA_BUS2_AWLOCK(m_axi_DATA_BUS2_AWLOCK),
    .m_axi_DATA_BUS2_AWCACHE(m_axi_DATA_BUS2_AWCACHE),
    .m_axi_DATA_BUS2_AWPROT(m_axi_DATA_BUS2_AWPROT),
    .m_axi_DATA_BUS2_AWQOS(m_axi_DATA_BUS2_AWQOS),
    .m_axi_DATA_BUS2_AWREGION(m_axi_DATA_BUS2_AWREGION),
    .m_axi_DATA_BUS2_AWUSER(m_axi_DATA_BUS2_AWUSER),
    .m_axi_DATA_BUS2_WVALID(m_axi_DATA_BUS2_WVALID),
    .m_axi_DATA_BUS2_WREADY(m_axi_DATA_BUS2_WREADY),
    .m_axi_DATA_BUS2_WDATA(m_axi_DATA_BUS2_WDATA),
    .m_axi_DATA_BUS2_WSTRB(m_axi_DATA_BUS2_WSTRB),
    .m_axi_DATA_BUS2_WLAST(m_axi_DATA_BUS2_WLAST),
    .m_axi_DATA_BUS2_WID(m_axi_DATA_BUS2_WID),
    .m_axi_DATA_BUS2_WUSER(m_axi_DATA_BUS2_WUSER),
    .m_axi_DATA_BUS2_ARVALID(m_axi_DATA_BUS2_ARVALID),
    .m_axi_DATA_BUS2_ARREADY(m_axi_DATA_BUS2_ARREADY),
    .m_axi_DATA_BUS2_ARADDR(m_axi_DATA_BUS2_ARADDR),
    .m_axi_DATA_BUS2_ARID(m_axi_DATA_BUS2_ARID),
    .m_axi_DATA_BUS2_ARLEN(m_axi_DATA_BUS2_ARLEN),
    .m_axi_DATA_BUS2_ARSIZE(m_axi_DATA_BUS2_ARSIZE),
    .m_axi_DATA_BUS2_ARBURST(m_axi_DATA_BUS2_ARBURST),
    .m_axi_DATA_BUS2_ARLOCK(m_axi_DATA_BUS2_ARLOCK),
    .m_axi_DATA_BUS2_ARCACHE(m_axi_DATA_BUS2_ARCACHE),
    .m_axi_DATA_BUS2_ARPROT(m_axi_DATA_BUS2_ARPROT),
    .m_axi_DATA_BUS2_ARQOS(m_axi_DATA_BUS2_ARQOS),
    .m_axi_DATA_BUS2_ARREGION(m_axi_DATA_BUS2_ARREGION),
    .m_axi_DATA_BUS2_ARUSER(m_axi_DATA_BUS2_ARUSER),
    .m_axi_DATA_BUS2_RVALID(m_axi_DATA_BUS2_RVALID),
    .m_axi_DATA_BUS2_RREADY(m_axi_DATA_BUS2_RREADY),
    .m_axi_DATA_BUS2_RDATA(m_axi_DATA_BUS2_RDATA),
    .m_axi_DATA_BUS2_RLAST(m_axi_DATA_BUS2_RLAST),
    .m_axi_DATA_BUS2_RID(m_axi_DATA_BUS2_RID),
    .m_axi_DATA_BUS2_RUSER(m_axi_DATA_BUS2_RUSER),
    .m_axi_DATA_BUS2_RRESP(m_axi_DATA_BUS2_RRESP),
    .m_axi_DATA_BUS2_BVALID(m_axi_DATA_BUS2_BVALID),
    .m_axi_DATA_BUS2_BREADY(m_axi_DATA_BUS2_BREADY),
    .m_axi_DATA_BUS2_BRESP(m_axi_DATA_BUS2_BRESP),
    .m_axi_DATA_BUS2_BID(m_axi_DATA_BUS2_BID),
    .m_axi_DATA_BUS2_BUSER(m_axi_DATA_BUS2_BUSER),
    .s_axi_CTRL_BUS_AWVALID(s_axi_CTRL_BUS_AWVALID),
    .s_axi_CTRL_BUS_AWREADY(s_axi_CTRL_BUS_AWREADY),
    .s_axi_CTRL_BUS_AWADDR(s_axi_CTRL_BUS_AWADDR),
    .s_axi_CTRL_BUS_WVALID(s_axi_CTRL_BUS_WVALID),
    .s_axi_CTRL_BUS_WREADY(s_axi_CTRL_BUS_WREADY),
    .s_axi_CTRL_BUS_WDATA(s_axi_CTRL_BUS_WDATA),
    .s_axi_CTRL_BUS_WSTRB(s_axi_CTRL_BUS_WSTRB),
    .s_axi_CTRL_BUS_ARVALID(s_axi_CTRL_BUS_ARVALID),
    .s_axi_CTRL_BUS_ARREADY(s_axi_CTRL_BUS_ARREADY),
    .s_axi_CTRL_BUS_ARADDR(s_axi_CTRL_BUS_ARADDR),
    .s_axi_CTRL_BUS_RVALID(s_axi_CTRL_BUS_RVALID),
    .s_axi_CTRL_BUS_RREADY(s_axi_CTRL_BUS_RREADY),
    .s_axi_CTRL_BUS_RDATA(s_axi_CTRL_BUS_RDATA),
    .s_axi_CTRL_BUS_RRESP(s_axi_CTRL_BUS_RRESP),
    .s_axi_CTRL_BUS_BVALID(s_axi_CTRL_BUS_BVALID),
    .s_axi_CTRL_BUS_BREADY(s_axi_CTRL_BUS_BREADY),
    .s_axi_CTRL_BUS_BRESP(s_axi_CTRL_BUS_BRESP),
    .interrupt(interrupt)
  );
endmodule
