// Logical Module 
module fsm (
    input wire clk,      // Clock signal
    input wire reset,    // Reset signal to initialize the state
    input wire coin,     // Input signal - 1 bit to insert the coin 
    input wire push,     // Input signal - 1 bit to push 
    output reg state     // Output state: 0 = LOCKED, 1 = UNLOCKED
);

// Define states of FSM - 0 = LOCKED, 1 = UNLOCKED
parameter LOCKED = 1'b0, UNLOCKED = 1'b1;

// working_state signal to store the current state
reg working_state;

// Sequential logic to update the current state or reset
always @(posedge clk or posedge reset) begin
    if (reset) 
        working_state <= LOCKED; // set current state to LOCKED = 0 
    else begin
        case (working_state)
            LOCKED: begin  // Case Locked
                if (coin) 
                    working_state <= UNLOCKED; // Insert coin will unlock the turnstile
                else 
                    working_state <= LOCKED; // Stay in locked state
            end
            UNLOCKED: begin // Case Unlocked
                if (push) 
                    working_state <= LOCKED; // Push to lock the turnstile
                else 
                    working_state <= UNLOCKED; // Stay in unlocked state
            end
            default: // Default state of switch case statement is LOCKED
                working_state <= LOCKED; 
        endcase // end swith case 
    end
end

// Output logic to show the state of turnstile
always @(*) begin
    state = working_state; // Output current based on the working_state
end

endmodule

