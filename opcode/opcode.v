module opcode(d, op, a, b);
    output [31:0] d;
    reg [31:0] d;
    input [3:0] op;
    input [11:0] a, b;
    always@(op or a or b)
    begin
        case(op[3:0])
            4'b0000: d = a + b;
            4'b0001: d = a - b;
            4'b0010: d = a * b;
            4'b0011: d = a / b;
            4'b0100: d = a % b;
            default: d = op;
        endcase
    end
endmodule
