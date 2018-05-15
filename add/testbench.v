`include "add.v"
module testbench();
    reg a, b;
    wire co1, v1;
    wire co2, v2;
    initial
    begin
        $dumpfile("add.vcd");
        $dumpvars;
        a = 1'b0;
        b = 1'b0;
        #100
        $finish;
    end
    always
    begin
        #10
        a = ~a;
        #10
        b = ~b;
    end
    add_full_1 a1(co1, v1, a, b, 1'b0);
    add_full_1 a2(co2, v2, a, b, 1'b1);
endmodule
