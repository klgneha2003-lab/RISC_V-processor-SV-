module PC_mux(risc_if r_if);
always_comb
begin
   case(r_if.take)
     1'b0 : r_if.Next_PC_addr = r_if.PC_mux_0;
     1'b1 : r_if.Next_PC_addr = r_if.PC_mux_1;
     default : r_if.Next_PC_addr = r_if.PC_mux_0;
   endcase
end
/*initial
begin
  r_if.take = 1'b1; r_if.PC_mux_0 = 10'd4; r_if.PC_mux_1 = 10'd7; #5  
  r_if.take = 1'b0; r_if.PC_mux_0 = 10'd10; r_if.PC_mux_1 = 10'd2; #5
  r_if.take = 1'b1;r_if.PC_mux_0 = 10'd30; r_if.PC_mux_1 = 10'd12;
end
initial
begin
  $display("take = %b,PC_mux_0 = %0d,PC_mux_1 = %0d",r_if.take, r_if.PC_mux_0,r_if.PC_mux_1,r_if.Next_PC_addr);#5
  $display("take = %b,PC_mux_0 = %0d,PC_mux_1 = %0d",r_if.take, r_if.PC_mux_0,r_if.PC_mux_1,r_if.Next_PC_addr);#5
  $display("take = %b,PC_mux_0 = %0d,PC_mux_1 = %0d",r_if.take, r_if.PC_mux_0,r_if.PC_mux_1,r_if.Next_PC_addr);
end*/
endmodule