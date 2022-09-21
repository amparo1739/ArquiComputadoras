// Modulo de modelado estructural. Diseño jerarquico
module fetch(input logic PCSrc_F, clk, reset, EProc_F,
				input logic [63:0] PCBranch_F,
				output logic [63:0] imem_addr_F, NextPC_F);

	
    // Tener en cuenta q los cables intermedios se tendran q declarar como señales internas para poder 
   // interconectarlas, como hice en el modulo del execute con SrcBalu y SrcBadder

	//assign EVAddr_F = 64'hD8; // es una constante pq viene del Exc_vector
	logic [63:0] mux_mux, Add_mux, mux_PC;
	
	// Instancia del modulo MUX 2:1
	mux2 fetchmux(.d0(Add_mux), .d1(PCBranch_F), .s(PCSrc_F), .y(mux_mux));
	
	// Instancia de otro modulo MUX 2:1
	mux2 fetchmux2(.d0(mux_mux), .d1(64'hD8), .s(EProc_F), .y(mux_PC));
	
	// Instancia del modulo PC
	flopr flopfetch(.clk(clk), .reset(reset), .d(mux_PC), .q(imem_addr_F));
	
	// Instancia del modulo adder
	adder adderfetch(.a(imem_addr_F), .b(64'h0000000000000004), .y(Add_mux));
	
	assign NextPC_F = mux_mux;
	
endmodule