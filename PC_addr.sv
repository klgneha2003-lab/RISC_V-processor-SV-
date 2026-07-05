module PC_adder (risc_if r_if);
always_comb
begin
  r_if.PC_mux_0 = r_if.inst_addr + 4;
  r_if.PC_mux_1 = r_if.inst_addr + r_if.imm;
end
/*initial
begin
   r_if.Current_PC_addr = 10'd10; r_if.imm = 32'd8 ;#5
   r_if.Current_PC_addr = 10'd4; r_if.imm = 32'd10;#5
   r_if.Current_PC_addr = 10'd15; r_if.imm = 32'd12;
end
initial
begin
   $display("Current PC addr = %0d, imm = %0d, PC_mux_0 = %0d, PC_mux_1 = %0d",r_if.Current_PC_addr,r_if.imm,r_if.PC_mux_0,r_if.PC_mux_1);#5
   $display("Current PC addr = %0d, imm = %0d, PC_mux_0 = %0d, PC_mux_1 = %0d",r_if.Current_PC_addr,r_if.imm,r_if.PC_mux_0,r_if.PC_mux_1);#5
   $display("Current PC addr = %0d, imm = %0d, PC_mux_0 = %0d, PC_mux_1 = %0d",r_if.Current_PC_addr,r_if.imm,r_if.PC_mux_0,r_if.PC_mux_1);#5
   $display("Current PC addr = %0d, imm = %0d, PC_mux_0 = %0d, PC_mux_1 = %0d",r_if.Current_PC_addr,r_if.imm,r_if.PC_mux_0,r_if.PC_mux_1);
end*/
endmodule