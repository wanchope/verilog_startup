module add_full_1(co,v,a,b,ci);
    output co, v;
    input  a, b, ci;
    wire   add1, c1, c2;
    xor x1(add1, a, b);
    xor x2(v, add1, ci);
    and a1(c1, a, b);
    and a2(c2, ci, add1);
    or  o1(co, c1, c2);
endmodule
