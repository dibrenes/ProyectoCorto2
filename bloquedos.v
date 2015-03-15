`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:10:21 03/14/2015 
// Design Name: 
// Module Name:    bloquedos 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module bloquedos(
    input [3:0] tvalida,
    input esnumero,
    input CLK,
    input Reset,
    output [7:0] temperatura,
    output motor,
    output presencia,
    output enable_FSM1
    );

wire c1,c7,c8;
wire [3:0] c2, c3,c4,c5;
wire [7:0] c6;


FSM2 FSM2_1 (
    .esnumero(esnumero), 
    .tvalida(tvalida), 
    .Reset(Reset), 
    .CLK(CLK), 
    .enable_FSM1(c1), 
    .decenas(c2), 
    .unidades(c3), 
    .motor(c4), 
    .presencia(c5)
    );

assign enable_FSM1 = c1;


unfica unifica_1 (
    .CLK(CLK), 
    .Reset(Reset), 
    .decenas(c2), 
    .unidades(c3), 
    .motor(c4), 
    .presencia(c5), 
    .temperatura(c6), 
    .motor_s(c7), 
    .presencia_s(c8)
    );

assign temperatura = c6;
assign motor = c7;
assign presencia = c8;


endmodule
