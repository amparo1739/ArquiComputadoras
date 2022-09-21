// se deben instanciar los módulos creados en el ejercicio 1 (#flopr_e, #mux4, #ESync, #comp_n)
// y realizar las conexiones correspondientes en el módulo #datapath.
module exception (input logic clk, reset, Exc, ExcAck, ERet,
						input logic [3:0] EStatus,
						input logic [31:0] IM_readData,
						output logic [63:0] IM_addr); 


	logic esync_or, EProc;
	logic [63:0] flopre1_mux4, flopre2_mux4, readData3_E, NextPC_F, flopre3_mux4;
	logic [63:0] execute_mux2, PCBranch;
	
	// Instancia del modulo mux4
	mux4 mux4(.d0(), .d1(), .d2(), .d3());
	
	// Instancia del modulo comp_n
	comp_n comp_n(.in1(64'hD8), .in2(IM_addr), .out(ExcAck));
	
	// Instancia del modulo ESync
	eSync esync(.Exc(Exc), .resetEsync(ExcAck), .reset(reset), .out(esync_or));
	always_comb
		begin
			EProc = esync_or & (!reset);
		end
	
	// Instancia 1 del modulo flopr_e
	flopr_e flopre1(.clk(clk), .reset(reset), .enable(EProc), .d(IM_addr), .q(flopre1_mux4));
	
	// Instancia 2 del modulo flopr_e
	flopr_e flopre2(.clk(clk), .reset(reset), .enable(EProc), .d(EStatus), .q(flopre2_mux4));
	
	// Instancia MUX4
	mux4 muxx4(.d0(flopre3_mux4), .d1(flopre1_mux4), .d2(flopre2_mux4), .d3(64'b0), .s(IM_readData), .y(readData3_E));
	
	// Instancia 3 del modulo flopr_e
	flopr_e flopre3(.clk(clk), .reset(reset), .enable(EProc), .d(NextPC_F), .q(flopre3_mux4));
	
	// Instancia del mux2
	mux2 muxx2(.d0(execute_mux2), .d1(flopre3_mux4), .s(ERet), .y(PCBranch));
	
		
endmodule