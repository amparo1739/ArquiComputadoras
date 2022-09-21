module execute(input logic AluSrc,
					input logic [3:0] AluControl,
					input logic [63:0] PC_E, signImm_E, readData1_E, readData2_E, readData3_E,
					output logic [63:0] PCBranch_E, aluResult_E, writeData_E,
					output logic zero_E);
	logic [63:0] mux_alu, B_adder; 
					
	// Instancia del modulo mux
	mux4 alumux(.d0(readData2_E), .d1(signImm_E), .d2(readData3_E), .d3(readData3_E), .s(AluSrc), .y(mux_alu));  
	
	// Instancia del modulo alu
	alu alu(.a(readData1_E), .b(mux_alu), .ALUControl(AluControl), .result(aluResult_E), .zero(zero_E));
	
	// Instancia del modulo shift left 2
	sl2 shiftBR(.a(signImm_E), .y(B_adder));
	
	// Instancia del modulo adder
	adder pcadd(.a(PC_E), .b(B_adder), .y(PCBranch_E));
	
	assign writeData_E = readData2_E; // para entender esto ver la fig del modulo execute
	
endmodule