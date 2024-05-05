// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1ns/1ps
module FPGA_Acc_CTRL_BUS_s_axi
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
    output wire [63:0]                   ifm,
    output wire [63:0]                   ofm,
    output wire [63:0]                   weight,
    output wire [63:0]                   bias,
    output wire [31:0]                   k_s_pad_ltype,
    output wire [31:0]                   iofm_num,
    output wire [31:0]                   ifm_w_h,
    output wire [31:0]                   ofm_w_h,
    output wire [31:0]                   TRTC,
    output wire [31:0]                   TMTN,
    output wire [31:0]                   OFM_num_bound,
    output wire [31:0]                   mLoopsxTM,
    output wire [31:0]                   mLoops_a1xTM,
    output wire [15:0]                   pad_val,
    output wire [31:0]                   TRowTCol,
    output wire [31:0]                   IHW,
    output wire [31:0]                   OHW,
    output wire [31:0]                   KK_INumxKK,
    output wire [31:0]                   en_bits,
    output wire [31:0]                   WeightQ,
    output wire [31:0]                   BetaQ,
    output wire [31:0]                   InputQ,
    output wire [31:0]                   OutputQ,
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
// 0x10 : Data signal of ifm
//        bit 31~0 - ifm[31:0] (Read/Write)
// 0x14 : Data signal of ifm
//        bit 31~0 - ifm[63:32] (Read/Write)
// 0x18 : reserved
// 0x1c : Data signal of ofm
//        bit 31~0 - ofm[31:0] (Read/Write)
// 0x20 : Data signal of ofm
//        bit 31~0 - ofm[63:32] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of weight
//        bit 31~0 - weight[31:0] (Read/Write)
// 0x2c : Data signal of weight
//        bit 31~0 - weight[63:32] (Read/Write)
// 0x30 : reserved
// 0x34 : Data signal of bias
//        bit 31~0 - bias[31:0] (Read/Write)
// 0x38 : Data signal of bias
//        bit 31~0 - bias[63:32] (Read/Write)
// 0x3c : reserved
// 0x40 : Data signal of k_s_pad_ltype
//        bit 31~0 - k_s_pad_ltype[31:0] (Read/Write)
// 0x44 : reserved
// 0x48 : Data signal of iofm_num
//        bit 31~0 - iofm_num[31:0] (Read/Write)
// 0x4c : reserved
// 0x50 : Data signal of ifm_w_h
//        bit 31~0 - ifm_w_h[31:0] (Read/Write)
// 0x54 : reserved
// 0x58 : Data signal of ofm_w_h
//        bit 31~0 - ofm_w_h[31:0] (Read/Write)
// 0x5c : reserved
// 0x60 : Data signal of TRTC
//        bit 31~0 - TRTC[31:0] (Read/Write)
// 0x64 : reserved
// 0x68 : Data signal of TMTN
//        bit 31~0 - TMTN[31:0] (Read/Write)
// 0x6c : reserved
// 0x70 : Data signal of OFM_num_bound
//        bit 31~0 - OFM_num_bound[31:0] (Read/Write)
// 0x74 : reserved
// 0x78 : Data signal of mLoopsxTM
//        bit 31~0 - mLoopsxTM[31:0] (Read/Write)
// 0x7c : reserved
// 0x80 : Data signal of mLoops_a1xTM
//        bit 31~0 - mLoops_a1xTM[31:0] (Read/Write)
// 0x84 : reserved
// 0x88 : Data signal of pad_val
//        bit 15~0 - pad_val[15:0] (Read/Write)
//        others   - reserved
// 0x8c : reserved
// 0x90 : Data signal of TRowTCol
//        bit 31~0 - TRowTCol[31:0] (Read/Write)
// 0x94 : reserved
// 0x98 : Data signal of IHW
//        bit 31~0 - IHW[31:0] (Read/Write)
// 0x9c : reserved
// 0xa0 : Data signal of OHW
//        bit 31~0 - OHW[31:0] (Read/Write)
// 0xa4 : reserved
// 0xa8 : Data signal of KK_INumxKK
//        bit 31~0 - KK_INumxKK[31:0] (Read/Write)
// 0xac : reserved
// 0xb0 : Data signal of en_bits
//        bit 31~0 - en_bits[31:0] (Read/Write)
// 0xb4 : reserved
// 0xb8 : Data signal of WeightQ
//        bit 31~0 - WeightQ[31:0] (Read/Write)
// 0xbc : reserved
// 0xc0 : Data signal of BetaQ
//        bit 31~0 - BetaQ[31:0] (Read/Write)
// 0xc4 : reserved
// 0xc8 : Data signal of InputQ
//        bit 31~0 - InputQ[31:0] (Read/Write)
// 0xcc : reserved
// 0xd0 : Data signal of OutputQ
//        bit 31~0 - OutputQ[31:0] (Read/Write)
// 0xd4 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

//------------------------Parameter----------------------
localparam
    ADDR_AP_CTRL              = 8'h00,
    ADDR_GIE                  = 8'h04,
    ADDR_IER                  = 8'h08,
    ADDR_ISR                  = 8'h0c,
    ADDR_IFM_DATA_0           = 8'h10,
    ADDR_IFM_DATA_1           = 8'h14,
    ADDR_IFM_CTRL             = 8'h18,
    ADDR_OFM_DATA_0           = 8'h1c,
    ADDR_OFM_DATA_1           = 8'h20,
    ADDR_OFM_CTRL             = 8'h24,
    ADDR_WEIGHT_DATA_0        = 8'h28,
    ADDR_WEIGHT_DATA_1        = 8'h2c,
    ADDR_WEIGHT_CTRL          = 8'h30,
    ADDR_BIAS_DATA_0          = 8'h34,
    ADDR_BIAS_DATA_1          = 8'h38,
    ADDR_BIAS_CTRL            = 8'h3c,
    ADDR_K_S_PAD_LTYPE_DATA_0 = 8'h40,
    ADDR_K_S_PAD_LTYPE_CTRL   = 8'h44,
    ADDR_IOFM_NUM_DATA_0      = 8'h48,
    ADDR_IOFM_NUM_CTRL        = 8'h4c,
    ADDR_IFM_W_H_DATA_0       = 8'h50,
    ADDR_IFM_W_H_CTRL         = 8'h54,
    ADDR_OFM_W_H_DATA_0       = 8'h58,
    ADDR_OFM_W_H_CTRL         = 8'h5c,
    ADDR_TRTC_DATA_0          = 8'h60,
    ADDR_TRTC_CTRL            = 8'h64,
    ADDR_TMTN_DATA_0          = 8'h68,
    ADDR_TMTN_CTRL            = 8'h6c,
    ADDR_OFM_NUM_BOUND_DATA_0 = 8'h70,
    ADDR_OFM_NUM_BOUND_CTRL   = 8'h74,
    ADDR_MLOOPSXTM_DATA_0     = 8'h78,
    ADDR_MLOOPSXTM_CTRL       = 8'h7c,
    ADDR_MLOOPS_A1XTM_DATA_0  = 8'h80,
    ADDR_MLOOPS_A1XTM_CTRL    = 8'h84,
    ADDR_PAD_VAL_DATA_0       = 8'h88,
    ADDR_PAD_VAL_CTRL         = 8'h8c,
    ADDR_TROWTCOL_DATA_0      = 8'h90,
    ADDR_TROWTCOL_CTRL        = 8'h94,
    ADDR_IHW_DATA_0           = 8'h98,
    ADDR_IHW_CTRL             = 8'h9c,
    ADDR_OHW_DATA_0           = 8'ha0,
    ADDR_OHW_CTRL             = 8'ha4,
    ADDR_KK_INUMXKK_DATA_0    = 8'ha8,
    ADDR_KK_INUMXKK_CTRL      = 8'hac,
    ADDR_EN_BITS_DATA_0       = 8'hb0,
    ADDR_EN_BITS_CTRL         = 8'hb4,
    ADDR_WEIGHTQ_DATA_0       = 8'hb8,
    ADDR_WEIGHTQ_CTRL         = 8'hbc,
    ADDR_BETAQ_DATA_0         = 8'hc0,
    ADDR_BETAQ_CTRL           = 8'hc4,
    ADDR_INPUTQ_DATA_0        = 8'hc8,
    ADDR_INPUTQ_CTRL          = 8'hcc,
    ADDR_OUTPUTQ_DATA_0       = 8'hd0,
    ADDR_OUTPUTQ_CTRL         = 8'hd4,
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
    reg  [63:0]                   int_ifm = 'b0;
    reg  [63:0]                   int_ofm = 'b0;
    reg  [63:0]                   int_weight = 'b0;
    reg  [63:0]                   int_bias = 'b0;
    reg  [31:0]                   int_k_s_pad_ltype = 'b0;
    reg  [31:0]                   int_iofm_num = 'b0;
    reg  [31:0]                   int_ifm_w_h = 'b0;
    reg  [31:0]                   int_ofm_w_h = 'b0;
    reg  [31:0]                   int_TRTC = 'b0;
    reg  [31:0]                   int_TMTN = 'b0;
    reg  [31:0]                   int_OFM_num_bound = 'b0;
    reg  [31:0]                   int_mLoopsxTM = 'b0;
    reg  [31:0]                   int_mLoops_a1xTM = 'b0;
    reg  [15:0]                   int_pad_val = 'b0;
    reg  [31:0]                   int_TRowTCol = 'b0;
    reg  [31:0]                   int_IHW = 'b0;
    reg  [31:0]                   int_OHW = 'b0;
    reg  [31:0]                   int_KK_INumxKK = 'b0;
    reg  [31:0]                   int_en_bits = 'b0;
    reg  [31:0]                   int_WeightQ = 'b0;
    reg  [31:0]                   int_BetaQ = 'b0;
    reg  [31:0]                   int_InputQ = 'b0;
    reg  [31:0]                   int_OutputQ = 'b0;

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
                ADDR_IFM_DATA_0: begin
                    rdata <= int_ifm[31:0];
                end
                ADDR_IFM_DATA_1: begin
                    rdata <= int_ifm[63:32];
                end
                ADDR_OFM_DATA_0: begin
                    rdata <= int_ofm[31:0];
                end
                ADDR_OFM_DATA_1: begin
                    rdata <= int_ofm[63:32];
                end
                ADDR_WEIGHT_DATA_0: begin
                    rdata <= int_weight[31:0];
                end
                ADDR_WEIGHT_DATA_1: begin
                    rdata <= int_weight[63:32];
                end
                ADDR_BIAS_DATA_0: begin
                    rdata <= int_bias[31:0];
                end
                ADDR_BIAS_DATA_1: begin
                    rdata <= int_bias[63:32];
                end
                ADDR_K_S_PAD_LTYPE_DATA_0: begin
                    rdata <= int_k_s_pad_ltype[31:0];
                end
                ADDR_IOFM_NUM_DATA_0: begin
                    rdata <= int_iofm_num[31:0];
                end
                ADDR_IFM_W_H_DATA_0: begin
                    rdata <= int_ifm_w_h[31:0];
                end
                ADDR_OFM_W_H_DATA_0: begin
                    rdata <= int_ofm_w_h[31:0];
                end
                ADDR_TRTC_DATA_0: begin
                    rdata <= int_TRTC[31:0];
                end
                ADDR_TMTN_DATA_0: begin
                    rdata <= int_TMTN[31:0];
                end
                ADDR_OFM_NUM_BOUND_DATA_0: begin
                    rdata <= int_OFM_num_bound[31:0];
                end
                ADDR_MLOOPSXTM_DATA_0: begin
                    rdata <= int_mLoopsxTM[31:0];
                end
                ADDR_MLOOPS_A1XTM_DATA_0: begin
                    rdata <= int_mLoops_a1xTM[31:0];
                end
                ADDR_PAD_VAL_DATA_0: begin
                    rdata <= int_pad_val[15:0];
                end
                ADDR_TROWTCOL_DATA_0: begin
                    rdata <= int_TRowTCol[31:0];
                end
                ADDR_IHW_DATA_0: begin
                    rdata <= int_IHW[31:0];
                end
                ADDR_OHW_DATA_0: begin
                    rdata <= int_OHW[31:0];
                end
                ADDR_KK_INUMXKK_DATA_0: begin
                    rdata <= int_KK_INumxKK[31:0];
                end
                ADDR_EN_BITS_DATA_0: begin
                    rdata <= int_en_bits[31:0];
                end
                ADDR_WEIGHTQ_DATA_0: begin
                    rdata <= int_WeightQ[31:0];
                end
                ADDR_BETAQ_DATA_0: begin
                    rdata <= int_BetaQ[31:0];
                end
                ADDR_INPUTQ_DATA_0: begin
                    rdata <= int_InputQ[31:0];
                end
                ADDR_OUTPUTQ_DATA_0: begin
                    rdata <= int_OutputQ[31:0];
                end
            endcase
        end
    end
end


//------------------------Register logic-----------------
assign interrupt     = int_gie & (|int_isr);
assign ap_start      = int_ap_start;
assign ifm           = int_ifm;
assign ofm           = int_ofm;
assign weight        = int_weight;
assign bias          = int_bias;
assign k_s_pad_ltype = int_k_s_pad_ltype;
assign iofm_num      = int_iofm_num;
assign ifm_w_h       = int_ifm_w_h;
assign ofm_w_h       = int_ofm_w_h;
assign TRTC          = int_TRTC;
assign TMTN          = int_TMTN;
assign OFM_num_bound = int_OFM_num_bound;
assign mLoopsxTM     = int_mLoopsxTM;
assign mLoops_a1xTM  = int_mLoops_a1xTM;
assign pad_val       = int_pad_val;
assign TRowTCol      = int_TRowTCol;
assign IHW           = int_IHW;
assign OHW           = int_OHW;
assign KK_INumxKK    = int_KK_INumxKK;
assign en_bits       = int_en_bits;
assign WeightQ       = int_WeightQ;
assign BetaQ         = int_BetaQ;
assign InputQ        = int_InputQ;
assign OutputQ       = int_OutputQ;
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

// int_ifm[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_ifm[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IFM_DATA_0)
            int_ifm[31:0] <= (WDATA[31:0] & wmask) | (int_ifm[31:0] & ~wmask);
    end
end

// int_ifm[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_ifm[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IFM_DATA_1)
            int_ifm[63:32] <= (WDATA[31:0] & wmask) | (int_ifm[63:32] & ~wmask);
    end
end

// int_ofm[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_ofm[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OFM_DATA_0)
            int_ofm[31:0] <= (WDATA[31:0] & wmask) | (int_ofm[31:0] & ~wmask);
    end
end

// int_ofm[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_ofm[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OFM_DATA_1)
            int_ofm[63:32] <= (WDATA[31:0] & wmask) | (int_ofm[63:32] & ~wmask);
    end
end

// int_weight[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_weight[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_WEIGHT_DATA_0)
            int_weight[31:0] <= (WDATA[31:0] & wmask) | (int_weight[31:0] & ~wmask);
    end
end

// int_weight[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_weight[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_WEIGHT_DATA_1)
            int_weight[63:32] <= (WDATA[31:0] & wmask) | (int_weight[63:32] & ~wmask);
    end
end

// int_bias[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_bias[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_BIAS_DATA_0)
            int_bias[31:0] <= (WDATA[31:0] & wmask) | (int_bias[31:0] & ~wmask);
    end
end

// int_bias[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_bias[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_BIAS_DATA_1)
            int_bias[63:32] <= (WDATA[31:0] & wmask) | (int_bias[63:32] & ~wmask);
    end
end

// int_k_s_pad_ltype[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_k_s_pad_ltype[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_K_S_PAD_LTYPE_DATA_0)
            int_k_s_pad_ltype[31:0] <= (WDATA[31:0] & wmask) | (int_k_s_pad_ltype[31:0] & ~wmask);
    end
end

// int_iofm_num[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_iofm_num[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IOFM_NUM_DATA_0)
            int_iofm_num[31:0] <= (WDATA[31:0] & wmask) | (int_iofm_num[31:0] & ~wmask);
    end
end

// int_ifm_w_h[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_ifm_w_h[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IFM_W_H_DATA_0)
            int_ifm_w_h[31:0] <= (WDATA[31:0] & wmask) | (int_ifm_w_h[31:0] & ~wmask);
    end
end

// int_ofm_w_h[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_ofm_w_h[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OFM_W_H_DATA_0)
            int_ofm_w_h[31:0] <= (WDATA[31:0] & wmask) | (int_ofm_w_h[31:0] & ~wmask);
    end
end

// int_TRTC[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_TRTC[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_TRTC_DATA_0)
            int_TRTC[31:0] <= (WDATA[31:0] & wmask) | (int_TRTC[31:0] & ~wmask);
    end
end

// int_TMTN[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_TMTN[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_TMTN_DATA_0)
            int_TMTN[31:0] <= (WDATA[31:0] & wmask) | (int_TMTN[31:0] & ~wmask);
    end
end

// int_OFM_num_bound[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_OFM_num_bound[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OFM_NUM_BOUND_DATA_0)
            int_OFM_num_bound[31:0] <= (WDATA[31:0] & wmask) | (int_OFM_num_bound[31:0] & ~wmask);
    end
end

// int_mLoopsxTM[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_mLoopsxTM[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_MLOOPSXTM_DATA_0)
            int_mLoopsxTM[31:0] <= (WDATA[31:0] & wmask) | (int_mLoopsxTM[31:0] & ~wmask);
    end
end

// int_mLoops_a1xTM[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_mLoops_a1xTM[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_MLOOPS_A1XTM_DATA_0)
            int_mLoops_a1xTM[31:0] <= (WDATA[31:0] & wmask) | (int_mLoops_a1xTM[31:0] & ~wmask);
    end
end

// int_pad_val[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_pad_val[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_PAD_VAL_DATA_0)
            int_pad_val[15:0] <= (WDATA[31:0] & wmask) | (int_pad_val[15:0] & ~wmask);
    end
end

// int_TRowTCol[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_TRowTCol[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_TROWTCOL_DATA_0)
            int_TRowTCol[31:0] <= (WDATA[31:0] & wmask) | (int_TRowTCol[31:0] & ~wmask);
    end
end

// int_IHW[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_IHW[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IHW_DATA_0)
            int_IHW[31:0] <= (WDATA[31:0] & wmask) | (int_IHW[31:0] & ~wmask);
    end
end

// int_OHW[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_OHW[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OHW_DATA_0)
            int_OHW[31:0] <= (WDATA[31:0] & wmask) | (int_OHW[31:0] & ~wmask);
    end
end

// int_KK_INumxKK[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_KK_INumxKK[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KK_INUMXKK_DATA_0)
            int_KK_INumxKK[31:0] <= (WDATA[31:0] & wmask) | (int_KK_INumxKK[31:0] & ~wmask);
    end
end

// int_en_bits[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_en_bits[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EN_BITS_DATA_0)
            int_en_bits[31:0] <= (WDATA[31:0] & wmask) | (int_en_bits[31:0] & ~wmask);
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


//------------------------Memory logic-------------------

endmodule
