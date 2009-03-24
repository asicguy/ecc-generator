////////////////////////////////////////////////////////////////
//
//  File name    : hamming_err_dnc_model.sv
//  Creator      : Wang, Jun (phdbreak[at]gmail.com)
// 
//  Hamming code error detection & correction TLM
// 
////////////////////////////////////////////////////////////////

program hamming_err_dnc_model (
    input   logic       i_en,
    //==========================================================
    input   parity_t    i_syndrome,
    //==========================================================
    input   logic       i_clk
);

////////////////////////////////////////////////////////////////

pattern_t   mask;

initial forever begin
    @(posedge i_clk);
    if (i_en && i_valid) begin
        // TODO
    end
end

endprogram : hamming_err_dnc_model
