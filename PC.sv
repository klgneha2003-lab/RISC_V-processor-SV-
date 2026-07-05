module PC (risc_if r_if);
always_ff @(posedge r_if.clk or posedge r_if.rst)
begin
   if (r_if.rst == 0)
     begin
       r_if.inst_addr <= 10'b0;
     end
   else
      begin
        r_if.inst_addr <= r_if.Next_PC_addr;
      end
end
/*initial begin
  r_if.clk = 0;
  forever # 10 r_if.clk = ~ r_if.clk;
end
initial
begin     // works
   r_if.rst = 0; #21
   r_if.rst = 1;
   r_if.Next_PC_addr = 10'd4;#20
   r_if.Next_PC_addr = 10'd20;#20
   r_if.Next_PC_addr = 10'd1;#20
   r_if.Next_PC_addr = 10'd10;#20
   r_if.Next_PC_addr = 10'd8;#20
   #120;
   $finish;
end
initial
begin
 $display("time = %t, clk = %b,rst = %b, inst_addr = %0d, PC_addr = %0d",$time,r_if.clk,r_if.rst,r_if.inst_addr,r_if.Next_PC_addr);#21
 $display("time = %t, clk = %b,rst = %b, inst_addr = %0d, PC_addr = %0d",$time,r_if.clk,r_if.rst,r_if.inst_addr,r_if.Next_PC_addr);#20
 $display("time = %t, clk = %b,rst = %b, inst_addr = %0d, PC_addr = %0d",$time,r_if.clk,r_if.rst,r_if.inst_addr,r_if.Next_PC_addr);#20
 $display("time = %t, clk = %b,rst = %b, inst_addr = %0d, PC_addr = %0d",$time,r_if.clk,r_if.rst,r_if.inst_addr,r_if.Next_PC_addr);#20
 $display("time = %t, clk = %b,rst = %b, inst_addr = %0d, PC_addr = %0d",$time,r_if.clk,r_if.rst,r_if.inst_addr,r_if.Next_PC_addr);#20
 $display("time = %t, clk = %b,rst = %b, inst_addr = %0d, PC_addr = %0d",$time,r_if.clk,r_if.rst,r_if.inst_addr,r_if.Next_PC_addr);
end*/
endmodule