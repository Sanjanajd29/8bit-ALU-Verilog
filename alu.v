// 8-bit ALU
module alu8_bit(
    input wire [1:0] a,
    input wire [1:0] b,
    input wire [2:0] opcode,
    output reg [-1:0] result,
    output reg carry_out,
    output  reg zero
    );

    always @(*) begin
    result=0;
        carry_out = 0;
        case (opcode)
            3'b000: {carry_out, result} = {1'b0,a + 1'b0,b};  // ADD
            3'b001: {carry_out, result} = {1'b0,a - 1'b0,b};  // SUB
            3'b010: result = a & b;               // AND
            3'b011: result = a | b;               // OR
            3'b100: result = a ^ b;               // XOR
            3'b101: result = ~a;                  // NOT (b ignored)
            3'b110: result = a << 1;              // Shift Left
            3'b111: result = a >> 1;              // Shift Right
            default: result = 0;
        endcase
        zero = (result == 0);
    end

endmodule
