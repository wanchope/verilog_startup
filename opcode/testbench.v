`include "opcode.v"
module testbench();
    reg [3:0]   op, a;
    reg [23:0]  b;
    reg clk, rst;
    wire err;
    reg start;
    initial
    begin
        $dumpfile("opcode.vcd");
        $dumpvars;
        op = `op_mov;
        clk = 1'b1;
        rst = 1'b0;
        start = 0;
        #5
        rst = 1'b1;
        a = 0;
        b = 16;
        clk = ~clk;
        #5
        clk = ~clk;
        #5
        
        a = 1;
        b = 17;
        clk = ~clk;
        #5
        clk = ~clk;
        #5
        a = 2;
        b = 18;
        clk = ~clk;
        #5
        clk = ~clk;
        #5
        a = 3;
        b = 19;
        clk = ~clk;
        #5
        clk = ~clk;
        #5

        a = 4;
        b = 20;
        clk = ~clk;
        #5
        clk = ~clk;
        #5
        a = 5;
        b = 21;
        clk = ~clk;
        #5
        clk = ~clk;
        #5
        a = 6;
        b = 22;
        clk = ~clk;
        #5
        clk = ~clk;
        #5
        a = 7;
        b = 23;
        clk = ~clk;
        #5
        clk = ~clk;
        #5

        op = 0;
        b  = 1;
        start = 1;
        #2000
        $finish;
    end
    always
    begin
        #5
        if (1'b1 == start)
        begin
            clk = ~clk;
            op = op + 1;
            a  = a  + 9;
            b  = b  + 1;
            #5
            clk = ~clk;
        end
    end
    opcode o1(err, op, a, b, clk, rst);
endmodule
