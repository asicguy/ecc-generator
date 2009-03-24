////////////////////////////////////////////////////////////////
//
//  File name    : rand_pattern_gen.sv
//  Creator      : Wang, Jun (phdbreak[at]gmail.com)
//
//  Output random pattern every clock cycle
// 
////////////////////////////////////////////////////////////////

`include "timescale.sv"
`include "define.sv"

program rand_pattern_gen (
    input   logic       i_en,
    //==========================================================
    output  pattern_t   o_pattern,
    output  logic       o_valid,
    //==========================================================
    input   logic       i_clk
);

////////////////////////////////////////////////////////////////
//  class rand_pattern_t
//      Generate random patterns
////////////////////////////////////////////////////////////////
class rand_pattern_t;
    rand pattern_t  pattern;
endclass : rand_pattern_t

////////////////////////////////////////////////////////////////

rand_pattern_t  rand_pattern;
event           done;   // for sync

////////////////////////////////////////////////////////////////

initial begin
    rand_pattern = new();
end

////////////////////////////////////////////////////////////////

initial forever begin
    @(posedge i_clk);
    if (i_en && i_valid) begin
        rand_pattern.randomize();
        o_pattern = rand_pattern.pattern;
        o_valid = 1;
        -> done;
    end else begin
        o_valid = 0;
    end
end

endprogram : rand_pattern_gen
