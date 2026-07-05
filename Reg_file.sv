module Reg_file #(parameter Inst_Width = 32,parameter NUM_REG = 32)();
risc_if  r_if ();
logic [Inst_Width - 1 : 0]R_mem[0 : Inst_Width - 1];
always_ff @(posedge r_if.clk)
begin
R_mem[0] = 32'b0;
   if(! r_if.w_en)
     begin
        r_if.rs1 <= R_mem[r_if.rs1_addr];
        r_if.rs2 <= R_mem[r_if.rs2_addr];
     end
    else
      begin
         R_mem[r_if.rd_addr] <= r_if.rd;
      end
end
endmodule 