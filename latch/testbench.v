`include "latch.v"

module testbench();
    reg r, s;
    wire y, yb;
    initial
    begin
        $dumpfile("latch.vcd");
        $dumpvars;  
        r = 1'b0;
        s = 1'b1;
        #100
        $finish;
    end
    always
    begin
        #10
        r = ~r;
        #10
        s = ~s;
    end
    rs_latch l1(y, yb, r, s);
endmodule
