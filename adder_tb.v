module adder_tb();

    reg [3:0] v1, v2;

    wire [3:0] result; 


    adder adder_test(.a(v1), .b(v2), .q(result));

    initial begin
        
            // test addition
        v1 = 4'b0100; // 4
        v2 = 4'b0010; // 2 

        #10;
        $display ("Result of %b + %b is %b", v1, v2, result);
    end
    
endmodule