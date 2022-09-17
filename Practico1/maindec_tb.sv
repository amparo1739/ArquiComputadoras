module maindec_tb();
	logic clk;
	logic [10:0] Op;
	logic Reg2Loc, R2L_exp, ALUSrc, AluSrc_exp, MemtoReg, MtR_exp;
   logic RegWrite, RegW_exp, MemRead, MemR_exp, MemWrite, MemW_exp, Branch, Br_exp;
	logic [1:0] ALUOp;
	logic [31:0] errors, test;	
	
	// instancia del modulo maindec
	maindec dut(Op, Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp);
	
	// vector de palabras de 18 bits (por las entradas y las salidas) y 7 lugares por la cant de instrucciones
										//       Op         Reg2Loc ...
	logic [18:0] tests [6:0] = '{{11'b111_1100_0010, 1'b0, 1'b1, 1'b1, 1'b1, 1'b1, 1'b0, 1'b0, 2'b00}, //ldur
										  {11'b111_1100_0000, 1, 1, 0, 0, 0, 1, 0, 2'b00}, //stur
										  {11'b101_1010_0000, 1, 0, 0, 0, 0, 0, 1, 2'b01}, //cbz
										  {11'b100_0101_1000, 0, 0, 0, 1, 0, 0, 0, 2'b10}, //add
										  {11'b110_0101_1000, 0, 0, 0, 1, 0, 0, 0, 2'b10}, //sub
										  {11'b100_0101_0000, 0, 0, 0, 1, 0, 0, 0, 2'b10}, //and
										  {11'b101_0101_0000, 0, 0, 0, 1, 0, 0, 0, 2'b10} //orr
										};
	// Inicializo									
	initial begin
		test = 0; errors = 0;
	end
	
	// generate clock
	always begin
		clk = 0; #5; clk = 1; #5;
	end
	
	// Flanco negativo de clk, deben coincidir los valores
	always @(negedge clk) begin
		{Op, R2L_exp, AluSrc_exp, MtR_exp, RegW_exp, MemR_exp, MemW_exp, Br_exp} = tests[test];
		test = test + 1;
	end
	
	// check results on falling edge of clk
	always @(posedge clk) begin
		#1;
		if (Reg2Loc !== R2L_exp | ALUSrc !== AluSrc_exp | MemtoReg !== MtR_exp |
			RegWrite !== RegW_exp | MemRead !== MemR_exp | MemWrite !== MemW_exp | Branch !== Br_exp) begin
			$display("ERROR!!: test finished with unexpected result!");
			//$display("result = %h (expected %h) y zero = %h (expected %h) (in %dth instance",
				//										result, result_expected, zero, zero_expected, test);
			errors = errors + 1;
		end
		
		if (tests[test] === 19'bx) begin
			$display("%d/%d tests finished succesfully", test-errors, test);
			$stop;
		end
	end
	
endmodule
// Terminar. (no es dificil)