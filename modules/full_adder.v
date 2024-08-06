// Half Adder module
module half_adder(
    input a, b,
    output sum, carry
);
    assign sum = a ^ b;
    assign carry = a & b;
endmodule

// Full Adder module
module full_adder(
    input a, b, cin,
    output sum, cout
);
    wire sum1, carry1, carry2;
    
    half_adder ha1(.a(a), .b(b), .sum(sum1), .carry(carry1));
    half_adder ha2(.a(sum1), .b(cin), .sum(sum), .carry(carry2));
    
    assign cout = carry1 | carry2;
endmodule

// Testbench
module full_adder_tb;
    // Declare signals
    reg a, b, cin;
    wire sum, cout;

    // Instantiate the full adder
    full_adder fa1 (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

    // Generate VCD file
    initial begin
        $dumpfile("modules/full_adder.vcd");
        $dumpvars(0, full_adder_tb);

        // Test all input combinations
        {a, b, cin} = 3'b000; #10;
        {a, b, cin} = 3'b001; #10;
        {a, b, cin} = 3'b010; #10;
        {a, b, cin} = 3'b011; #10;
        {a, b, cin} = 3'b100; #10;
        {a, b, cin} = 3'b101; #10;
        {a, b, cin} = 3'b110; #10;
        {a, b, cin} = 3'b111; #10;

        $finish;
    end

    // Optional: Display results
    initial begin
        $monitor("Time=%0t a=%b b=%b cin=%b sum=%b cout=%b", $time, a, b, cin, sum, cout);
    end
endmodule