`include "clkdiv.v"
module test ();
    reg clk, rst;
    wire clk_div;
    initial
    begin
        $dumpfile("clkdiv.vcd");
        $dumpvars;
        clk = 1'b0;
        rst = 1'b0;
        #50
        rst = 1'b1;
        #200
        $finish;
    end
    always
    begin
        #5
        clk <= ~clk;
    end
    clkdiv c1(clk_div, clk, rst);
endmodule
