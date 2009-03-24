////////////////////////////////////////////////////////////////
//
//  File name    : hamming_dec.sv
//  Creator      : Wang, Jun (phdbreak[at]gmail.com)
//
//  Hamming code decoder
// 
////////////////////////////////////////////////////////////////

`include "timescale.sv"
`include "define.sv"

module hamming_dec (
    input   logic       i_en,
    //==========================================================
    input   pattern_t   i_pattern,
    input   logic       i_valid,
    //==========================================================
    output  parity_t    o_parity,
    output  logic       o_valid,
    //==========================================================
    input   logic       i_clk
);

endmodule : hamming_dec
