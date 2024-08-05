module half_adder(
    input a, b,
    output sum, carry
);
    assign sum = a ^ b;
    assign carry = a & b;
endmodule

// Testbench
module half_adder_tb;
    // Declare signals
    reg a, b;
    wire sum, carry;

    // Instantiate the half adder
    half_adder ha1 (.a(a), .b(b), .sum(sum), .carry(carry));

    // Generate VCD file
    initial begin
        $dumpfile("half_adder.vcd");
        $dumpvars(0, half_adder_tb);

        // Test cases
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;
    end

    // Display results
    initial begin
        $monitor("Time=%0t a=%b b=%b sum=%b carry=%b", $time, a, b, sum, carry);
    end
endmodule