// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1ns/1ps
module YOLO2_FPGA_CTRL_BUS_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 8,
    C_S_AXI_DATA_WIDTH = 32
)(
    input  wire                          ACLK,
    input  wire                          ARESET,
    input  wire                          ACLK_EN,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] AWADDR,
    input  wire                          AWVALID,
    output wire                          AWREADY,
    input  wire [C_S_AXI_DATA_WIDTH-1:0] WDATA,
    input  wire [C_S_AXI_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                          WVALID,
    output wire                          WREADY,
    output wire [1:0]                    BRESP,
    output wire                          BVALID,
    input  wire                          BREADY,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] ARADDR,
    input  wire                          ARVALID,
    output wire                          ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1:0] RDATA,
    output wire [1:0]                    RRESP,
    output wire                          RVALID,
    input  wire                          RREADY,
    output wire                          interrupt,
    output wire [63:0]                   Input_r,
    output wire [63:0]                   Output_r,
    output wire [63:0]                   Weight,
    output wire [63:0]                   Beta,
    output wire [31:0]                   InFM_num,
    output wire [31:0]                   OutFM_num,
    output wire [31:0]                   Kernel_size,
    output wire [31:0]                   Kernel_stride,
    output wire [31:0]                   Input_w,
    output wire [31:0]                   Input_h,
    output wire [31:0]                   Padding,
    output wire [0:0]                    IsNL,
    output wire [0:0]                    IsBN,
    output wire [31:0]                   TM,
    output wire [31:0]                   TN,
    output wire [31:0]                   TR,
    output wire [31:0]                   TC,
    output wire [31:0]                   mLoops,
    output wire [31:0]                   nLoops,
    output wire [31:0]                   rLoops,
    output wire [31:0]                   cLoops,
    output wire [31:0]                   LayerType,
    output wire [31:0]                   InputQ,
    output wire [31:0]                   OutputQ,
    output wire [31:0]                   WeightQ,
    output wire [31:0]                   BetaQ,
    output wire                          ap_start,
    input  wire                          ap_done,
    input  wire                          ap_ready,
    input  wire                          ap_idle
);
//------------------------Address Info-------------------
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read)
//        bit 7  - auto_restart (Read/Write)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0  - enable ap_done interrupt (Read/Write)
//        bit 1  - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0  - ap_done (COR/TOW)
//        bit 1  - ap_ready (COR/TOW)
//        others - reserved
// 0x10 : Data signal of Input_r
//        bit 31~0 - Input_r[31:0] (Read/Write)
// 0x14 : Data signal of Input_r
//        bit 31~0 - Input_r[63:32] (Read/Write)
// 0x18 : reserved
// 0x1c : Data signal of Output_r
//        bit 31~0 - Output_r[31:0] (Read/Write)
// 0x20 : Data signal of Output_r
//        bit 31~0 - Output_r[63:32] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of Weight
//        bit 31~0 - Weight[31:0] (Read/Write)
// 0x2c : Data signal of Weight
//        bit 31~0 - Weight[63:32] (Read/Write)
// 0x30 : reserved
// 0x34 : Data signal of Beta
//        bit 31~0 - Beta[31:0] (Read/Write)
// 0x38 : Data signal of Beta
//        bit 31~0 - Beta[63:32] (Read/Write)
// 0x3c : reserved
// 0x40 : Data signal of InFM_num
//        bit 31~0 - InFM_num[31:0] (Read/Write)
// 0x44 : reserved
// 0x48 : Data signal of OutFM_num
//        bit 31~0 - OutFM_num[31:0] (Read/Write)
// 0x4c : reserved
// 0x50 : Data signal of Kernel_size
//        bit 31~0 - Kernel_size[31:0] (Read/Write)
// 0x54 : reserved
// 0x58 : Data signal of Kernel_stride
//        bit 31~0 - Kernel_stride[31:0] (Read/Write)
// 0x5c : reserved
// 0x60 : Data signal of Input_w
//        bit 31~0 - Input_w[31:0] (Read/Write)
// 0x64 : reserved
// 0x68 : Data signal of Input_h
//        bit 31~0 - Input_h[31:0] (Read/Write)
// 0x6c : reserved
// 0x70 : Data signal of Padding
//        bit 31~0 - Padding[31:0] (Read/Write)
// 0x74 : reserved
// 0x78 : Data signal of IsNL
//        bit 0  - IsNL[0] (Read/Write)
//        others - reserved
// 0x7c : reserved
// 0x80 : Data signal of IsBN
//        bit 0  - IsBN[0] (Read/Write)
//        others - reserved
// 0x84 : reserved
// 0x88 : Data signal of TM
//        bit 31~0 - TM[31:0] (Read/Write)
// 0x8c : reserved
// 0x90 : Data signal of TN
//        bit 31~0 - TN[31:0] (Read/Write)
// 0x94 : reserved
// 0x98 : Data signal of TR
//        bit 31~0 - TR[31:0] (Read/Write)
// 0x9c : reserved
// 0xa0 : Data signal of TC
//        bit 31~0 - TC[31:0] (Read/Write)
// 0xa4 : reserved
// 0xa8 : Data signal of mLoops
//        bit 31~0 - mLoops[31:0] (Read/Write)
// 0xac : reserved
// 0xb0 : Data signal of nLoops
//        bit 31~0 - nLoops[31:0] (Read/Write)
// 0xb4 : reserved
// 0xb8 : Data signal of rLoops
//        bit 31~0 - rLoops[31:0] (Read/Write)
// 0xbc : reserved
// 0xc0 : Data signal of cLoops
//        bit 31~0 - cLoops[31:0] (Read/Write)
// 0xc4 : reserved
// 0xc8 : Data signal of LayerType
//        bit 31~0 - LayerType[31:0] (Read/Write)
// 0xcc : reserved
// 0xd0 : Data signal of InputQ
//        bit 31~0 - InputQ[31:0] (Read/Write)
// 0xd4 : reserved
// 0xd8 : Data signal of OutputQ
//        bit 31~0 - OutputQ[31:0] (Read/Write)
// 0xdc : reserved
// 0xe0 : Data signal of WeightQ
//        bit 31~0 - WeightQ[31:0] (Read/Write)
// 0xe4 : reserved
// 0xe8 : Data signal of BetaQ
//        bit 31~0 - BetaQ[31:0] (Read/Write)
// 0xec : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

//------------------------Parameter----------------------
localparam
    ADDR_AP_CTRL              = 8'h00,
    ADDR_GIE                  = 8'h04,
    ADDR_IER                  = 8'h08,
    ADDR_ISR                  = 8'h0c,
    ADDR_INPUT_R_DATA_0       = 8'h10,
    ADDR_INPUT_R_DATA_1       = 8'h14,
    ADDR_INPUT_R_CTRL         = 8'h18,
    ADDR_OUTPUT_R_DATA_0      = 8'h1c,
    ADDR_OUTPUT_R_DATA_1      = 8'h20,
    ADDR_OUTPUT_R_CTRL        = 8'h24,
    ADDR_WEIGHT_DATA_0        = 8'h28,
    ADDR_WEIGHT_DATA_1        = 8'h2c,
    ADDR_WEIGHT_CTRL          = 8'h30,
    ADDR_BETA_DATA_0          = 8'h34,
    ADDR_BETA_DATA_1          = 8'h38,
    ADDR_BETA_CTRL            = 8'h3c,
    ADDR_INFM_NUM_DATA_0      = 8'h40,
    ADDR_INFM_NUM_CTRL        = 8'h44,
    ADDR_OUTFM_NUM_DATA_0     = 8'h48,
    ADDR_OUTFM_NUM_CTRL       = 8'h4c,
    ADDR_KERNEL_SIZE_DATA_0   = 8'h50,
    ADDR_KERNEL_SIZE_CTRL     = 8'h54,
    ADDR_KERNEL_STRIDE_DATA_0 = 8'h58,
    ADDR_KERNEL_STRIDE_CTRL   = 8'h5c,
    ADDR_INPUT_W_DATA_0       = 8'h60,
    ADDR_INPUT_W_CTRL         = 8'h64,
    ADDR_INPUT_H_DATA_0       = 8'h68,
    ADDR_INPUT_H_CTRL         = 8'h6c,
    ADDR_PADDING_DATA_0       = 8'h70,
    ADDR_PADDING_CTRL         = 8'h74,
    ADDR_ISNL_DATA_0          = 8'h78,
    ADDR_ISNL_CTRL            = 8'h7c,
    ADDR_ISBN_DATA_0          = 8'h80,
    ADDR_ISBN_CTRL            = 8'h84,
    ADDR_TM_DATA_0            = 8'h88,
    ADDR_TM_CTRL              = 8'h8c,
    ADDR_TN_DATA_0            = 8'h90,
    ADDR_TN_CTRL              = 8'h94,
    ADDR_TR_DATA_0            = 8'h98,
    ADDR_TR_CTRL              = 8'h9c,
    ADDR_TC_DATA_0            = 8'ha0,
    ADDR_TC_CTRL              = 8'ha4,
    ADDR_MLOOPS_DATA_0        = 8'ha8,
    ADDR_MLOOPS_CTRL          = 8'hac,
    ADDR_NLOOPS_DATA_0        = 8'hb0,
    ADDR_NLOOPS_CTRL          = 8'hb4,
    ADDR_RLOOPS_DATA_0        = 8'hb8,
    ADDR_RLOOPS_CTRL          = 8'hbc,
    ADDR_CLOOPS_DATA_0        = 8'hc0,
    ADDR_CLOOPS_CTRL          = 8'hc4,
    ADDR_LAYERTYPE_DATA_0     = 8'hc8,
    ADDR_LAYERTYPE_CTRL       = 8'hcc,
    ADDR_INPUTQ_DATA_0        = 8'hd0,
    ADDR_INPUTQ_CTRL          = 8'hd4,
    ADDR_OUTPUTQ_DATA_0       = 8'hd8,
    ADDR_OUTPUTQ_CTRL         = 8'hdc,
    ADDR_WEIGHTQ_DATA_0       = 8'he0,
    ADDR_WEIGHTQ_CTRL         = 8'he4,
    ADDR_BETAQ_DATA_0         = 8'he8,
    ADDR_BETAQ_CTRL           = 8'hec,
    WRIDLE                    = 2'd0,
    WRDATA                    = 2'd1,
    WRRESP                    = 2'd2,
    WRRESET                   = 2'd3,
    RDIDLE                    = 2'd0,
    RDDATA                    = 2'd1,
    RDRESET                   = 2'd2,
    ADDR_BITS                = 8;

//------------------------Local signal-------------------
    reg  [1:0]                    wstate = WRRESET;
    reg  [1:0]                    wnext;
    reg  [ADDR_BITS-1:0]          waddr;
    wire [C_S_AXI_DATA_WIDTH-1:0] wmask;
    wire                          aw_hs;
    wire                          w_hs;
    reg  [1:0]                    rstate = RDRESET;
    reg  [1:0]                    rnext;
    reg  [C_S_AXI_DATA_WIDTH-1:0] rdata;
    wire                          ar_hs;
    wire [ADDR_BITS-1:0]          raddr;
    // internal registers
    reg                           int_ap_idle;
    reg                           int_ap_ready;
    reg                           int_ap_done = 1'b0;
    reg                           int_ap_start = 1'b0;
    reg                           int_auto_restart = 1'b0;
    reg                           int_gie = 1'b0;
    reg  [1:0]                    int_ier = 2'b0;
    reg  [1:0]                    int_isr = 2'b0;
    reg  [63:0]                   int_Input_r = 'b0;
    reg  [63:0]                   int_Output_r = 'b0;
    reg  [63:0]                   int_Weight = 'b0;
    reg  [63:0]                   int_Beta = 'b0;
    reg  [31:0]                   int_InFM_num = 'b0;
    reg  [31:0]                   int_OutFM_num = 'b0;
    reg  [31:0]                   int_Kernel_size = 'b0;
    reg  [31:0]                   int_Kernel_stride = 'b0;
    reg  [31:0]                   int_Input_w = 'b0;
    reg  [31:0]                   int_Input_h = 'b0;
    reg  [31:0]                   int_Padding = 'b0;
    reg  [0:0]                    int_IsNL = 'b0;
    reg  [0:0]                    int_IsBN = 'b0;
    reg  [31:0]                   int_TM = 'b0;
    reg  [31:0]                   int_TN = 'b0;
    reg  [31:0]                   int_TR = 'b0;
    reg  [31:0]                   int_TC = 'b0;
    reg  [31:0]                   int_mLoops = 'b0;
    reg  [31:0]                   int_nLoops = 'b0;
    reg  [31:0]                   int_rLoops = 'b0;
    reg  [31:0]                   int_cLoops = 'b0;
    reg  [31:0]                   int_LayerType = 'b0;
    reg  [31:0]                   int_InputQ = 'b0;
    reg  [31:0]                   int_OutputQ = 'b0;
    reg  [31:0]                   int_WeightQ = 'b0;
    reg  [31:0]                   int_BetaQ = 'b0;

//------------------------Instantiation------------------


//------------------------AXI write fsm------------------
assign AWREADY = (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA);
assign BRESP   = 2'b00;  // OKAY
assign BVALID  = (wstate == WRRESP);
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;

// wstate
always @(posedge ACLK) begin
    if (ARESET)
        wstate <= WRRESET;
    else if (ACLK_EN)
        wstate <= wnext;
end

// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (WVALID)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (aw_hs)
            waddr <= AWADDR[ADDR_BITS-1:0];
    end
end

//------------------------AXI read fsm-------------------
assign ARREADY = (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA);
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];

// rstate
always @(posedge ACLK) begin
    if (ARESET)
        rstate <= RDRESET;
    else if (ACLK_EN)
        rstate <= rnext;
end

// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY & RVALID)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs) begin
            rdata <= 'b0;
            case (raddr)
                ADDR_AP_CTRL: begin
                    rdata[0] <= int_ap_start;
                    rdata[1] <= int_ap_done;
                    rdata[2] <= int_ap_idle;
                    rdata[3] <= int_ap_ready;
                    rdata[7] <= int_auto_restart;
                end
                ADDR_GIE: begin
                    rdata <= int_gie;
                end
                ADDR_IER: begin
                    rdata <= int_ier;
                end
                ADDR_ISR: begin
                    rdata <= int_isr;
                end
                ADDR_INPUT_R_DATA_0: begin
                    rdata <= int_Input_r[31:0];
                end
                ADDR_INPUT_R_DATA_1: begin
                    rdata <= int_Input_r[63:32];
                end
                ADDR_OUTPUT_R_DATA_0: begin
                    rdata <= int_Output_r[31:0];
                end
                ADDR_OUTPUT_R_DATA_1: begin
                    rdata <= int_Output_r[63:32];
                end
                ADDR_WEIGHT_DATA_0: begin
                    rdata <= int_Weight[31:0];
                end
                ADDR_WEIGHT_DATA_1: begin
                    rdata <= int_Weight[63:32];
                end
                ADDR_BETA_DATA_0: begin
                    rdata <= int_Beta[31:0];
                end
                ADDR_BETA_DATA_1: begin
                    rdata <= int_Beta[63:32];
                end
                ADDR_INFM_NUM_DATA_0: begin
                    rdata <= int_InFM_num[31:0];
                end
                ADDR_OUTFM_NUM_DATA_0: begin
                    rdata <= int_OutFM_num[31:0];
                end
                ADDR_KERNEL_SIZE_DATA_0: begin
                    rdata <= int_Kernel_size[31:0];
                end
                ADDR_KERNEL_STRIDE_DATA_0: begin
                    rdata <= int_Kernel_stride[31:0];
                end
                ADDR_INPUT_W_DATA_0: begin
                    rdata <= int_Input_w[31:0];
                end
                ADDR_INPUT_H_DATA_0: begin
                    rdata <= int_Input_h[31:0];
                end
                ADDR_PADDING_DATA_0: begin
                    rdata <= int_Padding[31:0];
                end
                ADDR_ISNL_DATA_0: begin
                    rdata <= int_IsNL[0:0];
                end
                ADDR_ISBN_DATA_0: begin
                    rdata <= int_IsBN[0:0];
                end
                ADDR_TM_DATA_0: begin
                    rdata <= int_TM[31:0];
                end
                ADDR_TN_DATA_0: begin
                    rdata <= int_TN[31:0];
                end
                ADDR_TR_DATA_0: begin
                    rdata <= int_TR[31:0];
                end
                ADDR_TC_DATA_0: begin
                    rdata <= int_TC[31:0];
                end
                ADDR_MLOOPS_DATA_0: begin
                    rdata <= int_mLoops[31:0];
                end
                ADDR_NLOOPS_DATA_0: begin
                    rdata <= int_nLoops[31:0];
                end
                ADDR_RLOOPS_DATA_0: begin
                    rdata <= int_rLoops[31:0];
                end
                ADDR_CLOOPS_DATA_0: begin
                    rdata <= int_cLoops[31:0];
                end
                ADDR_LAYERTYPE_DATA_0: begin
                    rdata <= int_LayerType[31:0];
                end
                ADDR_INPUTQ_DATA_0: begin
                    rdata <= int_InputQ[31:0];
                end
                ADDR_OUTPUTQ_DATA_0: begin
                    rdata <= int_OutputQ[31:0];
                end
                ADDR_WEIGHTQ_DATA_0: begin
                    rdata <= int_WeightQ[31:0];
                end
                ADDR_BETAQ_DATA_0: begin
                    rdata <= int_BetaQ[31:0];
                end
            endcase
        end
    end
end


//------------------------Register logic-----------------
assign interrupt     = int_gie & (|int_isr);
assign ap_start      = int_ap_start;
assign Input_r       = int_Input_r;
assign Output_r      = int_Output_r;
assign Weight        = int_Weight;
assign Beta          = int_Beta;
assign InFM_num      = int_InFM_num;
assign OutFM_num     = int_OutFM_num;
assign Kernel_size   = int_Kernel_size;
assign Kernel_stride = int_Kernel_stride;
assign Input_w       = int_Input_w;
assign Input_h       = int_Input_h;
assign Padding       = int_Padding;
assign IsNL          = int_IsNL;
assign IsBN          = int_IsBN;
assign TM            = int_TM;
assign TN            = int_TN;
assign TR            = int_TR;
assign TC            = int_TC;
assign mLoops        = int_mLoops;
assign nLoops        = int_nLoops;
assign rLoops        = int_rLoops;
assign cLoops        = int_cLoops;
assign LayerType     = int_LayerType;
assign InputQ        = int_InputQ;
assign OutputQ       = int_OutputQ;
assign WeightQ       = int_WeightQ;
assign BetaQ         = int_BetaQ;
// int_ap_start
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_start <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0] && WDATA[0])
            int_ap_start <= 1'b1;
        else if (ap_ready)
            int_ap_start <= int_auto_restart; // clear on handshake/auto restart
    end
end

// int_ap_done
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_done <= 1'b0;
    else if (ACLK_EN) begin
        if (ap_done)
            int_ap_done <= 1'b1;
        else if (ar_hs && raddr == ADDR_AP_CTRL)
            int_ap_done <= 1'b0; // clear on read
    end
end

// int_ap_idle
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_idle <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_idle <= ap_idle;
    end
end

// int_ap_ready
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_ready <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_ready <= ap_ready;
    end
end

// int_auto_restart
always @(posedge ACLK) begin
    if (ARESET)
        int_auto_restart <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0])
            int_auto_restart <=  WDATA[7];
    end
end

// int_gie
always @(posedge ACLK) begin
    if (ARESET)
        int_gie <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_GIE && WSTRB[0])
            int_gie <= WDATA[0];
    end
end

// int_ier
always @(posedge ACLK) begin
    if (ARESET)
        int_ier <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IER && WSTRB[0])
            int_ier <= WDATA[1:0];
    end
end

// int_isr[0]
always @(posedge ACLK) begin
    if (ARESET)
        int_isr[0] <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier[0] & ap_done)
            int_isr[0] <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr[0] <= int_isr[0] ^ WDATA[0]; // toggle on write
    end
end

// int_isr[1]
always @(posedge ACLK) begin
    if (ARESET)
        int_isr[1] <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier[1] & ap_ready)
            int_isr[1] <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr[1] <= int_isr[1] ^ WDATA[1]; // toggle on write
    end
end

// int_Input_r[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_Input_r[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_INPUT_R_DATA_0)
            int_Input_r[31:0] <= (WDATA[31:0] & wmask) | (int_Input_r[31:0] & ~wmask);
    end
end

// int_Input_r[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_Input_r[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_INPUT_R_DATA_1)
            int_Input_r[63:32] <= (WDATA[31:0] & wmask) | (int_Input_r[63:32] & ~wmask);
    end
end

// int_Output_r[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_Output_r[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUTPUT_R_DATA_0)
            int_Output_r[31:0] <= (WDATA[31:0] & wmask) | (int_Output_r[31:0] & ~wmask);
    end
end

// int_Output_r[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_Output_r[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUTPUT_R_DATA_1)
            int_Output_r[63:32] <= (WDATA[31:0] & wmask) | (int_Output_r[63:32] & ~wmask);
    end
end

// int_Weight[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_Weight[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_WEIGHT_DATA_0)
            int_Weight[31:0] <= (WDATA[31:0] & wmask) | (int_Weight[31:0] & ~wmask);
    end
end

// int_Weight[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_Weight[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_WEIGHT_DATA_1)
            int_Weight[63:32] <= (WDATA[31:0] & wmask) | (int_Weight[63:32] & ~wmask);
    end
end

// int_Beta[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_Beta[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_BETA_DATA_0)
            int_Beta[31:0] <= (WDATA[31:0] & wmask) | (int_Beta[31:0] & ~wmask);
    end
end

// int_Beta[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_Beta[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_BETA_DATA_1)
            int_Beta[63:32] <= (WDATA[31:0] & wmask) | (int_Beta[63:32] & ~wmask);
    end
end

// int_InFM_num[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_InFM_num[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_INFM_NUM_DATA_0)
            int_InFM_num[31:0] <= (WDATA[31:0] & wmask) | (int_InFM_num[31:0] & ~wmask);
    end
end

// int_OutFM_num[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_OutFM_num[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUTFM_NUM_DATA_0)
            int_OutFM_num[31:0] <= (WDATA[31:0] & wmask) | (int_OutFM_num[31:0] & ~wmask);
    end
end

// int_Kernel_size[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_Kernel_size[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KERNEL_SIZE_DATA_0)
            int_Kernel_size[31:0] <= (WDATA[31:0] & wmask) | (int_Kernel_size[31:0] & ~wmask);
    end
end

// int_Kernel_stride[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_Kernel_stride[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KERNEL_STRIDE_DATA_0)
            int_Kernel_stride[31:0] <= (WDATA[31:0] & wmask) | (int_Kernel_stride[31:0] & ~wmask);
    end
end

// int_Input_w[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_Input_w[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_INPUT_W_DATA_0)
            int_Input_w[31:0] <= (WDATA[31:0] & wmask) | (int_Input_w[31:0] & ~wmask);
    end
end

// int_Input_h[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_Input_h[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_INPUT_H_DATA_0)
            int_Input_h[31:0] <= (WDATA[31:0] & wmask) | (int_Input_h[31:0] & ~wmask);
    end
end

// int_Padding[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_Padding[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_PADDING_DATA_0)
            int_Padding[31:0] <= (WDATA[31:0] & wmask) | (int_Padding[31:0] & ~wmask);
    end
end

// int_IsNL[0:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_IsNL[0:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_ISNL_DATA_0)
            int_IsNL[0:0] <= (WDATA[31:0] & wmask) | (int_IsNL[0:0] & ~wmask);
    end
end

// int_IsBN[0:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_IsBN[0:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_ISBN_DATA_0)
            int_IsBN[0:0] <= (WDATA[31:0] & wmask) | (int_IsBN[0:0] & ~wmask);
    end
end

// int_TM[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_TM[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_TM_DATA_0)
            int_TM[31:0] <= (WDATA[31:0] & wmask) | (int_TM[31:0] & ~wmask);
    end
end

// int_TN[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_TN[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_TN_DATA_0)
            int_TN[31:0] <= (WDATA[31:0] & wmask) | (int_TN[31:0] & ~wmask);
    end
end

// int_TR[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_TR[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_TR_DATA_0)
            int_TR[31:0] <= (WDATA[31:0] & wmask) | (int_TR[31:0] & ~wmask);
    end
end

// int_TC[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_TC[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_TC_DATA_0)
            int_TC[31:0] <= (WDATA[31:0] & wmask) | (int_TC[31:0] & ~wmask);
    end
end

// int_mLoops[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_mLoops[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_MLOOPS_DATA_0)
            int_mLoops[31:0] <= (WDATA[31:0] & wmask) | (int_mLoops[31:0] & ~wmask);
    end
end

// int_nLoops[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_nLoops[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_NLOOPS_DATA_0)
            int_nLoops[31:0] <= (WDATA[31:0] & wmask) | (int_nLoops[31:0] & ~wmask);
    end
end

// int_rLoops[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_rLoops[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RLOOPS_DATA_0)
            int_rLoops[31:0] <= (WDATA[31:0] & wmask) | (int_rLoops[31:0] & ~wmask);
    end
end

// int_cLoops[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_cLoops[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_CLOOPS_DATA_0)
            int_cLoops[31:0] <= (WDATA[31:0] & wmask) | (int_cLoops[31:0] & ~wmask);
    end
end

// int_LayerType[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_LayerType[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_LAYERTYPE_DATA_0)
            int_LayerType[31:0] <= (WDATA[31:0] & wmask) | (int_LayerType[31:0] & ~wmask);
    end
end

// int_InputQ[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_InputQ[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_INPUTQ_DATA_0)
            int_InputQ[31:0] <= (WDATA[31:0] & wmask) | (int_InputQ[31:0] & ~wmask);
    end
end

// int_OutputQ[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_OutputQ[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUTPUTQ_DATA_0)
            int_OutputQ[31:0] <= (WDATA[31:0] & wmask) | (int_OutputQ[31:0] & ~wmask);
    end
end

// int_WeightQ[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_WeightQ[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_WEIGHTQ_DATA_0)
            int_WeightQ[31:0] <= (WDATA[31:0] & wmask) | (int_WeightQ[31:0] & ~wmask);
    end
end

// int_BetaQ[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_BetaQ[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_BETAQ_DATA_0)
            int_BetaQ[31:0] <= (WDATA[31:0] & wmask) | (int_BetaQ[31:0] & ~wmask);
    end
end


//------------------------Memory logic-------------------

endmodule
