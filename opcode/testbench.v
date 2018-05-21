`include "opcode.v"
module testbench();
    wire [31:0] d;
    reg [3:0]   op;
    reg [11:0]  a, b;
    initial
    begin
        $dumpfile("opcode.vcd");
        $dumpvars;
        op = 0;
        a  = 65;
        b  = 8;
        #200
        $finish;
    end
    always
    begin
        #10
        op <= op + 1;
    end
    opcode o1(d, op, a, b);
endmodule
