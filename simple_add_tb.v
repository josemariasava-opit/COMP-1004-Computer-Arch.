module tb_simple_add();

    reg [3:0] value1,value2;

    wire [3:0] result;


    simple_add test (
        .a(value1),
        .b(value2),
        .result(result)
    );

    initial begin
    // test addition
        value1 = 4'b0100; // 4
        value2 = 4'b0010; // 2 
        #10;
        $display ("Result of %b + %b is %b", value1, value2, result);
        value1 = 4'b0110; // 6
        value2 = 4'b1010; // 10
        #10;
        $display ("Result of %b + %b is %b", value1, value2, result);
    end


endmodule