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



module add_full_4(co,s,a,b,ci);
    output co;
    reg co;
    output [3:0] s;
    reg [3:0] s;
    input ci;
    input [3:0] a, b;
    reg   [3:0] G, P;
    reg   [2:0] C;
    always @(a, b, ci)
    begin
    P[0] = a[0] ^ b[0];
    P[1] = a[1] ^ b[1];
    P[2] = a[2] ^ b[2];
    P[3] = a[3] ^ b[3];
    
    G[0] = a[0] & b[0];
    G[1] = a[1] & b[1];
    G[2] = a[2] & b[2];
    G[3] = a[3] & b[3];

    C[0] = G[0] | (P[0]&ci);
    C[1] = G[1] | (P[1]&G[0]) | (P[1]&P[0]&ci);
    C[2] = G[2] | (P[2]&G[1]) | (P[2]&P[1]&G[0]) | (P[2]&P[1]&P[0]&ci);
    co   = G[3] | (P[3]&G[2]) | (P[3]&P[2]&G[1]) | (P[3]&P[2]&P[1]&G[0]) | (P[3]&P[2]&P[1]&P[0]&ci);

    s[0] = P[0] ^ ci;
    s[1] = P[1] ^ C[0];
    s[2] = P[2] ^ C[1];
    s[3] = P[3] ^ C[2];
    end
endmodule
