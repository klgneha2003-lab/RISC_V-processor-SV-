module D_mem #(parameter mem_size = 1024, parameter Inst_Width = 32)();
risc_if  r_if ();
logic [ Inst_Width - 1 : 0]mem[0 : mem_size - 1];
always_ff @(posedge r_if.clk)
begin
    if (r_if.w_en == 1)
      begin
         mem[r_if.i_addr] <= r_if.i_data; 
      end
end
always_comb
begin
   if(r_if.w_en == 0)
     begin
        r_if.o_data = mem[r_if.i_addr];
     end
end
endmodule
