`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Engineer: Diego Brenes Martínez & Francisco Chacón Cambronero
//////////////////////////////////////////////////////////////////////////////////
module FSM2(
	 input esnumero,
	 input [3:0] tvalida,
	 input Reset,
	 input CLK,
    output reg enable_FSM1,
	 output reg  [3:0] decenas,
	 output reg  [3:0] unidades,
    output reg  [3:0] motor,
	 output reg  [3:0] presencia
);
//Variables
localparam estado_inicial = 4'd0,
				  estado1 = 4'd1,
				  estado2 = 4'd2,
				  estado3 = 4'd3,
			     estado4 = 4'd4,
				  estado5 = 4'd5,
				  estado6 = 4'd6,
				  estado7 = 4'd7,
				  estado8 = 4'd8,
				  estado9 = 4'd9,
				  estado10 = 4'd10,
				  estado11 = 4'd11;
				  
	reg [3:0] estado_actual;
	reg [3:0] estado_siguiente;
	
//Registros de saldia
				
	always@(posedge CLK) begin 
		if (Reset) 
			estado_actual <= estado_inicial;
		else
			estado_actual <= estado_siguiente;
	end

	always@(posedge CLK) begin 
	
	case(estado_actual) 
			estado_inicial: begin enable_FSM1<=1'b1;end
			estado2: begin decenas<= tvalida;end
			estado4: begin unidades<= tvalida;end
			estado6: begin motor<= tvalida;end
			estado8: begin presencia<= tvalida;end	
			estado11: begin enable_FSM1<=1'b0;end
			
	endcase
end

always@( * ) begin
			estado_siguiente = estado_actual;
		
				case (estado_actual)
			
			estado_inicial : begin estado_siguiente = estado1; end 
			
			estado1 : begin
				if (tvalida == 4'b1010)
					estado_siguiente = estado2;
		      end
			
			estado2: begin
				if (esnumero)							
					estado_siguiente = estado3;
			   end
			
			estado3: begin
			
				if (tvalida == 4'b1100)
					estado_siguiente = estado4;
			  end
		
			estado4: begin
				if (esnumero)
					estado_siguiente = estado5;
			  end
			
			estado5: begin
		
				if (tvalida == 4'b1100)
					estado_siguiente = estado6;
			   end
			
			estado6: begin
				if (tvalida == 4'b0001| tvalida == 4'b0000 )
					estado_siguiente = estado7;
			   end
			
			estado7: begin
			
				if (tvalida == 4'b1100)
					estado_siguiente = estado8;
			  end
			
			estado8: begin
				if (tvalida == 4'b0001| tvalida == 4'b0000)
					estado_siguiente = estado9;
			  end
		
			estado9: begin
					if (tvalida == 4'b1100)
					estado_siguiente = estado10;
			  end		
			
			estado10: begin
				if (tvalida == 4'b1011)
					estado_siguiente = estado11;
					
			   end			
		
			estado11: begin
				if (tvalida == 4'b1100)
					estado_siguiente = estado_inicial;
			  end
			
		endcase
	end
	
// //Salidas
//		always@( * ) begin
//			//decenas=4'b0000;
//			unidades=4'b0000;
//			motor=4'b0000;
//			presencia=4'b0000;
//			enable_FSM1=1'b1;
//			
//		case (estado_actual)
//			//estado3 : begin decenas=tvalida; end
//			estado5 : begin unidades=tvalida; end
//			estado7 : begin motor=tvalida; end
//			estado9 : begin presencia=tvalida; end
//			estado11 : begin enable_FSM1=1'b0; end //habilita maquina uno con uno
//		
//		endcase
//
//	end

endmodule






