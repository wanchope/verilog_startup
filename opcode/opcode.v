`define op_add  4'b0000
`define op_dec  4'b0001
`define op_mul  4'b0010
`define op_div  4'b0011
`define op_mod  4'b0100
`define op_mov  4'b0101
`define op_and  4'b0110
`define op_or   4'b0111
`define op_xor  4'b1000
`define op_ldr  4'b1001
`define op_std  4'b1010

module opcode(err, op, a, b, clk, rst);
    input   [3:0] op, a;
    input   [23:0] b;
    reg     [31:0] regfile[0:7];
    reg     [31:0] b_temp;
    output  err;
    reg     err;
    input   clk;
    input   rst;
    reg     [31:0] reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7;
    always@(posedge clk)
    begin
        if (1'b0 == rst)
        begin
            regfile[0] = 0;
            regfile[1] = 0;
            regfile[2] = 0;
            regfile[3] = 0;
            regfile[4] = 0;
            regfile[5] = 0;
            regfile[6] = 0;
            regfile[7] = 0;
        end
        else
        begin
            if ((1'b1 == a[3]) && (0 != b[11:3]))
            begin
                err = 1'b1;
            end
            else
            begin
                if (1'b1 == a[3])
                begin
                    b_temp = regfile[b[2:0]];
                end
                else
                begin
                    b_temp = b;
                end
                err = 1'b0;
                case(op[3:0])
                    `op_add: regfile[a] = regfile[a] + b_temp;
                    `op_dec: regfile[a] = regfile[a] - b_temp;
                    `op_mul: regfile[a] = regfile[a] * b_temp;
                    `op_div: regfile[a] = regfile[a] / b_temp;
                    `op_mod: regfile[a] = regfile[a] % b_temp;
                    `op_mov: regfile[a] = b_temp;
                    `op_and: regfile[a] = regfile[a] | b_temp;
                    `op_or:  regfile[a] = regfile[a] & b_temp;
                    `op_xor: regfile[a] = regfile[a] ^ b_temp;
                    default: err = 1'b1;
                endcase
            end
        end
        reg0 = regfile[0];
        reg1 = regfile[1];
        reg2 = regfile[2];
        reg3 = regfile[3];
        reg4 = regfile[4];
        reg5 = regfile[5];
        reg6 = regfile[6];
        reg7 = regfile[7];
    end
endmodule
