/*
Write Verilog code for a 2-input NAND gate and simulate it. Show the results using $monitor or
$display in a test bench program.
*/

/*
Testbench to test logic module and_gate.v
*/
module tb_nand_gate ();
   
    reg value1,value2; // declaration of variable A-B 

    wire result; // Connection to output

    // istance of nand_gate.v
    nand_gate testing (.A(value1), .B(value2), .Q(result));

    initial begin // begin of simulation 

        // initialize inputs with all case 
        // case 1 
        value1 = 0; value2 = 0; #10;   // #10 delay how long to wait before another event
        // case 2 
        value1 = 0; value2 = 1; #10;  
        // case 3 
        value1 = 1; value2 = 0; #10; 
        // case 4 
        value1 = 1; value2 = 1; #10; 
        $finish;                       // end of simulation 
    end 

    // display the simulation and values of each case 
    initial begin
        $monitor( 
            "A = %b, B = %b, Q = %b", 
            value1, 
            value2,
            result
        );
    end
    
endmodule