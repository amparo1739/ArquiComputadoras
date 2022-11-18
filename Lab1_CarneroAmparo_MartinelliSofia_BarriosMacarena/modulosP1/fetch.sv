// Modulo de modelado estructural. Diseño jerarquico
module fetch(input logic PCSrc_F, clk, reset,
				input logic [63:0] PCBranch_F,
				output logic [63:0] imem_addr_F);

	
    // Tener en cuenta q los cables intermedios se tendran q declarar como señales internas para poder 
   // interconectarlas, como hice en el modulo del execute con SrcBalu y SrcBadder

	logic [63:0] mux_PC, Add_mux;
	
	// Instancia del modulo MUX
	mux2 fetchmux(.d0(Add_mux), .d1(PCBranch_F), .s(PCSrc_F), .y(mux_PC));
	
	// Instancia del modulo PC
	flopr flopfetch(.clk(clk), .reset(reset), .d(mux_PC), .q(imem_addr_F));
	
	// Instancia del modulo adder
	adder adderfetch(.a(imem_addr_F), .b(64'h0000000000000004), .y(Add_mux));
	
endmodule