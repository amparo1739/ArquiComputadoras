	.text
	.org 0x0000
	
	/*// Ejercicio 2-A: con la menor cantidad de registros e instrucciones, inicializar con el valor de su índice
	//las primeras N posiciones de memoria (comenzando en la dirección “0”)

	// Los registros vienen inicializados de x0 a x30 con el valor de sus indices
	add x5, x30, x30 // x5 = x30 + x30 = 30 + 30 = 60
	add x5, x5, x4 // x5 = x5 + x4 = 60 + 4 = 64 // x5 será el contador de posiciones
	sub x2, x2, x2 // x2 = x2 - x2 = 2 - 2 = 0
loop:
	stur x2, [x0, #0] // carga el valor de x2 en la direccion de mem apuntada por x0 + 0 = en la address 0 guardará 0
						// es decir, la memoria en la posición 0 queda con el valor 0
	add x0, x0, x8 // x0 = 0 + 8 = 8 para pasar a la siguiente posicion de memoria
	sub x5, x5, x1 // x5 = x5 - x1 = 64 - 1 = 63 // decremento el contador pq ya avancé a la siguiente posicion de mem
	add x2, x2, x1 // x2 = x2 + x1 = 0 + 1 = 1 // aumento para la inicializacion
	cbz x5, exitloop // Se ejecutará 64 veces hasta q x5 llegue a 0 y termina el programa
	cbz xzr, loop
exitloop: 
	cbz XZR, exitloop*/


	// Ejercicio 2-B: Realizar la sumatoria de las primeras N posiciones de memoria y guardar el resultado
	//en la posición N+1

	// N = 29
	// Inizialización de la memoria
		ADD x10, xzr, xzr // x10 = 0
	loop2: // while x0 != 30
		SUB x11, x0, x30
		CBZ x11, end
		STUR x0, [x10, #0]
		ADD x0, x1, x0
		ADD x10, x10, x8
		CBZ xzr, loop2
	end:

	// Ejercicio 2b
	// N = 29


		stur x12, [x0, #8]
		stur x18, [x0, #32]



		add x2, xzr, xzr
		add x4, xzr, xzr
	loop: // do while x0 != 30
		ldur x3, [x2, #0]
		add x4, x4, x3
		add x2, x2, x8

		add x5, x5, x1
		// end loop
		sub x5, x30, x0
		cbz x5, loop

		stur x4, [x2, #0]


	infloop:
		cbz xzr, infloop


/*imem anterior:
		ROM = '{32'hf8000001,
			   32'hf8008002,
			   32'hf8000203,
				32'h8b050083,
				32'hf8018003,	
				32'hcb050083,
				32'hf8020003,
				32'hcb0a03e4,
				32'hf8028004,
				32'h8b040064,
				32'hf8030004,
				32'hcb030025,
				32'hf8038005,
				32'h8a1f0145,
				32'hf8040005,
				32'h8a030145,
				32'hf8048005,
				32'h8a140294,
				32'hf8050014,
				32'haa1f0166,
				32'hf8058006,
				32'haa030166,
				32'hf8060006,
				32'hf840000c,
				32'h8b1f0187,
				32'hf8068007,
				32'hf807000c,
				32'h8b0e01bf,
				32'hf807801f,
				32'hb4000040,
				32'hf8080015,
				32'hf8088015,
				32'h8b0103e2,
				32'hcb010042,
				32'h8b0103f8,
				32'hf8090018,
				32'h8b080000,
				32'hb4ffff82,
				32'hf809001e,
				32'h8b1e03de,
				32'hcb1503f5,
				32'h8b1403de,
				32'hf85f83d9,
				32'h8b1e03de,
				32'h8b1003de,
				32'hf81f83d9,
				32'hb400001f,
				'0,
				'0,
				'0,
				'0,
				'0,
				'0,
				'0,
				'0,
				'0,
				'0,
				'0,
				'0,
				'0,
				'0,
				'0,
				'0,
				'0};
				*/
