////////////////////////////////////////////////////////////////
//
//  File name    : hamming_enc_model.sv
//  Creator      : Wang, Jun (phdbreak[at]gmail.com)
//
//  Hamming code encoder TLM
// 
////////////////////////////////////////////////////////////////

program hamming_enc_model (
    input   logic       i_en,
    //==========================================================
    input   pattern_t   i_pattern,
    input   logic       i_valid,
    //==========================================================
    input   logic       i_clk
);

////////////////////////////////////////////////////////////////

parity_t    parity;

initial forever begin
    @(posedge i_clk);
    if (i_en && i_valid) begin
        // TODO
    end
end

endprogram : hamming_enc_model
