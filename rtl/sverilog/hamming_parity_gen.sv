////////////////////////////////////////////////////////////////
//
//  File name    : hamming_parity_gen.sv
//  Creator      : Wang, Jun (phdbreak[at]gmail.com)
//
//  Hamming code parity generation (combinational circuit)
// 
////////////////////////////////////////////////////////////////

`include "timescale.sv"
`include "define.sv"

module hamming_parity_gen (
    input   pattern_t   i_pattern,
    output  parity_t    o_parity
);

// TODO
assign o_parity = {`PARITY_WIDTH{1'b0}};

endmodule : hamming_parity_gen
