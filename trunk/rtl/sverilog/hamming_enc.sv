////////////////////////////////////////////////////////////////
//
//  File name    : hamming_enc.sv
//  Creator      : Wang, Jun (phdbreak[at]gmail.com)
//
//  Hamming code encoder
// 
////////////////////////////////////////////////////////////////

`include "timescale.sv"
`include "define.sv"

module hamming_enc (
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

////////////////////////////////////////////////////////////////

reg [`PATTERN_WIDTH-1:0]    pattern;
reg                         valid;

always @ (posedge i_clk) begin
    if (i_en && i_valid) begin
        pattern <= #`TP i_pattern;
        valid   <= #`TP i_valid;
    end
end

////////////////////////////////////////////////////////////////

hamming_parity_gen u_hamming_parity_gen (
    .i_pattern(pattern);
    .o_parity(o_parity);
);

////////////////////////////////////////////////////////////////

assign o_pattern = pattern;
assign o_valid = valid;

endmodule : hamming_enc
