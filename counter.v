// Simple count

module counter ( clk,q); 

    input clk; 
    output reg [7:0] q; // 8 bits store counter value 

    initial begin
        q = 8'b0;
    end

    always @(posedge clk ) 
    begin
        q = q+5; // add 5 for each clock cycle 
    end
    
endmodule