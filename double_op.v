/*
if (operator)
result = a + b;
else
result = a - b;
*/

// add or subtract depending on operator 
module add_subtract (
        // is like an array
    input [3:0] a, // register of for bit 0-1-2-3 
    input [3:0] b,
    input op, // to handle operation (0 = add, 1 = subtract) 

    output reg [7:0] result // Register of 8 bits 
);

always @(*) begin
    if(op)
        result = a+b; 
    else 
        result = a-b;
end
    
endmodule
