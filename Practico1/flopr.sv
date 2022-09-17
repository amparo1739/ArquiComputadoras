module flopr
	#(parameter N = 64) //nombre y valor del parametro generico
	(input logic clk, reset,
	input logic [N-1:0] d,
	output logic [N-1:0] q);
	
	always_ff @(posedge clk, posedge reset)
		if(reset) q <= 64'b000; //si llega la señal de reset (1), la salida se pone en 0
		else q <= d;	//si no, pasa d (dato de entrada)
endmodule