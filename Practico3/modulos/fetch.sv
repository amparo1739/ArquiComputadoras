// Modulo de modelado estructural. Diseño jerarquico
module fetch(input logic PCSrc_F, clk, reset, EProc_F,
				input logic [63:0] PCBranch_F, EVAddr_F,
				output logic [63:0] imem_addr_F, NextPC_F);

	
    // Tener en cuenta q los cables intermedios se tendran q declarar como señales internas para poder 
   // interconectarlas, como hice en el modulo del execute con SrcBalu y SrcBadder

	//assign EVAddr_F = 64'hD8; // es una constante pq viene del Exc_vector
	logic [63:0] output_addr, output_muxerr;
	
	// Instancia del modulo MUX 2:1
	mux2 fetchmux(.d0(output_addr), .d1(PCBranch_F), .s(PCSrc_F), .y(NextPC_F));
	
	// Instancia de otro modulo MUX 2:1
	mux2 fetchmux2(.d0(NextPC_F), .d1(EVAddr_F), .s(EProc_F), .y(output_muxerr));
	
	// Instancia del modulo PC
	flopr flopfetch(.clk(clk), .reset(reset), .d(output_muxerr), .q(imem_addr_F));
	
	// Instancia del modulo adder
	adder adderfetch(.a(64'h0000000000000004), .b(imem_addr_F), .y(output_addr));
	
	
endmodule