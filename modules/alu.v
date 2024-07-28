module alu (input [3:0] a, input [3:0] b, input [2:0] op,
            output reg [3:0] result
);

always @(*) begin
    case (op)
        3'b000: result = a + b;    // Addition
        3'b001: result = a - b;    // Subtraction
        3'b010: result = a & b;    // Bitwise AND
        3'b011: result = a | b;    // Bitwise OR
        3'b100: result = a ^ b;    // Bitwise XOR
        3'b101: result = a << b;   // Left shift
        3'b110: result = a >> b;   // Right shift
        3'b111: result = a == b;   // Equality comparison
        default: result = 4'b0000; // Default case
    endcase
end

endmodule