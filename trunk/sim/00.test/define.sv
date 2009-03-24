`ifndef DEFINE_SV
`define DEFINE_SV

`define STDIN                   32'h8000_0000
`define STDOUT                  32'h8000_0001
`define STDERR                  32'h8000_0002

typedef int unsigned            uint;

`define TP                      20      // transmission delay (after clock rising edge)

`define PATTERN_WIDTH           'd64
`define PARITY_WIDTH            'd8
`define ERR_RATE_SINGLE         'd30    // single-bit error rate (percentage)
`define ERR_RATE_DOUBLE         'd30    // double-bit error rate (percentage)
`define ERR_RATE_TRIPLE         'd10    // triple-bit error rate (percentage)

typedef logic   [`PATTERN_WIDTH-1:0]    pattern_t;
typedef logic   [`PARITY_WIDTH-1:0]     parity_t;

`endif
