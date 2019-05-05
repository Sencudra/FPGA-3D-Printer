// (C) 2001-2018 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.



// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// $Id: //acds/rel/18.1std/ip/merlin/altera_merlin_router/altera_merlin_router.sv.terp#1 $
// $Revision: #1 $
// $Date: 2018/07/18 $
// $Author: psgswbuild $

// -------------------------------------------------------
// Merlin Router
//
// Asserts the appropriate one-hot encoded channel based on 
// either (a) the address or (b) the dest id. The DECODER_TYPE
// parameter controls this behaviour. 0 means address decoder,
// 1 means dest id decoder.
//
// In the case of (a), it also sets the destination id.
// -------------------------------------------------------

`timescale 1 ns / 1 ns

module soc_system_mm_interconnect_1_router_default_decode
  #(
     parameter DEFAULT_CHANNEL = 1,
               DEFAULT_WR_CHANNEL = -1,
               DEFAULT_RD_CHANNEL = -1,
               DEFAULT_DESTID = 0 
   )
  (output [96 - 92 : 0] default_destination_id,
   output [30-1 : 0] default_wr_channel,
   output [30-1 : 0] default_rd_channel,
   output [30-1 : 0] default_src_channel
  );

  assign default_destination_id = 
    DEFAULT_DESTID[96 - 92 : 0];

  generate
    if (DEFAULT_CHANNEL == -1) begin : no_default_channel_assignment
      assign default_src_channel = '0;
    end
    else begin : default_channel_assignment
      assign default_src_channel = 30'b1 << DEFAULT_CHANNEL;
    end
  endgenerate

  generate
    if (DEFAULT_RD_CHANNEL == -1) begin : no_default_rw_channel_assignment
      assign default_wr_channel = '0;
      assign default_rd_channel = '0;
    end
    else begin : default_rw_channel_assignment
      assign default_wr_channel = 30'b1 << DEFAULT_WR_CHANNEL;
      assign default_rd_channel = 30'b1 << DEFAULT_RD_CHANNEL;
    end
  endgenerate

endmodule


module soc_system_mm_interconnect_1_router
(
    // -------------------
    // Clock & Reset
    // -------------------
    input clk,
    input reset,

    // -------------------
    // Command Sink (Input)
    // -------------------
    input                       sink_valid,
    input  [110-1 : 0]    sink_data,
    input                       sink_startofpacket,
    input                       sink_endofpacket,
    output                      sink_ready,

    // -------------------
    // Command Source (Output)
    // -------------------
    output                          src_valid,
    output reg [110-1    : 0] src_data,
    output reg [30-1 : 0] src_channel,
    output                          src_startofpacket,
    output                          src_endofpacket,
    input                           src_ready
);

    // -------------------------------------------------------
    // Local parameters and variables
    // -------------------------------------------------------
    localparam PKT_ADDR_H = 67;
    localparam PKT_ADDR_L = 36;
    localparam PKT_DEST_ID_H = 96;
    localparam PKT_DEST_ID_L = 92;
    localparam PKT_PROTECTION_H = 100;
    localparam PKT_PROTECTION_L = 98;
    localparam ST_DATA_W = 110;
    localparam ST_CHANNEL_W = 30;
    localparam DECODER_TYPE = 0;

    localparam PKT_TRANS_WRITE = 70;
    localparam PKT_TRANS_READ  = 71;

    localparam PKT_ADDR_W = PKT_ADDR_H-PKT_ADDR_L + 1;
    localparam PKT_DEST_ID_W = PKT_DEST_ID_H-PKT_DEST_ID_L + 1;



    // -------------------------------------------------------
    // Figure out the number of bits to mask off for each slave span
    // during address decoding
    // -------------------------------------------------------
    localparam PAD0 = log2ceil(64'h1008 - 64'h1000); 
    localparam PAD1 = log2ceil(64'h2008 - 64'h2000); 
    localparam PAD2 = log2ceil(64'h3010 - 64'h3000); 
    localparam PAD3 = log2ceil(64'h3030 - 64'h3020); 
    localparam PAD4 = log2ceil(64'h3050 - 64'h3040); 
    localparam PAD5 = log2ceil(64'h4010 - 64'h4000); 
    localparam PAD6 = log2ceil(64'h4030 - 64'h4020); 
    localparam PAD7 = log2ceil(64'h4050 - 64'h4040); 
    localparam PAD8 = log2ceil(64'h40b0 - 64'h40a0); 
    localparam PAD9 = log2ceil(64'h5010 - 64'h5000); 
    localparam PAD10 = log2ceil(64'h5030 - 64'h5020); 
    localparam PAD11 = log2ceil(64'h5050 - 64'h5040); 
    localparam PAD12 = log2ceil(64'h5070 - 64'h5060); 
    localparam PAD13 = log2ceil(64'h5090 - 64'h5080); 
    localparam PAD14 = log2ceil(64'h50b0 - 64'h50a0); 
    localparam PAD15 = log2ceil(64'h50d0 - 64'h50c0); 
    localparam PAD16 = log2ceil(64'h50f0 - 64'h50e0); 
    localparam PAD17 = log2ceil(64'h5110 - 64'h5100); 
    localparam PAD18 = log2ceil(64'h5130 - 64'h5120); 
    localparam PAD19 = log2ceil(64'h5150 - 64'h5140); 
    localparam PAD20 = log2ceil(64'h5170 - 64'h5160); 
    localparam PAD21 = log2ceil(64'h5210 - 64'h5200); 
    localparam PAD22 = log2ceil(64'h6010 - 64'h6000); 
    localparam PAD23 = log2ceil(64'h6030 - 64'h6020); 
    localparam PAD24 = log2ceil(64'h6050 - 64'h6040); 
    localparam PAD25 = log2ceil(64'h6070 - 64'h6060); 
    localparam PAD26 = log2ceil(64'h6090 - 64'h6080); 
    localparam PAD27 = log2ceil(64'h60b0 - 64'h60a0); 
    localparam PAD28 = log2ceil(64'h60d0 - 64'h60c0); 
    localparam PAD29 = log2ceil(64'h30100 - 64'h30000); 
    // -------------------------------------------------------
    // Work out which address bits are significant based on the
    // address range of the slaves. If the required width is too
    // large or too small, we use the address field width instead.
    // -------------------------------------------------------
    localparam ADDR_RANGE = 64'h30100;
    localparam RANGE_ADDR_WIDTH = log2ceil(ADDR_RANGE);
    localparam OPTIMIZED_ADDR_H = (RANGE_ADDR_WIDTH > PKT_ADDR_W) ||
                                  (RANGE_ADDR_WIDTH == 0) ?
                                        PKT_ADDR_H :
                                        PKT_ADDR_L + RANGE_ADDR_WIDTH - 1;

    localparam RG = RANGE_ADDR_WIDTH-1;
    localparam REAL_ADDRESS_RANGE = OPTIMIZED_ADDR_H - PKT_ADDR_L;

      reg [PKT_ADDR_W-1 : 0] address;
      always @* begin
        address = {PKT_ADDR_W{1'b0}};
        address [REAL_ADDRESS_RANGE:0] = sink_data[OPTIMIZED_ADDR_H : PKT_ADDR_L];
      end   

    // -------------------------------------------------------
    // Pass almost everything through, untouched
    // -------------------------------------------------------
    assign sink_ready        = src_ready;
    assign src_valid         = sink_valid;
    assign src_startofpacket = sink_startofpacket;
    assign src_endofpacket   = sink_endofpacket;
    wire [PKT_DEST_ID_W-1:0] default_destid;
    wire [30-1 : 0] default_src_channel;




    // -------------------------------------------------------
    // Write and read transaction signals
    // -------------------------------------------------------
    wire read_transaction;
    assign read_transaction  = sink_data[PKT_TRANS_READ];


    soc_system_mm_interconnect_1_router_default_decode the_default_decode(
      .default_destination_id (default_destid),
      .default_wr_channel   (),
      .default_rd_channel   (),
      .default_src_channel  (default_src_channel)
    );

    always @* begin
        src_data    = sink_data;
        src_channel = default_src_channel;
        src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = default_destid;

        // --------------------------------------------------
        // Address Decoder
        // Sets the channel and destination ID based on the address
        // --------------------------------------------------

    // ( 0x1000 .. 0x1008 )
    if ( {address[RG:PAD0],{PAD0{1'b0}}} == 18'h1000  && read_transaction  ) begin
            src_channel = 30'b000000000000000000000000000100;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 22;
    end

    // ( 0x2000 .. 0x2008 )
    if ( {address[RG:PAD1],{PAD1{1'b0}}} == 18'h2000   ) begin
            src_channel = 30'b000000000000000000000000000001;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 8;
    end

    // ( 0x3000 .. 0x3010 )
    if ( {address[RG:PAD2],{PAD2{1'b0}}} == 18'h3000   ) begin
            src_channel = 30'b000000000000000000000000100000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 1;
    end

    // ( 0x3020 .. 0x3030 )
    if ( {address[RG:PAD3],{PAD3{1'b0}}} == 18'h3020   ) begin
            src_channel = 30'b000000000000000000000000001000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 9;
    end

    // ( 0x3040 .. 0x3050 )
    if ( {address[RG:PAD4],{PAD4{1'b0}}} == 18'h3040   ) begin
            src_channel = 30'b000000000000000000000000010000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 3;
    end

    // ( 0x4000 .. 0x4010 )
    if ( {address[RG:PAD5],{PAD5{1'b0}}} == 18'h4000  && read_transaction  ) begin
            src_channel = 30'b000000000000000000100000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 6;
    end

    // ( 0x4020 .. 0x4030 )
    if ( {address[RG:PAD6],{PAD6{1'b0}}} == 18'h4020   ) begin
            src_channel = 30'b000001000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 7;
    end

    // ( 0x4040 .. 0x4050 )
    if ( {address[RG:PAD7],{PAD7{1'b0}}} == 18'h4040   ) begin
            src_channel = 30'b000010000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 2;
    end

    // ( 0x40a0 .. 0x40b0 )
    if ( {address[RG:PAD8],{PAD8{1'b0}}} == 18'h40a0   ) begin
            src_channel = 30'b000000000000000000010000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 5;
    end

    // ( 0x5000 .. 0x5010 )
    if ( {address[RG:PAD9],{PAD9{1'b0}}} == 18'h5000   ) begin
            src_channel = 30'b000000000000000001000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 10;
    end

    // ( 0x5020 .. 0x5030 )
    if ( {address[RG:PAD10],{PAD10{1'b0}}} == 18'h5020  && read_transaction  ) begin
            src_channel = 30'b000000000000000010000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 11;
    end

    // ( 0x5040 .. 0x5050 )
    if ( {address[RG:PAD11],{PAD11{1'b0}}} == 18'h5040   ) begin
            src_channel = 30'b000000000000000100000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 13;
    end

    // ( 0x5060 .. 0x5070 )
    if ( {address[RG:PAD12],{PAD12{1'b0}}} == 18'h5060  && read_transaction  ) begin
            src_channel = 30'b000000000000001000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 14;
    end

    // ( 0x5080 .. 0x5090 )
    if ( {address[RG:PAD13],{PAD13{1'b0}}} == 18'h5080   ) begin
            src_channel = 30'b000000000000010000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 16;
    end

    // ( 0x50a0 .. 0x50b0 )
    if ( {address[RG:PAD14],{PAD14{1'b0}}} == 18'h50a0  && read_transaction  ) begin
            src_channel = 30'b000000000000100000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 17;
    end

    // ( 0x50c0 .. 0x50d0 )
    if ( {address[RG:PAD15],{PAD15{1'b0}}} == 18'h50c0   ) begin
            src_channel = 30'b000000000001000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 19;
    end

    // ( 0x50e0 .. 0x50f0 )
    if ( {address[RG:PAD16],{PAD16{1'b0}}} == 18'h50e0  && read_transaction  ) begin
            src_channel = 30'b000000000010000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 20;
    end

    // ( 0x5100 .. 0x5110 )
    if ( {address[RG:PAD17],{PAD17{1'b0}}} == 18'h5100   ) begin
            src_channel = 30'b000000000100000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 12;
    end

    // ( 0x5120 .. 0x5130 )
    if ( {address[RG:PAD18],{PAD18{1'b0}}} == 18'h5120   ) begin
            src_channel = 30'b000000001000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 15;
    end

    // ( 0x5140 .. 0x5150 )
    if ( {address[RG:PAD19],{PAD19{1'b0}}} == 18'h5140   ) begin
            src_channel = 30'b000000010000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 18;
    end

    // ( 0x5160 .. 0x5170 )
    if ( {address[RG:PAD20],{PAD20{1'b0}}} == 18'h5160   ) begin
            src_channel = 30'b000000100000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 21;
    end

    // ( 0x5200 .. 0x5210 )
    if ( {address[RG:PAD21],{PAD21{1'b0}}} == 18'h5200  && read_transaction  ) begin
            src_channel = 30'b000000000000000000000001000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 4;
    end

    // ( 0x6000 .. 0x6010 )
    if ( {address[RG:PAD22],{PAD22{1'b0}}} == 18'h6000  && read_transaction  ) begin
            src_channel = 30'b000000000000000000000010000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 26;
    end

    // ( 0x6020 .. 0x6030 )
    if ( {address[RG:PAD23],{PAD23{1'b0}}} == 18'h6020  && read_transaction  ) begin
            src_channel = 30'b000000000000000000000100000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 23;
    end

    // ( 0x6040 .. 0x6050 )
    if ( {address[RG:PAD24],{PAD24{1'b0}}} == 18'h6040  && read_transaction  ) begin
            src_channel = 30'b000000000000000000001000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 24;
    end

    // ( 0x6060 .. 0x6070 )
    if ( {address[RG:PAD25],{PAD25{1'b0}}} == 18'h6060   ) begin
            src_channel = 30'b000100000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 25;
    end

    // ( 0x6080 .. 0x6090 )
    if ( {address[RG:PAD26],{PAD26{1'b0}}} == 18'h6080   ) begin
            src_channel = 30'b001000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 27;
    end

    // ( 0x60a0 .. 0x60b0 )
    if ( {address[RG:PAD27],{PAD27{1'b0}}} == 18'h60a0   ) begin
            src_channel = 30'b010000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 28;
    end

    // ( 0x60c0 .. 0x60d0 )
    if ( {address[RG:PAD28],{PAD28{1'b0}}} == 18'h60c0   ) begin
            src_channel = 30'b100000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 29;
    end

    // ( 0x30000 .. 0x30100 )
    if ( {address[RG:PAD29],{PAD29{1'b0}}} == 18'h30000   ) begin
            src_channel = 30'b000000000000000000000000000010;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 0;
    end

end


    // --------------------------------------------------
    // Ceil(log2()) function
    // --------------------------------------------------
    function integer log2ceil;
        input reg[65:0] val;
        reg [65:0] i;

        begin
            i = 1;
            log2ceil = 0;

            while (i < val) begin
                log2ceil = log2ceil + 1;
                i = i << 1;
            end
        end
    endfunction

endmodule


