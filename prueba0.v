`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:10:05 03/08/2015
// Design Name:   ps2_rx
// Module Name:   C:/Users/Francisco/Desktop/Proyectos Xilinx/ps2_rx/prueba0.v
// Project Name:  ps2_rx
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ps2_rx
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module prueba0;

	// Inputs
	reg clk;
	reg reset;
	reg ps2d;
	reg ps2c;
	reg rx_en;

	// Outputs
	wire rx_done_tick;
	wire [7:0] dout;

	// Instantiate the Unit Under Test (UUT)
	ps2_rx uut (
		.clk(clk), 
		.reset(reset), 
		.ps2d(ps2d), 
		.ps2c(ps2c), 
		.rx_en(rx_en), 
		.rx_done_tick(rx_done_tick), 
		.dout(dout)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		ps2d = 0;
		ps2c = 0;
		rx_en = 0;

		// Wait 100 ns for global reset to finish
		#20;
        
		// Add stimulus here

	end
	
//----------------------------------------------------------------------------------------
	  
//	reg [4:0] DivisorCLK;
//   
//   always @(posedge clk)
//      if (reset)
//         DivisorCLK <= 5'b0;
//      else if (rx_en)
//			DivisorCLK <= DivisorCLK + 5'b1;
	
	initial begin
		// assign ps2c = DivisorCLK[4];
		@(negedge clk)
		
		reset = 1;
		ps2d = 1;
		ps2c = 1;
		rx_en = 1;
		#20
		@(negedge clk)
		reset = 0;
		ps2d = 1;
		ps2c = 1;
		#60
		@(negedge clk)
		ps2d = 0;
		ps2c = 1;
		#200
		@(negedge clk) // Bit de inicio
		ps2d = 0; 
		ps2c = 0;
		#200
		@(negedge clk) // 0 LSB
		//-------
		ps2d = 0;
		//-------
		ps2c = 1;
		#200
		@(negedge clk)
		ps2c = 0;
		#200
		@(negedge clk) // 0
		//-------
		ps2d = 0;
		//-------
		ps2c = 1;
		#200
		@(negedge clk)
		ps2c = 0;
		#200
		@(negedge clk) // 1
		//-------
		ps2d = 1;
		//-------
		ps2c = 1;
		#200
		@(negedge clk)
		ps2c = 0;
		#200
		@(negedge clk) // 1
		//-------
		ps2d = 1;
		//-------
		ps2c = 1;
		#200
		@(negedge clk)
		ps2c = 0;
		#200
		@(negedge clk) // 1
		//-------
		ps2d = 1;
		//-------
		ps2c = 1;
		#200
		@(negedge clk)
		ps2c = 0;
		#200
		@(negedge clk) // 0
		//-------
		ps2d = 0;
		//-------
		ps2c = 1;
		#200
		@(negedge clk)
		ps2c = 0;
		#200
		@(negedge clk) // 0
		//-------
		ps2d = 0;
		//-------
		ps2c = 1;
		#200
		@(negedge clk)
		ps2c = 0;
		#200
		@(negedge clk) // 0 MSB
		//-------
		ps2d = 0;
		//-------
		ps2c = 1;
		#200
		@(negedge clk)
		ps2c = 0;
		#200
		@(negedge clk) // Bit de paridad
		//-------
		ps2d = 1;
		//-------
		ps2c = 1;
		#200
		@(negedge clk)
		ps2c = 0;
		#200
		@(negedge clk) // Bit de parada
		//-------
		ps2d = 1;
		//-------
		ps2c = 1;
		#200
		@(negedge clk)
		ps2c = 0;
		#200
		ps2c = 1; // Flanco positivo para dejar el reloj del teclado en 1
	end
	initial forever #10 clk = ~clk;
//----------------------------------------------------------------------------------------	
      
endmodule

