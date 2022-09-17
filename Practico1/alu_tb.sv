`timescale 1ns / 1ps //ver bien q conviene

module alu_tb();
	logic clk; // entrada de clk
	logic [63:0] a, b; // entradas del modulo alu
	logic [3:0] ALUControl; // entrada del modulo alu
	logic [63:0] result, result_expected;
	logic zero, zero_expected; // si tengo 2 salidas hace falta poner la salida esperada para cada una?
	logic [31:0] errors, test;	// NO se si esta bien que sea [31:0]
	
	logic [196:0] tests [0:14] = '{
		// 2 numeros positivos (3 y 4) con la operacion AND (ALUControl = 0000)
					//a							//b			//AluC		//result				//zero
		{64'h0000000000000003, 64'h0000000000000004, 4'b0000, 64'h0000000000000000, 1'b1},
		// 2 numeros negativos (-3 y -4) con la operacion AND (ALUControl = 0000)
		{64'hFFFFFFFFFFFFFFFD, 64'hFFFFFFFFFFFFFFFC, 4'b0000, 64'hFFFFFFFFFFFFFFFC, 1'b0},
		// 1 numero positivo (3) y un numero negativo (-4) con la operacion AND (ALUControl = 0000)
		{64'h0000000000000003, 64'hFFFFFFFFFFFFFFFC, 4'b0000, 64'h0000000000000000, 1'b1},
		
		// 2 numeros positivos (3 y 4) con la operacion OR (ALUControl = 0001)
		{64'h0000000000000003, 64'h0000000000000004, 4'b0001, 64'h000000000000007, 1'b0},
		// 2 numeros negativos (-3 y -4) con la operacion OR (ALUControl = 0001)
		{64'hFFFFFFFFFFFFFFFD, 64'hFFFFFFFFFFFFFFFC, 4'b0001, 64'hFFFFFFFFFFFFFFFD, 1'b0},
		// 1 numero positivo (3) y un numero negativo (-4) con la operacion OR (ALUControl = 0001)
		{64'h0000000000000003, 64'hFFFFFFFFFFFFFFFC, 4'b0001, 64'hFFFFFFFFFFFFFFFF, 1'b0},
		
		// 2 numeros positivos (3 y 4) con la operacion ADD (ALUControl = 0010)
		{64'h0000000000000003, 64'h0000000000000004, 4'b0010, 64'h0000000000000007, 1'b0},
		// 2 numeros negativos (-3 y -4) con la operacion ADD (ALUControl = 0010)
		{64'hFFFFFFFFFFFFFFFD, 64'hFFFFFFFFFFFFFFFC, 4'b0010, 64'hfffffffffffffff9, 1'b0},
		// 1 numero positivo (3) y un numero negativo (-4) con la operacion ADD (ALUControl = 0010)
		{64'h0000000000000003, 64'hFFFFFFFFFFFFFFFC, 4'b0010, 64'hffffffffffffffff, 1'b0},
		
		// 2 numeros positivos (3 y 4) con la operacion SUB (ALUControl = 0110)
		{64'h0000000000000003, 64'h0000000000000004, 4'b0110, 64'hFFFFFFFFFFFFFFFF, 1'b0},
		// 2 numeros negativos (-3 y -4) con la operacion SUB (ALUControl = 0110)
		{64'hFFFFFFFFFFFFFFFD, 64'hFFFFFFFFFFFFFFFC, 4'b0110, 64'h0000000000000001, 1'b0},
		// 1 numero positivo (3) y un numero negativo (-4) con la operacion SUB (ALUControl = 0110)
		{64'h0000000000000003, 64'hFFFFFFFFFFFFFFFC, 4'b0110, 64'h0000000000000007, 1'b0},
		
		// 2 numeros positivos (3 y 4) con la operacion Pass B (ALUControl = 0111)
		{64'h0000000000000003, 64'h0000000000000004, 4'b0111, 64'h0000000000000004, 1'b0},
		// 2 numeros negativos (-3 y -4) con la operacion Pass B (ALUControl = 0111)
		{64'hFFFFFFFFFFFFFFFD, 64'hFFFFFFFFFFFFFFFC, 4'b0111, 64'hFFFFFFFFFFFFFFFC, 1'b0},
		// 1 numero positivo (3) y un numero negativo (-4) con la operacion Pass B (ALUControl = 0111)
		{64'h0000000000000003, 64'hFFFFFFFFFFFFFFFC, 4'b0111, 64'hFFFFFFFFFFFFFFFC, 1'b0}
	};
	
	// instancia del modulo alu
	alu dut(a, b, ALUControl, result, zero);
	
	// generate clock
	always begin
		clk = 0; #5; clk = 1; #5;
	end
	
	//
	always @(negedge clk) begin
		{a, b, ALUControl, result_expected, zero_expected} = tests[test];
		test = test + 1;
	end
	
	// check results on falling edge of clk
	always @(posedge clk) begin
		#1;
		if (result !== result_expected | zero !== zero_expected) begin
			$display("error: test finished with unexpected result!");
			$display("result = %h (expected %h) y zero = %h (expected %h) (in %dth instance",
														result, result_expected, zero, zero_expected, test);
			errors = errors + 1;
		end
		
		if (tests[test] === 197'bx) begin
			$display("%d/%d tests finished succesfully", test-errors, test);
			$stop;
		end
	end
	
	// at start of test pulse reset. Si el modulo no tiene reset no pasa nada.
   // Esto se ejecutará una sola vez y nada mas. (Por ser un initial)
	initial begin
		test = 0; errors = 0;
	end
endmodule