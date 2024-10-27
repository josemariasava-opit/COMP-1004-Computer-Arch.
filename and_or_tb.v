/*
Write Verilog code for a combinational logic gate that implements the logic:
(a AND b) OR c
Create a test bench program that proves the logic
*/

/*
Testbench to test logic module and_or.v
*/

module tb_and_or ();

    reg v1,v2,v3; // istance of variables A-B-C 

    wire result; // connection to output 

    // instance of and_or module file
    and_or test(.A(v1), .B(v2), .C(v3), .Q(result));

    initial begin // begin of simulation 

    // initialize inputs with all cases 

   // #10 delay how long to wait before another event
    v1 = 0; v2 = 0; v3 = 0;  #10; // case 1
    v1 = 0; v2 = 0; v3 = 1;  #10; // case 2
    v1 = 0; v2 = 1; v3 = 0;  #10; // case 3
    v1 = 0; v2 = 1; v3 = 1;  #10; // case 4
    v1 = 1; v2 = 0; v3 = 0;  #10; // case 5
    v1 = 1; v2 = 0; v3 = 1;  #10; // case 6
    v1 = 1; v2 = 1; v3 = 0;  #10; // case 7
    v1 = 1; v2 = 1; v3 = 1;  #10; // case 8
    end

    // display the simulation and the value of each case 
    initial begin
        $monitor(
            "A = %b, B = %b, C = %b, Q = %b",
            v1,
            v2, 
            v3,
            result
        );
    end

    
endmodule