// Hecho por Delfi

module flopr_tb();
        logic clk, reset; //entradas del modulo
        logic [63:0] d, q, q_expected; // HACERLO GENERICO
        
        logic [31:0] vectornum, errors;
        // Vector con valores de entrada d
        logic [63:0] testvectors_in [0:9] = '{ 64'h1, 64'h10, 64'h12, 64'h123, 64'h128, 64'h12, 64'h142, 64'h1772, 64'h123, 64'habc12};
        // Vector con valores de salida q
        logic [63:0] testvectors_out [0:9] = '{ 64'h0, 64'h0, 64'h0, 64'h0, 64'h0, 64'h12, 64'h142, 64'h1772, 64'h123, 64'habc12};
        
        // Instancia del modulo flopr
        flopr dut(clk, reset, d, q);
        
        // Generacion del clk de 100MHz = 10ns (durante 5ns el clk tiene q estar en 1 y los otros 5ns en 0)
        always
            begin
                clk = 1; 
                #5ns;
                clk = 0;
                #5ns;
            end
           
         // Verifique que durante los primeros 5 ciclos de clock la salida sea cero y en los 5 siguientes,
        //que después del flanco ascendente de clock se obtenga a la salida el valor ingresado.   
        // Esto se ejecuta solo una vez
         initial
            begin
                vectornum = 0; errors = 0;
                reset = 1; #50ns; reset = 0; 
				end
            
        // Se asignan los valores en el flanco descendente de clk
        always @(negedge clk)
            begin
                #1;  //espero 1ns para dar tiempo al flanco
                d = testvectors_in[vectornum];
                q_expected = testvectors_out[vectornum];
            end
		  
        // Verificacion de que la salida tiene el valor correcto en el flanco positivo de clk
        always @(posedge clk)
            begin 
            //if(reset) begin //no importa si esta reseteado o no, los valores deben darme bien igual
               #1; if(q !== q_expected) begin // le pongo 1 para un retardo
                    $display("Error: inputs = %h", d);
                    $display("       outputs = %h (%h expected)", q, q_expected);
                    errors = errors+1; // si hay error, los acumula
                end
                
            vectornum = vectornum + 1;
                if(testvectors_in[vectornum] === 64'bx) begin // si la entrada en todo x, significa que terminó bien el trabajo
                    $display("%d tests completed with %d errors", vectornum, errors);
                    //finish
                $stop;
                end
            end
endmodule  
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        

            
        