module Data_mux();
risc_if r_if ();
always_comb
begin
   case(r_if.mem_to_reg)
     1'b0 : r_if.data_mux_out = r_if.alu_out;
     1'b1 : r_if.data_mux_out = r_if.o_data;
   endcase
end
endmodule