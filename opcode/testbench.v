`include "opcode.v"
module testbench();
    wire [31:0] d;
    reg [3:0]   op;
    reg [11:0]  a, b;
    reg clk;
    initial
    begin
        $dumpfile("opcode.vcd");
        $dumpvars;
        op = 0;
        a  = 65;
        b  = 8;
        clk = 1'b1;
        #200
        $finish;
    end
    always
    begin
        #5
        clk = ~clk;
        op = op + 1;
        #5
        clk = ~clk;
    end
    opcode o1(d, op, a, b, clk);
endmodule
