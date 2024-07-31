Let's build up the individual modules which are typical for ALUs within CPUs, step-by-step. 😊 Note that the HACK architecture is extremely simplified. If you do some research and compare the Verilog I show below to that of other designs, you'll quickly notice the simplicity.

## Half-Adder
A half-adder is a digital circuit that adds two single binary digits and produces a sum and a carry. The sum is the XOR of the inputs, while the carry is the AND of the inputs.
```Verilog
module half_adder(
    input a, b,
    output sum, carry
);
    assign sum = a ^ b;
    assign carry = a & b;
endmodule
```
## Full-Adder
A full-adder adds three single binary digits (two inputs and one carry-in) and produces a sum and a carry-out. It's implemented using two half-adders and an OR gate.
```Verilog
module full_adder(
    input a, b, cin,
    output sum, cout
);
    wire sum1, carry1, carry2;
    
    half_adder ha1(.a(a), .b(b), .sum(sum1), .carry(carry1));
    half_adder ha2(.a(sum1), .b(cin), .sum(sum), .carry(carry2));
    
    assign cout = carry1 | carry2;
endmodule
```

## Adder
This is a 16-bit adder chaining 16 full-adders without carry-in or carry-out, as per HACK specifications. It's used in the ALU for addition operations.
```Verilog
module adder(
    input [15:0] a, b,
    output [15:0] out
);
    wire [16:0] carry;
    assign carry[0] = 1'b0;
    
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : adder_loop
            full_adder fa(
                .a(a[i]),
                .b(b[i]),
                .cin(carry[i]),
                .sum(out[i]),
                .cout(carry[i+1])
            );
        end
    endgenerate
endmodule
```
## Incrementer
A simple 16-bit incrementer.
```Verilog
module incrementer(
    input [15:0] in,
    output [15:0] out
);
    assign out = in + 16'd1;
endmodule
endmodule
```
## Arithmetic Logic Unit (ALU)
This ALU is specifically designed for the HACK computer. It has six 1-bit control inputs that determine the operation:

```
zx: Zero the x input
nx: Negate the x input
zy: Zero the y input
ny: Negate the y input
f:  Function select (0 for AND, 1 for ADD)
no: Negate the output
```
It also has two status outputs:
```
zr: Set to 1 if the output is zero
ng: Set to 1 if the output is negative (MSB is 1)
```
The ALU performs operations in stages according to the control bits, allowing for a variety of computations using different combinations of these bits.
```Verilog
module alu #(parameter WIDTH = 8)(
    input [WIDTH-1:0] a, b,
    input [2:0] op,
    output reg [WIDTH-1:0] result,
    output zero, overflow
);
    wire [WIDTH-1:0] add_result, sub_result, and_result, or_result, xor_result, inc_result;
    wire add_overflow, sub_overflow, inc_overflow;
    
    adder #(WIDTH) add_op(
        .a(a), .b(b), .cin(1'b0),
        .sum(add_result), .cout(add_overflow)
    );
    
    adder #(WIDTH) sub_op(
        .a(a), .b(~b), .cin(1'b1),
        .sum(sub_result), .cout(sub_overflow)
    );
    
    incrementer #(WIDTH) inc_op(
        .a(a),
        .result(inc_result),
        .overflow(inc_overflow)
    );
    
    assign and_result = a & b;
    assign or_result = a | b;
    assign xor_result = a ^ b;
    
    always @(*) begin
        case (op)
            3'b000: result = add_result;
            3'b001: result = sub_result;
            3'b010: result = and_result;
            3'b011: result = or_result;
            3'b100: result = xor_result;
            3'b101: result = inc_result;
            default: result = {WIDTH{1'b0}};
        endcase
    end
    
    assign zero = (result == {WIDTH{1'b0}});
    assign overflow = (op == 3'b000) ? add_overflow :
                      (op == 3'b001) ? sub_overflow :
                      (op == 3'b101) ? inc_overflow : 1'b0;
endmodule
```