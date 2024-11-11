// D Flip Flop Test Bench 

// `timescale compiler directive specifies the time unit and precision for the modules that follow it.
`timescale 1ns/1ps 
`include "flip_flop.v" // Include logical module to test bench - for compiling we need to use iverilog -o xyz nameoftestbenchfile.v 


module flip_flop_tb();

    reg clk, D; 
    wire Q; 

    //Instantiate the logical module 
    d_flip_flop uut(
        .clk(clk),
        .D(D),
        .Q(Q)
    );

    // Setup our clock 
    initial begin
        clk = 0; 
        forever #5 clk=~clk; // toggle every 5 time unit 
    end

    // Test Sequence 
    initial begin
        $dumpfile("d_flip_flop.vcd");
        $dumpvars(0, flip_flop_tb);

        // initialize D 
        D = 0; 
        #10; // wait 10 time units 

        // change D and observe Q 
        D = 1; 
        #10; // wait 10 time units 

        D = 0; 
        #10; // wait 10 time units 

        //finish simulation 
        $finish;
    end


endmodule 