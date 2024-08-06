module alu(
    input [15:0] x, y,
    input zx, nx, zy, ny, f, no,
    output [15:0] out,
    output zr, ng
);
    wire [15:0] x1, y1, x2, y2, and_out, add_out, mux_out;

    assign x1 = zx ? 16'b0 : x;
    assign y1 = zy ? 16'b0 : y;
    assign x2 = nx ? ~x1 : x1;
    assign y2 = ny ? ~y1 : y1;
    assign and_out = x2 & y2;
    assign add_out = x2 + y2;
    assign mux_out = f ? add_out : and_out;
    assign out = no ? ~mux_out : mux_out;
    assign zr = (out == 16'b0);
    assign ng = out[15];
endmodule

// Testbench
module alu_tb;
    reg [15:0] x, y;
    reg zx, nx, zy, ny, f, no;
    wire [15:0] out;
    wire zr, ng;

    alu dut(
        .x(x), .y(y),
        .zx(zx), .nx(nx), .zy(zy), .ny(ny), .f(f), .no(no),
        .out(out), .zr(zr), .ng(ng)
    );

    initial begin
        $dumpfile("modules/alu.vcd");
        $dumpvars(0, alu_tb);

        // Test cases
        // Case 1: x + y
        x = 16'd10; y = 16'd5; zx = 0; nx = 0; zy = 0; ny = 0; f = 1; no = 0; #10;
        
        // Case 2: x - y
        x = 16'd10; y = 16'd5; zx = 0; nx = 1; zy = 0; ny = 0; f = 1; no = 1; #10;
        
        // Case 3: y - x
        x = 16'd5; y = 16'd10; zx = 0; nx = 0; zy = 0; ny = 1; f = 1; no = 1; #10;
        
        // Case 4: x & y
        x = 16'b1010101010101010; y = 16'b1100110011001100; zx = 0; nx = 0; zy = 0; ny = 0; f = 0; no = 0; #10;
        
        // Case 5: x | y
        x = 16'b1010101010101010; y = 16'b1100110011001100; zx = 0; nx = 1; zy = 0; ny = 1; f = 0; no = 1; #10;
        
        // Case 6: !x
        x = 16'b1010101010101010; y = 16'd0; zx = 0; nx = 1; zy = 1; ny = 0; f = 0; no = 0; #10;
        
        // Case 7: !y
        x = 16'd0; y = 16'b1010101010101010; zx = 1; nx = 0; zy = 0; ny = 1; f = 0; no = 0; #10;
        
        // Case 8: -x
        x = 16'd42; y = 16'd0; zx = 0; nx = 1; zy = 1; ny = 0; f = 1; no = 1; #10;
        
        // Case 9: -y
        x = 16'd0; y = 16'd42; zx = 1; nx = 0; zy = 0; ny = 1; f = 1; no = 1; #10;
        
        // Case 10: x + 1
        x = 16'd42; y = 16'd0; zx = 0; nx = 1; zy = 1; ny = 1; f = 1; no = 1; #10;

        $finish;
    end

    initial begin
        $monitor("Time=%0t x=%d y=%d zx=%b nx=%b zy=%b ny=%b f=%b no=%b out=%d zr=%b ng=%b", 
                 $time, x, y, zx, nx, zy, ny, f, no, out, zr, ng);
    end
endmodule