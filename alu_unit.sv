package alu_opcode;
typedef  enum logic [2:0]{
    ADD = 3'b001 ,
    SUB = 3'b010 ,
    AND = 3'b011 ,
    OR  = 3'b100 ,
    XOR = 3'b101 ,
    SL  = 3'b110 ,
    SR  = 3'b111  
} R_type;

typedef enum logic [2:0]{
    INVALID_ALU_OP = 3'b0
} ERROR;

endpackage

module ALU_unit();
risc_if r_if ();
import alu_opcode::*;
always_comb
begin
  case(r_if.alu_op)
     alu_opcode::ADD : r_if.alu_out = r_if.rs1 + r_if.in_rs2;
     alu_opcode::SUB : r_if.alu_out = r_if.rs1 - r_if.in_rs2;
     alu_opcode::AND : r_if.alu_out = r_if.rs1 & r_if.in_rs2;
     alu_opcode::OR  : r_if.alu_out = r_if.rs1 | r_if.in_rs2;
     alu_opcode::XOR : r_if.alu_out = r_if.rs1 ^ r_if.in_rs2;
     alu_opcode::SL  : r_if.alu_out = r_if.rs1 << r_if.in_rs2[4:0];
     alu_opcode::SR : r_if.alu_out = r_if.rs1 >> r_if.in_rs2[4:0];
     alu_opcode::INVALID_ALU_OP : r_if.alu_out = 32'bx;
  endcase
end
endmodule
