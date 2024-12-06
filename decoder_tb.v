`include "decoder.v" // Include logical module to test bench - for compiling we need to use iverilog -o nameoffile nameoftestbenchfile.v

module decoder_tb;

    reg [1:0] in;    // Input - 2 bits
    wire [3:0] out;  // Output - 4 bits

    // Instantiate the decoder logical module 
    decoder uut (
        .in(in),
        .out(out)
    );

    initial begin
        
        // generate dumpfile even if we don't have GTKwave
        $dumpfile("decoder.vcdd"); 
        $dumpvars(0, decoder_tb);

        $display("\n*** Starting Testbench for decoder *** \n");

        $display("Case 1: input = 00"); // Notify user about current value and case 
        in = 2'b00; // Test case 1: input = 00 binary
        #10;        // Wait 10 times unit 

        $display("\nCase 2: input = 01\n"); // Notify user about current value and case 
        in = 2'b01; // Test case 2: input = 01 binary
        #10;        // Wait 10 times unit    

        $display("\nCase 3: input = 10\n"); // Notify user about current value and case 
        in = 2'b10; // Test case 3: input = 10 binary
        #10;        // Wait 10 times unit 

        $display("\nCase 4: input = 11\n"); // Notify user about current value and case 
        in = 2'b11; // Test case 4: input = 11 binary 
        #10;        // Wait 10 times unit 

        // Finish simulation 
        #40;                          // wait 40 time unit
        $display("\nDecoder Simulation Complete.\n");
        $finish;
    end

        // Monitor the result of the test, we don't have GTKwave available
        initial begin   
            $monitor("At time %t: input= %b, output = %b",$time, in, out);
        end


endmodule
