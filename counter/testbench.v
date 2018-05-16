`include "counter.v"
module testbench();
    reg clk;
    wire [3:0] cnt;
    reg rst;
    initial
    begin
        $dumpfile("counter.vcd");
        $dumpvars;
        clk = 1'b0;
        rst = 1'b0;
        #20
        rst = 1'b1;
        #200
        rst = 1'b0;
        #20
        $finish;
    end
    always
    begin
        #5
        clk <= ~clk;
    end
    counter c1(cnt, clk, rst);
endmodule
