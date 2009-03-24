////////////////////////////////////////////////////////////////
//
//  File name    : tb.sv
//  Creator      : Wang, Jun (phdbreak[at]gmail.com)
//
//  Top module of the testbench
// 
////////////////////////////////////////////////////////////////

`include "timescale.sv"
`include "define.sv"

module tb ();

logic   clk;
logic   en;

////////////////////////////////////////////////////////////////
//  Testbench
//      Random Pattern Generator
////////////////////////////////////////////////////////////////
 /// {{{ ///
pattern_t   pattern_rand;
logic       valid_rand;

rand_pattern_gen u_rand_pattern_gen (
    .i_en(en),
    //==========================================================
    .o_pattern(pattern_rand),
    .o_valid(valid_rand),
    //==========================================================
    .i_clk(clk)
);
 /// }}} ///

////////////////////////////////////////////////////////////////
//  RTL
//      Hamming code encoder
////////////////////////////////////////////////////////////////
 /// {{{ ///
pattern_t   pattern_tx;
parity_t    parity_tx;
logic       valid_tx;

hamming_enc u_hamming_en (
    .i_en(en),
    //==========================================================
    .i_pattern(patter_rand),
    .i_valid(valid_rand),
    //==========================================================
    .o_pattern(pattern_tx),
    .o_pattern(valid_tx),
    //==========================================================
    .i_clk(clk)
);
 /// }}} ///

////////////////////////////////////////////////////////////////
//  TLM
//      Hamming code encoder TLM
////////////////////////////////////////////////////////////////
 /// {{{ ///
hamming_enc_model u_hamming_enc_model (
    .i_en(en),
    //==========================================================
    .i_pattern(patter_rand),
    .i_valid(valid_rand),
    //==========================================================
    .i_clk(clk)
);
 /// }}} ///

////////////////////////////////////////////////////////////////
//  Testbench
//      Random error-bits generator
////////////////////////////////////////////////////////////////
 /// {{{ ///
pattern_t   pattern_rx;
parity_t    parity_rx;
logic       valid_rx;

rand_err_gen u_rand_err_gen (
    .i_en(en),
    //==========================================================
    .i_pattern(pattern_tx),
    .i_parity(parity_tx),
    .i_valid(valid_tx),
    //==========================================================
    .o_pattern(pattern_rx),
    .o_parity(parity_rx),
    .o_valid(valid_rx),
    //==========================================================
    .i_clk(clk)
);
 /// }}} ///

////////////////////////////////////////////////////////////////
//  RTL
//      Hamming code decoder
////////////////////////////////////////////////////////////////
 /// {{{ ///
pattern_t   pattern_dec;
parity_t    syndrome;
logic       valid_dec;

hamming_dec u_hamming_dec (
    .i_en(en),
    //==========================================================
    .i_pattern(pattern_rx),
    .i_parity(parity_rx),
    .i_valid(valid_rx),
    //==========================================================
    .o_pattern(pattern_dec),
    .o_syndrome(syndrome),
    .o_valid(valid_dec),
    //==========================================================
    .i_clk(clk)
);
 /// }}} ///

////////////////////////////////////////////////////////////////
//  RTL
//      Hamming code error Detection & Correction
////////////////////////////////////////////////////////////////
 /// {{{ ///
pattern_t   pattern_ecc;
logic       valid_ecc;
logic [1:0] err_type_ecc;

hamming_err_dnc u_hamming_err_dnc (
    .i_en(en),
    //==========================================================
    .i_pattern(pattern_dec),
    .i_parity(parity_dec),
    .i_valid(valid_dec),
    //==========================================================
    .o_pattern(pattern_ecc),
    .o_valid(valid_ecc),
    .o_err_type(err_type),
    //==========================================================
    .i_clk(clk)
);
 /// }}} ///

////////////////////////////////////////////////////////////////
//  TLM
//      Hamming code error Detection & Correction TLM
////////////////////////////////////////////////////////////////
 /// {{{ ///
hamming_err_dnc_model u_hamming_err_dnc_model (
    .i_en(en),
    //==========================================================
    .i_pattern(pattern_dec),
    .i_parity(parity_dec),
    .i_valid(valid_dec),
    //==========================================================
    .i_clk(clk)
);
 /// }}} ///

////////////////////////////////////////////////////////////////
//  Testbench
//      Checker
////////////////////////////////////////////////////////////////

checker u_checker ();

endmodule
