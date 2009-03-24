////////////////////////////////////////////////////////////////
//
//  File name    : hamming_mask_gen.sv
//  Creator      : Wang, Jun (phdbreak[at]gmail.com)
//
//  Hamming code mask generation (combinational circuit)
// 
////////////////////////////////////////////////////////////////

`include "timescale.sv"
`include "define.sv"

module hamming_mask_gen (
    input   parity_t    i_syndrome,
    output  pattern_t   o_mask
);

// TODO
assign o_mask = {`PATTERN_WIDTH{1'b0}};

endmodule : hamming_mask_gen
