module Inst_mem #(parameter mem_size = 1024 ,parameter  Inst_Width = 32)();
logic [ Inst_Width - 1 : 0]I_mem[0 : mem_size - 1];
always_ff @(posedge r_if.clk)
begin
    r_if.inst = I_mem[r_if.inst_addr[9:2]];
end
/*initial begin
  $readmemh("program.hex",rom);
end 
  or just fill in manually
*/
/*initial
begin
  r_if.clk = 0;
  forever #20 r_if.clk = ~ r_if.clk;
end*/
initial
begin
    I_mem = '{default : 32'h00000013};
    I_mem[0]  = 32'h00500093; // ADDI x1, x0, 5  (PC = 0)
    I_mem[4]  = 32'h00a00113; // ADDI x2, x0, 10 (PC = 4)
    I_mem[8]  = 32'h002081b3; // ADD  x3, x1, x2 (PC = 8)
    I_mem[12] = 32'h40110233; // SUB  x4, x2, x1 (PC = 12 / 4'hC)
    I_mem[16] = 32'h0041f2b3; // AND  x5, x3, x4 (PC = 16 / 4'h10)
end
/*initial begin 
  r_if.inst_addr = 10'd0;#40
  r_if.inst_addr = 10'd4;#40
  r_if.inst_addr = 10'd8;#40
  r_if.inst_addr = 10'd12;#40
  r_if.inst_addr = 10'd16;
  #40;
  $finish;
end
initial
begin
   $display("clk = %0b,inst_addr = %0d, inst = %h",r_if.clk,r_if.inst_addr,r_if.inst);#40
   $display("clk = %0b,inst_addr = %0d, inst = %h",r_if.clk,r_if.inst_addr,r_if.inst);#40
   $display("clk = %0b,inst_addr = %0d, inst = %h",r_if.clk,r_if.inst_addr,r_if.inst);#40
   $display("clk = %0b,inst_addr = %0d, inst = %h",r_if.clk,r_if.inst_addr,r_if.inst);#40
   $display("clk = %0b,inst_addr = %0d, inst = %h",r_if.clk,r_if.inst_addr,r_if.inst);
end*/
endmodule