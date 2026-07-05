module RISC_V();
risc_if r_if ();
Inst_mem I1 (r_if.inst_mem_mb);
Decoder d1(r_if.Decoder_mb);
imm i1(r_if.sign_extn_mb);
Reg_file r1(r_if.Reg_file_mb);
ALU_mux a1 (r_if.ALU_mux_mb);
ALU_unit a2 (r_if.ALU_mb);
Branch_unit b1 (r_if.branch_mb);
D_mem d2 (r_if.D_mem_mb);
Data_mux d3 (r_if.data_mux_mb);
PC_mux p1 (r_if.PC_mux_mb);
PC p2(r_if.PC_mb);
PC_adder p3 (r_if.PC_addr_mb);
initial
begin
   r_if.clk = 0;
   forever #10 r_if.clk = ~ r_if.clk;
end
initial
begin
    r_if.rst = 0; #20
    r_if.rst = 1;
    $monitor("Time=%0t | PC=%h | Inst=%h | ALU_Out=%d |ALU_op = %b| x1=%d | x2=%d | x3=%d", 
              $time,    r_if.inst_addr,  r_if.inst, r_if.alu_out,r_if.alu_op,  r_if.rs1 , r_if.rs2,  r_if.rd);
    #100;
    $finish;

end
endmodule 