// CONTROLLER

module controller(input logic [10:0] instr,
						input logic reset, // nueva entrada
						input logic ExtIRQ, // nueva entrada
						input logic ExcAck, // nueva entrada
						output logic ExtlAck, ERet, Exc, // nuevas salidas
						output logic [3:0] EStatus, // nueva salida
						output logic [1:0] AluSrc, // cambio en la AluSrc
						output logic [3:0] AluControl,						
						output logic reg2loc, regWrite, Branch,
											memtoReg, memRead, memWrite);
											
	logic [1:0] AluOp_s;
	logic NotAnInstr;
	
	assign ExtlAck = (ExcAck & ExtIRQ) ? 1'b1 : 1'b0;
				
	maindec 	decPpal 	(.reset(reset), // nueva conexion
							.ExtIRQ(ExtIRQ), // nueva conexion
							.Op(instr), 
							.Reg2Loc(reg2loc), 
							.ALUSrc(AluSrc), 
							.MemtoReg(memtoReg), 
							.RegWrite(regWrite), 
							.MemRead(memRead), 
							.MemWrite(memWrite), 
							.Branch(Branch), 
							.ALUOp(AluOp_s),
							.ERet(ERet), // nueva conexion
							.EStatus(EStatus), // nueva conexion
							.NotAnInstr(NotAnInstr));	// nueva conexion
					
	assign Exc = (ExtIRQ | NotAnInstr);
	
	aludec 	decAlu 	(.funct(instr), 
							.aluop(AluOp_s), 
							.alucontrol(AluControl));
			
endmodule
