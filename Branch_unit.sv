module Branch_unit #()();
risc_if r_if ();
logic check;
always_comb
begin
check = ~|(r_if.rs1 ^ r_if.rs2);
  case(r_if.branch_op)
    2'b01 : begin
                    if (check == 1) // check = 1 => rs1 = rs2
                      begin
                         r_if.take = 1'b1; // since this is BEQ
                      end
                    else
                      begin
                         r_if.take = 1'b0;
                      end
                end 
    2'b10 : begin 
                   if (check == 0)
                     begin
                       r_if.take = 1'b1;
                     end
                   else
                      begin
                        r_if.take = 1'b0;
                      end
                end
    default   : r_if.take = 1'b0;
  endcase
end
endmodule
