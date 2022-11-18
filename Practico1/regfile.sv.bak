module regfile(input logic clk, we3,
					input logic [4:0] ra1, ra2, wa3,
					input logic [63:0] wd3,
					output logic [63:0] rd1, rd2);
					
	// Datos: wd3 es el puerto de escritura de los registros
				// ra1 y ra2 son señales de direccionamiento q determinan
				//la posicion de los datos de salida rd1 y rd2 respect.
				// wa3 selecciona el reg en el q se almacenara el dato 
				//contenido en wd3
	// Notas:
		// 1. El cont del reg 31 (XZR) debe devolver siempre 0. Esta prohibido
		//la escritura en ese registro
		// 2. El dato contenido en wd3 se guarda en la direcc determinada por
		//wa3 siempre q la señal we3 tenga valor 1 y se detecte un flanco 
		//positivo de clk (escritura asincrona)
		// 3. La lectura de los datos de salida rd1 y rd2 es asincrona
		// 4. Inicializar los regs x0 a x30 con los valores 0 a 30 respect.
		
	// Combinaciones de entradas y resultados de salida:
	
	// 32 registros de 64 bits inicializados con su numero
	logic [63:0] regs [0:31] = '{64'd0, 64'd1, 64'd2, 64'd3, 
										64'd4, 64'd5, 64'd6, 64'd7, 
										64'd8, 64'd9, 64'd10, 64'd11, 
										64'd12, 64'd13, 64'd14, 64'd15, 
										64'd16, 64'd17, 64'd18, 64'd19,
										64'd20, 64'd21, 64'd22, 64'd23, 
										64'd24, 64'd25, 64'd26, 64'd27, 
										64'd28, 64'd29, 64'd30, 64'd0};
	 
	 // lectura de los datos de salida Asincrona (Automatica. Apenas cambia la entrada, cambia la salida)
	 //La opcion mas corta es hacer:
	 assign rd1 = (ra1 === 5'd31) ? 64'd0 : regs[ra1];
	 assign rd2 = (ra2 === 5'd31) ? 64'd0 : regs[ra2];
	 
	 always_ff @(posedge clk) // si viene un flaco positivo de clk
		if(we3) // Cuando we3 esta en 1 y flanco + de clk es pq esta habilitado p escribir
			regs[wa3] <= wd3; // asignacion no bloqueante pq es always_ff
			
endmodule