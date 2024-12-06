`include "fsm.v" // Include logical module to test bench - for compiling we need to use iverilog -o xyz nameoftestbenchfile.v 

module fsm_tb();
// Testbench signals I/O 
reg clk;           // Clock signal
reg reset;         // Reset signal
reg COIN;          // Coin input
reg PUSH;          // Push input
wire fsm_state;        // State output from fsm logical module
reg[10*8:0] string_state; // Handle strings in Verilog - each character is 8 ASCII bits



// Instantiate the fsm logical module
fsm uut (
    .clk(clk),
    .reset(reset),
    .coin(COIN),
    .push(PUSH),
    .state(fsm_state)
);

// Clock generation 
initial begin
    clk = 0;
    forever #10 clk = ~clk; // Toggle clock every 10 time period
end

// Test fsm logic
initial begin
    // generate dumpfile even if we don't have GTKwave
    $dumpfile("fsm.vcd"); 
    $dumpvars(0, fsm_tb);
    // Initial conditions
    $display("*** Starting Testbench for fsm *** \n");
    reset = 1; COIN = 0; PUSH = 0;   // Start with reset active, coin and push = 0 
    #20                             // Wait for two clock cycles, 20 time units 
    reset = 0;                     // Release reset and set to 0 

    // Test Case 1: Insert coin when turnstile locked
    $display("\nTest 1: Insert coin when the turnstile state is %s \n", string_state);
    #10;
    COIN = 1;                      // Insert coin , set to 1 
    #10;                           // Hold the coin for 25 time units
    COIN = 0;                      // Remove coin, set to 0 

    // Test Case 2: Push when turnstile unlocked
    $display("\nTest 2: Push when the turnstile state is %s \n", string_state);
    #10;
    PUSH = 1;                      // Push the turnstile, set to 1 
    #10;
    PUSH = 0;                      // Stop pushing, set to 0 

    // Test Case 3: Push when turnstile locked
    $display("\nTest 3: Push when the turnstile state is %s \n", string_state);
    #10;
    PUSH = 1;                      // Push while locked, set to 1 
    #10;
    PUSH = 0;                      // Stop pushing, set to 0 

    // Test Case 4: Insert coin when turnstile unlocked
    $display("\nTest 4: Insert coin when the turnstile state is %s \n", string_state);
    #10;
    COIN = 1;                      // Insert coin again, set to 1 
    #10;                           // Hold the coin for 25 time units
    COIN = 0;                      // Remove coin, set to 0 

    // Finish simulation 
    #40;                          // wait 40 time unit
    $display("\nTurnstile Simulation Complete. \n");
    $finish;
end

// Handle string and assign value based on the fsm_state
always @(*) begin
    if (fsm_state)
        string_state = "UNLOCKED"; // if state is 1 --> string = UNLOCKED 
    else 
        string_state = "LOCKED";  // is state is 0 --> string = LOCKED 
end

// Monitor the result of the test, we don't have GTKwave available
initial begin
    $monitor("At time %t: reset = %b, COIN = %b, PUSH = %b, fsm_state = %s",
             $time, reset, COIN, PUSH, string_state);
end

endmodule
