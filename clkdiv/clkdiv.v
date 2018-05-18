module clkdiv (out, clk, rst);
    output out;
    input  clk, rst;
    parameter div = 7;
    parameter lvl = div / 2;
    reg [2:0] cnt1, cnt2;
    reg clk1, clk2;
    wire clkn = ~clk;
    always@(posedge clk)
    begin
        if (rst == 1'b0)
        begin
            clk1 <= 1'b0;
            cnt1 <= 0;
        end
        else
        begin
            cnt1 <= cnt1 + 1'b1;
            if (cnt1 == lvl)
            begin
                clk1 <= ~clk1;
                cnt1 <= 1;
            end
        end
    end
    always@(posedge clkn)
    begin
        if ((rst == 1'b0) || (cnt1 == 0))
        begin
            clk2 <= 1'b0;
            cnt2 <= 0;
        end
        else
            begin
            cnt2 <= cnt2 + 1'b1;
            if (cnt2 == lvl)
            begin
                clk2 <= ~clk2;
                cnt2 <= 1;
            end
        end
    end
    assign out = clk1 | clk2;
endmodule
