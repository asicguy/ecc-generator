////////////////////////////////////////////////////////////////
//
//  File name    : rand_err_gen.sv
//  Creator      : Wang, Jun (phdbreak[at]gmail.com)
//
//  Generate error bits randomly
// 
////////////////////////////////////////////////////////////////

`include "timescale.sv"
`include "define.sv"

program rand_err_gen (
    input   logic       i_en,
    //==========================================================
    input   pattern_t   i_pattern,
    input   parity_t    i_parity,
    input   logic       i_valid,
    //==========================================================
    output  pattern_t   o_pattern,
    output  parity_t    o_parity,
    output  logic       o_valid,
    //==========================================================
    input   logic       i_clk
);

////////////////////////////////////////////////////////////////
//  class err_num_t
////////////////////////////////////////////////////////////////
 /// {{{ ///
class err_num_t;
    rand uint   num;
    int         err_rate_zero;

    //==========================================================
    constraint num_constraint {
        num dist {
            1 := `ERR_RATE_SINGLE;
            2 := `ERR_RATE_DOUBLE;
            3 := `ERR_RATE_TRIPLE;
            0 := err_rate_zero;
        };
    }

    //==========================================================
    function new ();
        err_rate_zero = 100 - `ERR_RATE_SINGLE - `ERR_RATE_DOUBLE - `ERR_RATE_TRIPLE;
        assert (err_rate_zero >= 0) else begin
            $fatal("err_rate_zero should not be smaller than 0");
        end
    endfunction : new
endclass : err_num_t
 /// }}} ///

////////////////////////////////////////////////////////////////
//  class err_position_t
////////////////////////////////////////////////////////////////
 /// {{{ ///
class err_position_t;
    rand uint   pos;
    //==========================================================
    constraint pos_constraint {
        pos < (`PATTERN_WIDTH + `PARITY_WIDTH);
    }
endclass : err_position_t
 /// }}} ///

////////////////////////////////////////////////////////////////

err_num_t       err_num;
err_position_t  err_position;
uint            err_positions [3];

int i;

function rand_position ();
    //==========================================================
    // 1st: err_num
    //==========================================================
    err_num.randomize();

    //==========================================================
    // 2nd: err_position
    //==========================================================
    for (i=0; i<err_num.num; i++) begin
        err_position.randomize();
        err_positions[i] = err_position.pos;
    end
endfunction : rand_position

////////////////////////////////////////////////////////////////

initial begin
    err_num = new();
    err_position = new();
end

////////////////////////////////////////////////////////////////

event   done;

initial forever begin
    @(posedge i_clk);
    if (i_en && i_valid) begin
        o_pattern = i_pattern;
        o_parity = i_parity;
        o_valid = 1;
        //==========================================================
        rand_position();
        for (i=0; i<err_num.num; i++) begin
            if (err_positions[i] >= `PATTERN_WIDTH) begin
                o_parity[err_positions[i]-`PATTERN_WIDTH] = ~ o_parity[err_positions[i]-`PATTERN_WIDTH];
            end else begin
                o_pattern[err_positions[i]] = ~ o_pattern[err_positions[i]];
            end
        end
        -> done;
    end else begin
        o_valid = 0;
    end
end

endprogram : rand_err_gen
