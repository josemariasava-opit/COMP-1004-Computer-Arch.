/*
Write Verilog code for a combinational logic gate that implements the logic:
(a AND b) OR c
Create a test bench program that proves the logic
*/

// declaration of module and_or

/* definition of variable 

   Input 1 = A 
   Input 2 = B
   Input 3 = C  

   Output = Q 
*/


module and_or(A,B,C,Q);

    input A,B,C; // define all the input signal  
    output Q;    // define output signal 

    assign Q = (A & B ) | C ; // Bitwise operation

endmodule
