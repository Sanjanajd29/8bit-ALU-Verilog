module alu8_bit_tb;

    reg  [7:0] a, b;
    reg  [2:0] opcode;
    wire [7:0] result;
    wire carry_out, zero;

    // Instantiate ALU
    alu8_bit uut (
        .a(a),
        .b(b),
        .opcode(opcode),
        .result(result),
        .carry_out(carry_out),
        .zero(zero)
    );

    initial begin
    a=0; b=0; opcode=0;#5;
        
        a = 8'h0A; b = 8'h05; // 10 and 5

        opcode = 3'b000; #10; $display("ADD: %d + %d = %d", a, b, result);
        opcode = 3'b001; #10; $display("SUB: %d - %d = %d", a, b, result);
        opcode = 3'b010; #10; $display("AND: %b & %b = %b", a, b, result);
        opcode = 3'b011; #10; $display("OR : %b | %b = %b", a, b, result);
        opcode = 3'b100; #10; $display("XOR: %b ^ %b = %b", a, b, result);
        opcode = 3'b101; #10; $display("NOT: ~%b = %b", a, result);
        opcode = 3'b110; #10; $display("SHL: %b << 1 = %b", a, result);
        opcode = 3'b111; #10; $display("SHR: %b >> 1 = %b", a, result);

        $display("ALU Test Complete.");
        $stop;
    end

endmodule
