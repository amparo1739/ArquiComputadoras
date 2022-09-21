// Circuito combinacional que compara dos números de N bits c/u. Si ambos
// números son iguales la salida es ‘1’, caso contrario, ‘0’.
module comp_n 
	#(parameter N = 64)
	(input logic [N-1:0] in1, in2,
	output logic out);
	
	always_comb
		if(in1 === in2) out = 1'b1;
		else out = 1'b0;
		
endmodule