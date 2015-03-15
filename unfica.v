`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC 
// Engineer: Diego Brenes Martínez & Francisco Chacón Cambronero
//////////////////////////////////////////////////////////////////////////////////
module unfica(
    input CLK,
	 input Reset,
	 input [3:0] decenas,
    input [3:0] unidades,
    input [3:0] motor,
    input [3:0] presencia,
    output [7:0] temperatura,
    output reg motor_s,
    output reg presencia_s
    );


   reg [7:0] dec;
	reg [7:0] uni;
     
	  always @(posedge CLK)
      if (Reset)
         dec <= 8'b00000000;
      else
         case (decenas)
            4'b0000   : dec <= 8'b00000000;//0
            4'b0001   : dec <= 8'b00001010;//10
				4'b0010   : dec <= 8'b00010100;//20
            4'b0011   : dec <= 8'b00011110;//30
				4'b0100   : dec <= 8'b00101000;//40
				4'b0101   : dec <= 8'b00110010;//50
				4'b0110   : dec <= 8'b00111100;//60
				4'b0111   : dec <= 8'b01000110;//70
				4'b1000   : dec <= 8'b01010000;//80
				4'b1001   : dec <= 8'b01011010;//90
            default : dec <= 8'b00000000;
 			endcase
				
	  always @(posedge CLK)
      if (Reset)
        uni <= 8'b00000000;
      else
         case (unidades)
            4'b0000   : uni <= 8'b00000000;//0
            4'b0001   : uni <= 8'b00000001;//1
				4'b0010   : uni <= 8'b00000010;//2
            4'b0011   : uni <= 8'b00000011;//3
				4'b0100   : uni <= 8'b00000100;//4
				4'b0101   : uni <= 8'b00000101;//5
				4'b0110   : uni <= 8'b00000110;//6
				4'b0111   : uni <= 8'b00000111;//7
				4'b1000   : uni <= 8'b00001000;//8
				4'b1001   : uni <= 8'b00001001;//9
            default : uni <= 8'b00000000;
 			endcase
		
		always @(posedge CLK)
      if (Reset)
         motor_s <= 1'b0;
      else
         case (motor)
            4'b0000   : motor_s <= 1'b0;
            4'b0001   : motor_s <= 1'b1;
            default : motor_s <= 1'b0;
         endcase
		
		always @(posedge CLK)
      if (Reset)
         presencia_s <= 1'b0;
      else
         case (presencia)
            4'b0000   : presencia_s <= 1'b0;
            4'b0001   : presencia_s <= 1'b1;
            default : presencia_s <= 1'b0;
         endcase

assign temperatura = dec+uni;  


endmodule
