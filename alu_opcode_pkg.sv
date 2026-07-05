package alu_opcode;
typedef  enum logic [2:0]{
    ADD = 3'b001 ,
    SUB = 3'b010 ,
    AND = 3'b011 ,
    OR  = 3'b100 ,
    XOR = 3'b101 ,
    SL  = 3'b110 ,
    SR  = 3'b111  
} R_type;

typedef enum logic [2:0]{
    INVALID_ALU_OP = 3'b0
} ERROR;

endpackage
