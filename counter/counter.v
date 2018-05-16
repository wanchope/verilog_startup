module counter(cnt, clk, rst);
    output  [3:0] cnt;
    reg     [3:0] cnt;
    input   rst, clk;
    always @(rst or posedge clk)
    begin
        if (0 == rst)
        begin
            cnt <= 4'b0000;
        end
        else
        begin
            cnt <= cnt + 1;
        end
    end
endmodule
