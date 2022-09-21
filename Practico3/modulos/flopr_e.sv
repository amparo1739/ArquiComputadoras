module flopr_e
// MODIFICAR LO NECESARIO!
	#(parameter N = 64) //nombre y valor del parametro generico
	(input logic clk, reset, enable, // agregado de entrada enable
	input logic [N-1:0] d,
	output logic [N-1:0] q);
	
	always_ff @(posedge clk, posedge reset)
		if (reset) q <= 4'b0; // lo del reset se mantiene 
		else if (enable) q <= d; // si el enable es 1 se actualiza el valor del reg
endmodule