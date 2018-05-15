`include "add.v"
module testbench();
    reg a, b;
    wire co1, v1;
    wire co2, v2;
    wire c1, c2;
    wire [3:0] s1, s2;
    reg  [3:0] a1, a2, b1, b2;
    initial
    begin
        $dumpfile("add.vcd");
        $dumpvars;
        a = 1'b0;
        b = 1'b0;
        a1 = 4'b0101;
        a2 = 4'b1111;
        b1 = 4'b1010;
        b2 = 4'b0001;
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
    add_full_1 a_1_1(co1, v1, a, b, 1'b0);
    add_full_1 a_1_2(co2, v2, a, b, 1'b1);
    add_full_4 a_4_1(c1, s1, a1, b1, 1'b0);
    add_full_4 a_4_2(c2, s2, a2, b2, 1'b1);
endmodule
