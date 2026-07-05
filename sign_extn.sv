module imm #(parameter Inst_Width = 32,parameter NUM_REG = 32,parameter OPCODE = 8)();
risc_if r_if();
always_comb
begin
  case(r_if.opcode)
    7'b0110011 :  r_if.imm = 32'bx; //R - type
    7'b0010011 :  r_if.imm = {{21{r_if.inst[31]}},r_if.inst[30:20]}; // I-type
    7'b0100011 :  r_if.imm = {{21{r_if.inst[31]}},r_if.inst[30:25],r_if.inst[11:7]};// S-type
    7'b1100011 :  r_if.imm = {{20{r_if.inst[31]}},r_if.inst[7],r_if.inst[30:25],r_if.inst[11:8],1'b0};//B-type
    default    :  r_if.imm = 32'bx;
  endcase
end
initial
begin
    r_if.inst = 32'h00500093;
    r_if.opcode = 7'b0010011;
end
initial
begin
    $monitor("Time = %0t | inst = %h | opcode = %b | imm = %h",$time,r_if.inst,r_if.opcode,r_if.imm);
end
endmodule