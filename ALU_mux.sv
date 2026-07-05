module ALU_mux();
always_comb
begin
   case(r_if.alu_src_b)
    1'b0 : r_if.in_rs2 = r_if.rs2;
    1'b1 : r_if.in_rs2 = r_if.imm;
   endcase
end
endmodule
