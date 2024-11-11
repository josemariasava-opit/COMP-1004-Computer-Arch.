`include "double_op.v" // include logical module 

module add_subtract_tb();

    reg[3:0] a,b; 
    reg op; 

    wire [7:0] result; // result 

    add_subtract uut(
        .a(a), 
        .b(b), 
        .op(op),
        .result(result)
    ); 

    initial begin
        $dumpfile("dual_operation.vcd"); 

        // test for addition 1 
        op = 1; 
        a = 4'b0100; // 4 decimal 
        b = 4'b0010; // 2 decimal 
        #10;  // wait 10 time units 

        $display ("case %b", op);
        $display ("Result of %b + %b is %b", a, b, result);
        $display ("-------------------------------------");


        // test for subtraction  0
        op = 0; 
        a = 4'b0111; // 7 decimal 
        b = 4'b0110; // 6 decimal 
        #10;  // wait 10 time units 

        $display ("case %b", op);
        $display ("Result of %b - %b is %b", a, b, result);
        $display ("-------------------------------------");

    end
    
endmodule
