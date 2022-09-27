module exception (input logic Exc, ExcAck, Eret, reset, clk,
					input logic [63:0] NextPC_F, PCBranch_E, Exc_vector,
					input logic [3:0] EStatusI,
					input logic [31:0] IM_readData,
					output logic [63:0] readData3_E, PCBranch,
					output logic eproc);
	
	logic out_esync;
	logic [63:0] out_ELR, out_ERR, input_d2mux;
	logic [3:0] out_ESR;
	
	
	eSync 	es       (.Exc(Exc),
								.resetEsync(ExcAck),
								.reset(reset),
								.out(out_esync));
				
	assign eproc = out_esync & ~reset;
	
	flopr_e  #(64)		ERR(.clk(clk),
								 .reset(reset),
								 .enable(eproc),
								 .d(NextPC_F),
								 .q(out_ERR));
	
	flopr_e 	#(64)		ELR(.clk(clk),
								 .reset(reset),
								 .enable(eproc),
								 .d(Exc_vector),
								 .q(out_ELR));
								 
	flopr_e	#(4)		ESR(.clk(clk),
								 .reset(reset),
								 .enable(eproc),
								 .d(EStatusI),
								 .q(out_ESR));
	
	mux2 		#(64)		mux2(.d0(PCBranch_E),
								  .d1(out_ERR),
								  .s(Eret),
								  .y(PCBranch));
	
	assign input_d2mux = {60'b0, out_ESR};
								 
	mux4 		#(64)		mux4(.d0(out_ERR),
								  .d1(out_ELR),
								  .d2(input_d2mux),
								  .d3({64'b0}),
								  .s(IM_readData[13:12]),
								  .y(readData3_E));
	
endmodule