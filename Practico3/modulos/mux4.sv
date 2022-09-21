// 2:1 MULTIPLEXER
//MODIFICAR LO NECESARIO
// creo q en el teorico habian dado la implementacion de un mux de 4 entradas
module mux4 #(parameter N = 64)
				(input logic [N-1:0] d0, d1, d2, d3, //4 entradas de datos
				input logic [1:0] s, // entrada de señal de 2 bits (en orden)
				output logic [N-1:0] y); // 1 salida
				
	//assign y = s ? d1 : d0;
	always_comb
		if(s === 2'b0) y = d0;
		else if(s === 2'b01) y = d1;
		else if(s === 2'b10) y = d2;
		else y = d3;
	
endmodule