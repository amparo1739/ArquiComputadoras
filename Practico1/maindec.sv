module maindec (input logic reset, ExtIRQ, // nuevas entradas para pasarle al controller
					input logic [10:0] Op,
					output logic ERet, Reg2Loc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, NotAnInstr,
					output logic [1:0] ALUOp, ALUSrc,
					output logic [3:0] EStatus);
					
					always_comb begin
						if (reset) begin
							{Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, 
							Branch, ALUOp, EStatus, ERet, NotAnInstr} = 16'b0;
						end
					
						else begin
							casez(Op[10:0])
								//LDUR 
								11'b111_1100_0010: begin Reg2Loc = 1'bX; ALUSrc = 2'b01; MemtoReg = 1; RegWrite = 1; MemRead = 1; MemWrite = 0; Branch = 0; ALUOp = 2'b00; EStatus = 0000; ERet = 0; NotAnInstr = 0; end
								//STUR
								11'b111_1100_0000: begin Reg2Loc = 1; ALUSrc = 2'b01; MemtoReg = 1'bX; RegWrite = 0; MemRead = 0; MemWrite = 1; Branch = 0; ALUOp = 2'b00; EStatus = 0000; ERet = 0; NotAnInstr = 0; end
								//CBZ 
								11'b101_1010_0???: begin Reg2Loc = 1; ALUSrc = 2'b00; MemtoReg = 1'bX; RegWrite = 0; MemRead = 0; MemWrite = 0; Branch = 1; ALUOp = 2'b01; EStatus = 0000; ERet = 0; NotAnInstr = 0; end
								//ADD 
								11'b100_0101_1000: begin Reg2Loc = 0; ALUSrc = 2'b00; MemtoReg = 0; RegWrite = 1; MemRead = 0; MemWrite = 0; Branch = 0; ALUOp = 2'b10; EStatus = 0000; ERet = 0; NotAnInstr = 0; end
								//SUB 
								11'b110_0101_1000: begin Reg2Loc = 0; ALUSrc = 2'b00; MemtoReg = 0; RegWrite = 1; MemRead = 0; MemWrite = 0; Branch = 0; ALUOp = 2'b10; EStatus = 0000; ERet = 0; NotAnInstr = 0; end
								//AND 
								11'b100_0101_0000: begin Reg2Loc = 0; ALUSrc = 2'b00; MemtoReg = 0; RegWrite = 1; MemRead = 0; MemWrite = 0; Branch = 0; ALUOp = 2'b10; EStatus = 0000; ERet = 0; NotAnInstr = 0; end
								//ORR 
								11'b101_0101_0000: begin Reg2Loc = 0; ALUSrc = 2'b00; MemtoReg = 0; RegWrite = 1; MemRead = 0; MemWrite = 0; Branch = 0; ALUOp = 2'b10; EStatus = 0000; ERet = 0; NotAnInstr = 0; end
								// ERET
								11'b1101011_0100: begin Reg2Loc = 0; ALUSrc = 2'b00; MemtoReg = 1'bx; RegWrite = 0; MemRead = 0; MemWrite = 0; Branch = 0; ALUOp = 2'b10; EStatus = 0000; ERet = 1; NotAnInstr = 0; end
								// MRS
								11'b1101010_1001: begin Reg2Loc = 1; ALUSrc = 2'bxx; MemtoReg = 0; RegWrite = 1; MemRead = 0; MemWrite = 0; Branch = 0; ALUOp = 2'b01; EStatus = 0000; ERet = 0; NotAnInstr = 0; end          
								// Opcode Invalido
								default: begin Reg2Loc = 1'bx; ALUSrc = 2'bxx; MemtoReg = 0; RegWrite = 0; MemRead = 0; MemWrite = 0; Branch = 0; ALUOp = 2'bxx; EStatus = 0010; ERet = 0; NotAnInstr = 1; end
							endcase
	
							if (ExtIRQ) 
								EStatus = 0001;
						end
					end
endmodule							