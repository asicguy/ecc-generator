////////////////////////////////////////////////////////////////
//
//  File name    : hamming_err_dnc.sv
//  Creator      : Wang, Jun (phdbreak[at]gmail.com)
//
//  Hamming code error detection & correction
// 
////////////////////////////////////////////////////////////////

`include "timescale.sv"
`include "define.sv"

module hamming_err_dnc (
    input   logic       i_en,
    //==========================================================
    input   pattern_t   i_pattern,
    input   logic       i_valid,
    //==========================================================
    output  pattern_t   o_pattern,
    output  parity_t    o_parity,
    output  logic       o_valid,
    //==========================================================
    input   logic       i_clk
);

endmodule : hamming_err_dnc
