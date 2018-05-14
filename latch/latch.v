module rs_latch(y, yb, r, s);
    output y, yb;
    input  r, s;
    nor n1(y, r, yb);
    nor n2(yb, s, y);
endmodule
