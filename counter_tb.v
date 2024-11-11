// Simple Count Test Bench 
`include "counter.v" // 

module counter_tb();

    reg clk; 
    wire [7:0] q; // output 

    counter uut(
        .clk(clk), 
        .q(q) 
    );

    //begin the test 

    initial begin
        $dumpfile("counter_tb.vcd"); 
        $dumpvars(0, counter_tb);

        clk = 1'b0; // initialize clock to 0 units 
        #500; // run for 500 time units 
        $finish;
    end

    initial begin
        forever  #20 clk=~clk; // every 20 time units toggle 
    end



endmodule