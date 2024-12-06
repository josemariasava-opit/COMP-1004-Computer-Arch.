// Logical module
module decoder (
    input wire [1:0] in,  // 2-bit binary input
    output reg [3:0] out  // 4-bit output, one active at a time
);

    // Combinational logic to decode input to one single output
    always @(*) begin
        case (in)
            2'b00: out = 4'b0001; // Input 00 activates first output
            2'b01: out = 4'b0010; // Input 01 activates second output
            2'b10: out = 4'b0100; // Input 10 activates third output
            2'b11: out = 4'b1000; // Input 11 activates fourth output
            default: out = 4'b0000; // Default case to handle unexpected input values 
        endcase
    end
endmodule
