module maindec (input logic [10:0] Op,
					output logic Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch,
					output logic [1:0] ALUOp);
					
					// Ver como lo hizo la profe tmb. Es mas facil (clase 2021)
					always_comb
					casez(Op[10:0])
						//LDUR 
						11'b111_1100_0010: begin Reg2Loc = 0; ALUSrc = 1; MemtoReg = 1; RegWrite = 1; MemRead = 1; MemWrite = 0; Branch = 0; ALUOp = 2'b00; end
						//STUR
					   11'b111_1100_0000: begin Reg2Loc = 1; ALUSrc = 1; MemtoReg = 0; RegWrite = 0; MemRead = 0; MemWrite = 1; Branch = 0; ALUOp = 2'b00; end
						//CBZ 
						11'b101_1010_0???: begin Reg2Loc = 1; ALUSrc = 0; MemtoReg = 0; RegWrite = 0; MemRead = 0; MemWrite = 0; Branch = 1; ALUOp = 2'b01; end
						//ADD 
						11'b100_0101_1000: begin Reg2Loc = 0; ALUSrc = 0; MemtoReg = 0; RegWrite = 1; MemRead = 0; MemWrite = 0; Branch = 0; ALUOp = 2'b10; end
						//SUB 
						11'b110_0101_1000: begin Reg2Loc = 0; ALUSrc = 0; MemtoReg = 0; RegWrite = 1; MemRead = 0; MemWrite = 0; Branch = 0; ALUOp = 2'b10; end
						//AND 
						11'b100_0101_0000: begin Reg2Loc = 0; ALUSrc = 0; MemtoReg = 0; RegWrite = 1; MemRead = 0; MemWrite = 0; Branch = 0; ALUOp = 2'b10; end
						//ORR 
						11'b101_0101_0000: begin Reg2Loc = 0; ALUSrc = 0; MemtoReg = 0; RegWrite = 1; MemRead = 0; MemWrite = 0; Branch = 0; ALUOp = 2'b10; end
						default: begin Reg2Loc = 0; ALUSrc = 0; MemtoReg = 0; RegWrite = 0; MemRead = 0; MemWrite = 0; Branch = 0; ALUOp = 2'b00; end
					endcase
endmodule							