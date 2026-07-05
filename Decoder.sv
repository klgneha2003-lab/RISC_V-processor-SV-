module Decoder #(parameter Inst_Width = 32,parameter NUM_REG = 32,parameter OPCODE = 8) ();
logic [2:0] func3; // decide the operation to be done based on the opcode(opcode defines type of instruction)
logic [6:0] func7;
always_comb
begin 
    r_if.opcode = r_if.inst[6:0];
    r_if.rd_addr = r_if.inst[11:7];
    func3 = r_if.inst[14:12];
    r_if.rs1_addr = r_if.inst[19:15];
    r_if.rs2_addr = r_if.inst[24:20];
    case(r_if.opcode)
    7'b0110011 : begin               // R-type inst
                    func7 = r_if.inst[31:25];
                    if(func3 == 3'b0 && func7 == 7'b0000000)
                      begin
                         r_if.alu_op = 3'b001;
                         r_if.branch_op = 2'bx;
                         r_if.branch = 1'b0; 
                         r_if.result_mux = 2'b00;
                         r_if.mem_w_en = 1'b0;
                         r_if.alu_src_a = 1'b0;
                         r_if.alu_src_b = 1'b0;
                        r_if.w_en = 1'b1;
                        r_if.mem_to_reg = 1'b0;
                      end
                    else if (func3 == 3'b0 && func7 == 7'b0100000)
                       begin
                         r_if.alu_op = 3'b010;
                         r_if.branch_op = 2'bx;
                         r_if.branch = 1'b0; 
                         r_if.result_mux = 2'b00;
                         r_if.mem_w_en = 1'b0;
                         r_if.alu_src_a = 1'b0;
                         r_if.alu_src_b = 1'b0;
                         r_if.w_en = 1'b1;
                          r_if.mem_to_reg = 1'b0;
                          
                       end
                    else if (func3 == 3'b111 && func7 == 7'b0)
                        begin
                         r_if.alu_op = 3'b011;
                         r_if.branch_op = 2'bx;
                         r_if.branch = 1'b0; 
                         r_if.result_mux = 2'b00;
                         r_if.mem_w_en = 1'b0;
                         r_if.alu_src_a = 1'b0;
                         r_if.alu_src_b = 1'b0;
                         r_if.w_en = 1'b1;
                          r_if.mem_to_reg = 1'b0;
                        end
                    else if (func3 == 3'b110 && func7 == 7'b0)
                        begin
                           r_if.alu_op = 3'b100;
                           r_if.branch_op = 2'bx;
                           r_if.branch = 1'b0; 
                           r_if.result_mux = 2'b00;
                           r_if.mem_w_en = 1'b0;
                           r_if.alu_src_a = 1'b0;
                           r_if.alu_src_b = 1'b0;
                           r_if.w_en = 1'b1;
                            r_if.mem_to_reg = 1'b0;
                        end
                    else if (func3 == 3'b100 && func7 == 7'b0)
                        begin
                           r_if.alu_op = 3'b101;
                           r_if.branch_op = 2'bx;
                           r_if.branch = 1'b0; 
                           r_if.result_mux = 2'b00;
                           r_if.mem_w_en = 1'b0;
                           r_if.alu_src_a = 1'b0;
                           r_if.alu_src_b = 1'b0;
                           r_if.w_en = 1'b1;
                            r_if.mem_to_reg = 1'b0;
                        end
                    else if (func3 == 3'b001 && func7 == 7'b0)
                        begin
                           r_if.alu_op = 3'b110;
                           r_if.branch_op = 2'bx;
                           r_if.branch = 1'b0; 
                           r_if.result_mux = 2'b00;
                           r_if.mem_w_en = 1'b0;
                           r_if.alu_src_a = 1'b0;
                           r_if.alu_src_b = 1'b0;
                           r_if.w_en = 1'b1;
                            r_if.mem_to_reg = 1'b0;
                        end
                    else if (func3 == 3'b101 && func7 == 7'b0)
                        begin
                           r_if.alu_op = 3'b111;
                           r_if.branch_op = 2'bx;
                           r_if.branch = 1'b0; 
                           r_if.result_mux = 2'b00;
                           r_if.mem_w_en = 1'b0;
                           r_if.alu_src_a = 1'b0;
                           r_if.alu_src_b = 1'b0;
                           r_if.w_en = 1'b1;
                            r_if.mem_to_reg = 1'b0;
                        end
                    else
                        begin
                           r_if.alu_op = 3'b0;
                           r_if.branch_op = 2'bx;
                           r_if.branch = 1'b0; 
                           r_if.result_mux = 2'b00;
                           r_if.mem_w_en = 1'b0;
                           r_if.alu_src_a = 1'b0;
                           r_if.alu_src_b = 1'b0;
                           r_if.w_en = 1'b0;
                            r_if.mem_to_reg = 1'b0;
                        end
                 end
    7'b0010011 : begin         //I-type inst
                   if(func3 == 3'b0)
                     begin
                       r_if.alu_op = 3'b001;
                       r_if.branch_op = 2'bx;
                       r_if.branch = 1'b0; 
                       r_if.result_mux = 2'b00;
                       r_if.mem_w_en = 1'b0;
                       r_if.alu_src_a = 1'b0;
                       r_if.alu_src_b = 1'b1;
                       r_if.w_en = 1'b1;
                        r_if.mem_to_reg = 1'b0;
                     end
                    else if(func3 == 3'b010)
                      begin
                        r_if.alu_op = 3'b001;
                        r_if.branch_op = 2'bx;
                        r_if.branch = 1'b0; 
                        r_if.result_mux = 2'b01;
                        r_if.mem_w_en = 1'b0;
                        r_if.alu_src_a = 1'b0;
                        r_if.alu_src_b = 1'b1;
                        r_if.w_en = 1'b1;
                         r_if.mem_to_reg = 1'b1;
                      end
                    else if(func3 == 3'b111)
                      begin
                        r_if.alu_op = 3'b011;
                        r_if.branch_op = 2'bx;
                        r_if.branch = 1'b0; 
                        r_if.result_mux = 2'b00;
                        r_if.mem_w_en = 1'b0;
                        r_if.alu_src_a = 1'b0;
                        r_if.alu_src_b = 1'b1;
                        r_if.w_en = 1'b1;
                         r_if.mem_to_reg = 1'b0;
                      end
                    else if(func3 == 3'b110)
                      begin
                        r_if.alu_op = 3'b100;
                        r_if.branch_op = 2'bx;
                        r_if.branch = 1'b0; 
                        r_if.result_mux = 2'b00;
                        r_if.mem_w_en = 1'b0;
                        r_if.alu_src_a = 1'b0;
                        r_if.alu_src_b = 1'b1;
                        r_if.w_en = 1'b1;
                         r_if.mem_to_reg = 1'b0;
                      end
                    else if(func3 == 3'b100)
                      begin
                        r_if.alu_op = 3'b101;
                        r_if.branch_op = 2'bx;
                        r_if.branch = 1'b0; 
                        r_if.result_mux = 2'b00;
                        r_if.mem_w_en = 1'b0;
                        r_if.alu_src_a = 1'b0;
                        r_if.alu_src_b = 1'b1;
                        r_if.w_en = 1'b1;
                         r_if.mem_to_reg = 1'b0;
                      end
                    else
                      begin
                        r_if.alu_op = 3'b0;
                        r_if.branch_op = 2'bx;
                        r_if.branch = 1'b0; 
                        r_if.result_mux = 2'b00;
                        r_if.mem_w_en = 1'b0;
                        r_if.alu_src_a = 1'b0;
                        r_if.alu_src_b = 1'b1;
                        r_if.w_en = 1'b0;
                         r_if.mem_to_reg = 1'b0;
                      end 
                 end
    7'b0100011 : begin   // S -type inst
                   if(func3 == 3'b010)
                     begin
                        r_if.alu_op = 3'b001;
                        r_if.branch_op = 2'bx;
                        r_if.branch = 1'b0; 
                        r_if.result_mux = 2'bxx;
                        r_if.mem_w_en = 1'b1;
                        r_if.alu_src_a = 1'b0;
                        r_if.alu_src_b = 1'b1;
                        r_if.w_en = 1'b0;
                         r_if.mem_to_reg = 1'bx;
                     end
                    else if (func3 == 3'b001)
                     begin
                        r_if.alu_op = 3'b001;
                        r_if.branch_op = 2'bx;
                        r_if.branch = 1'b0; 
                        r_if.result_mux = 2'bxx;
                        r_if.mem_w_en = 1'b1;
                        r_if.alu_src_a = 1'b0;
                        r_if.alu_src_b = 1'b1;
                        r_if.w_en = 1'b0;
                         r_if.mem_to_reg = 1'bx;
                     end
                    else if (func3 == 3'b000)
                     begin
                        r_if.alu_op = 3'b001;
                        r_if.branch_op = 2'bx;
                        r_if.branch = 1'b0; 
                        r_if.result_mux = 2'bxx;
                        r_if.mem_w_en = 1'b1;
                        r_if.alu_src_a = 1'b0;
                        r_if.alu_src_b = 1'b1;
                        r_if.w_en = 1'b0;
                         r_if.mem_to_reg = 1'bx;
                     end
                    else
                     begin
                        r_if.alu_op = 3'b0;
                        r_if.branch_op = 2'bx;
                        r_if.branch = 1'b0; 
                        r_if.result_mux = 2'b00;
                        r_if.mem_w_en = 1'b0;
                        r_if.alu_src_a = 1'b0;
                        r_if.alu_src_b = 1'b1;
                        r_if.w_en = 1'b0;
                         r_if.mem_to_reg = 1'bx;
                     end 
                 end 
    7'b1100011 : begin     // B-type inst
                   if(func3 == 3'b000)
                     begin
                       r_if.alu_op = 3'bx;
                       r_if.branch_op = 2'b01;
                       r_if.branch = 1'b1;
                       r_if.result_mux = 2'bxx;
                       r_if.mem_w_en = 1'b0;
                       r_if.alu_src_a = 1'b1;
                       r_if.alu_src_b = 1'b1;
                       r_if.w_en = 1'b0;
                        r_if.mem_to_reg = 1'bx;
                     end
                    else if (func3 == 3'b001)
                     begin
                       r_if.alu_op = 3'bx;
                       r_if.branch_op = 2'b10;
                       r_if.branch = 1'b1;
                       r_if.result_mux = 2'bxx;
                       r_if.mem_w_en = 1'b0;
                       r_if.alu_src_a = 1'b1;
                       r_if.alu_src_b = 1'b1;
                       r_if.w_en = 1'b0;
                        r_if.mem_to_reg = 1'bx;
                     end
                    else
                      begin
                        r_if.alu_op = 3'bx;
                        r_if.branch_op = 2'b0;
                        r_if.branch = 1'b1;
                        r_if.result_mux = 2'bxx;
                        r_if.mem_w_en = 1'b0;
                        r_if.alu_src_a = 1'b1;
                        r_if.alu_src_b = 1'b1;
                        r_if.w_en = 1'b0;
                         r_if.mem_to_reg = 1'bx;
                      end 
                 end
    default    :  begin
                   r_if.alu_op = 3'b0;
                   r_if.branch_op = 2'b0;
                   r_if.mem_w_en = 1'b0;
                   r_if.w_en = 1'b0;
                    r_if.mem_to_reg = 1'bx;
                 end
    endcase
end
endmodule