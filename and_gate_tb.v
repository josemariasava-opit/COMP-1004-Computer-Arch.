module tb_and_gate();

  // Register 
  reg aValue, bValue;
  wire yValue;

  // instancing the and_gate module
  // reference to first file and_gate.v 
  and_gate instance1(.A(aValue), .B(bValue), .Y(yValue));
                    // connect register to input A-B 

  // testbench logic
  initial begin
    aValue = 0; bValue = 0; #10;
    aValue = 0; bValue = 1; #10;
    aValue = 1; bValue = 0; #10;
    aValue = 1; bValue = 1; #10;
    $finish;
  end

  // monitor output
  initial begin
    $monitor(
      "A = %b, B = %b, Y = %b", 
      aValue, bValue, yValue
    );
  end

endmodule