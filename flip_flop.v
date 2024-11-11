module d_flip_flop(
    input clk, // Clock input 
    input D, // Data input
    output reg Q // Data output 
);

// Capture the value of D on the rising edge of the clock 
always @(posedge clk) begin
    Q <= D; 
end


endmodule