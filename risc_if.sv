interface risc_if #(parameter mem_size = 1024, parameter Inst_Width = 32,parameter NUM_REG = 32,parameter OPCODE = 8)();
    logic clk;
    logic rst;
    logic w_en; // write en to register file
    logic mem_w_en; // write en to data memory(soon to be L1 cache)
    logic mem_to_reg; // mux input to write to mem or reg
    logic [$clog2(mem_size)-1:0] inst_addr;
    logic [Inst_Width - 1 : 0] inst;
    logic [Inst_Width - 1 : 0] i_data;
    logic [$clog2(mem_size) - 1 : 0] i_addr;
    logic [Inst_Width - 1 : 0] o_data;
    logic [Inst_Width - 1 : 0] rd;
     logic [Inst_Width - 1 : 0] alu_out;
    logic [$clog2(NUM_REG) - 1 : 0] rd_addr;
    logic [$clog2(NUM_REG) - 1 : 0] rs1_addr;
    logic [$clog2(NUM_REG) - 1 : 0] rs2_addr;
    logic [Inst_Width - 1 : 0 ]rs1,rs2;
    logic [Inst_Width - 1 : 0 ]in_rs2;
    logic [OPCODE - 1 : 0] opcode;
    logic branch;
    logic[1:0] result_mux;
    logic [1:0] branch_op;
    logic alu_src_a;
    logic alu_src_b;
    logic [2:0] alu_op;
    logic [31:0]imm;
    logic take;
    logic [$clog2(mem_size)-1 : 0] Current_PC_addr;
    logic [$clog2(mem_size)-1 : 0] PC_mux_0;
    logic [$clog2(mem_size)-1 : 0] PC_mux_1;
    logic [$clog2(mem_size)-1 : 0] Next_PC_addr;
     logic [Inst_Width - 1 : 0] data_mux_out;
modport inst_mem_mb(
    input clk, inst_addr,
    output inst
);
modport D_mem_mb(
    input clk,w_en,i_data,i_addr,
    output o_data
);
modport Reg_file_mb(
    input clk,w_en,rd,rd_addr,rs1_addr,rs2_addr,
    output rs1,rs2
);
modport Decoder_mb(
    input inst,
    output opcode, branch,result_mux,branch_op,alu_src_a,
         alu_src_b, alu_op,rs1_addr, rs2_addr,rd_addr,mem_w_en,w_en,mem_to_reg
);
modport sign_extn_mb(
    input inst, opcode,
    output imm
);
modport branch_mb(
    input branch,branch_op,rs1,rs2,
    output take
);
modport ALU_mb(
    input alu_op,rs1,in_rs2,
    output alu_out
);
modport ALU_mux_mb(
    input rs2,imm,alu_src_b,
    output in_rs2
);
modport PC_mb(
    input Next_PC_addr,clk,rst,
    output inst_addr
);
modport PC_mux_mb(
    input PC_mux_0,PC_mux_1,take,
    output Next_PC_addr
);
modport PC_addr_mb(
    input inst_addr, imm,
    output PC_mux_0, PC_mux_1
);
modport PC_module_mb(
    input clk,rst,imm,take,
    output inst_addr
);
modport data_mux_mb(
    input alu_out,o_data,mem_to_reg,
    output data_mux_out
);
endinterface