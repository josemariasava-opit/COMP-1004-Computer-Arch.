/*
Write Verilog code for a 2-input NAND gate and simulate it. Show the results using $monitor or
$display in a test bench program.
*/


// declaration of module nand_gate 

/* definition of variable 

   Input 1 = A 
   Input 2 = B 

   Output = Q 
*/
module nand_gate(input A, input B, output Q);

    // Assign value to Q 
    assign Q = ~ (A & B);  // Bitwise operation Q is equal to : not A and B 
    
endmodule