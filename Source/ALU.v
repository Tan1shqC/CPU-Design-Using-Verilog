// ADD, SUB, AND, OR, XOR, NOT, SLA, SRA, SRL

module alu(
           input [31:0] A,B,  // ALU 8-bit Inputs                 
           input [3:0] ALU_Sel,// ALU Selection
           output [31:0] ALU_Out, // ALU 8-bit Output
           output CarryOut // Carry Out Flag
    );
    reg [31:0] ALU_Result;
    wire [32:0] tmp;
    assign ALU_Out = ALU_Result; // ALU out
    assign tmp = {1'b0,A} + {1'b0,B};
    assign CarryOut = tmp[32]; // Carryout flag
    always @(*)
    begin
        case(ALU_Sel)
        4'b0000: // Addition
           ALU_Result = A + B ; 
        4'b0001: // Subtraction
           ALU_Result = A - B ;
        4'b0010: // Logical AND
           ALU_Result = A & B;
        4'b0011: // Logical OR
           ALU_Result = A | B;
        4'b0100: // Logical XOR
           ALU_Result = A ^ B;
         4'b0101: // Logical NOT
           ALU_Result = ~A;
         4'b0110: // Shift Left Logical
           ALU_Result = A << B;
         4'b0111: // Shift Right Logical
           ALU_Result = A >> B;
          4'b1000: // Shift Left Arithmetic
           ALU_Result = A <<< B;
          4'b1001: // Shift Right Arithmetic
           ALU_Result = A >>> B;
          4'b1010: // Multiply
           ALU_Result = A * B;
          4'b1011: //  Logical nor
           ALU_Result = ~(A | B);
          4'b1100: // Logical nand 
           ALU_Result = ~(A & B);
          4'b1101: // Logical xnor
           ALU_Result = ~(A ^ B);
          4'b1110: // Greater comparison
           ALU_Result = (A>B)?8'd1:8'd0 ;
          4'b1111: // Equal comparison   
            ALU_Result = (A==B)?8'd1:8'd0 ;
          default: ALU_Result = A + B ; 
        endcase
    end

endmodule
