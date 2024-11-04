// simple_add.v - A basic arithmetic calculator for 4-bit numbers
module simple_add(
    // is like an array
    input [3:0] a, // register of for bit 0-1-2-3 
    input [3:0] b,
    output wire [3:0] result // NOT reg in this example (simple logic)
) ;

assign result = a + b;

endmodule