module myModule();
  reg clk;  // Declare a clock signal
  reg [3:0] counter;  // Declare a 4-bit counter

  initial begin
    $dumpfile("test.vcd");  // Create a VCD file named test.vcd
    $dumpvars(0, myModule);  // Dump all variables in the module

    clk = 0;
    counter = 0;
    
    repeat(16) begin
      #5 clk = ~clk;  // Toggle clock every 5 time units
      if (clk) counter = counter + 1;  // Increment counter on rising edge
    end

    $display("Simulation complete");
    $finish;
  end
endmodule