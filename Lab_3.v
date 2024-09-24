`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2024 01:40:19 PM
// Design Name: 
// Module Name: Lab_3
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//PART 1
//module Lab_3(A, B, Cin, S, Cout);
//    input A, B, Cin;
//    output S, Cout;
    
//    FullAdder FA1(A, B, Cin, S, Cout);
//endmodule

//PART 2
//module Lab_3(A, B, Cin, S, Cout, seg);
//    parameter width = 2;
//    input [width-1:0] A, B;
//    input Cin;
//    output [width-1:0] S;
//    output Cout;
//    output [6:0] seg;
    
//    wire [3:0] sum;
//    assign sum = {1'b0,Cout,S};
    
//    FullAdder_2Bit FA1(A, B, Cin, S, Cout);
//    BCD display1(seg, sum);
//endmodule

//PART 3
module Lab_3(A, B, Cin, S, Cout, seg);
    parameter width = 2;
    input [width-1:0] A, B;
    input Cin;
    output [width-1:0] S;
    output Cout;
    output [6:0] seg;
    
    wire [3:0] sum;
    assign sum = {1'b0,Cout,S};
    
    CLA_Adder CLA1(A, B, Cin, S, Cout);
    BCD display1(seg, sum);
endmodule

module CLA_Adder (A, B, Cin, S, Cout);
    input [1:0] A, B;
    input Cin;
    output [1:0] S;
    output Cout;
    integer i;
    wire c;
    
    wire [1:0] P, G;
    assign P[0] = A[0]^B[0];
    assign G[0] = A[0]&B[0];
    assign P[1] = A[1]^B[1];
    assign G[1] = A[1]&B[1];
    
    assign c=G[0]+P[0]*Cin;
    assign Cout=G[1]+P[1]*c;
    
    FullAdder FA1(A[0],B[0],Cin,S[0]);
    FullAdder FA2(A[1],B[1],c,S[1]);
    
endmodule

//PART 3
module FullAdder(a, b, cin, s);
    input a, b, cin;
    output s;
    
    assign s = a^b^cin;
    
endmodule

//PART 1
//module FullAdder(a, b, cin, s, cout);
//    input a, b, cin;
//    output s, cout;
    
//    assign s = a^b^cin;
//    assign cout = b&cin|a&cin|a&b;
    
//endmodule

//PART 2
module FullAdder_2Bit(a,b,cin,s,cout);
    input [1:0] a, b, cin;
    output [1:0] s, cout;
    wire c;
    
    FullAdder FA_Bit0(a[0],b[0],cin,s[0],c);
    FullAdder FA_Bit1(a[1],b[1],c,s[1],cout);
endmodule

//SEGMENT DISPLAY
module BCD(output reg [6:0]seg, input [3:0]x);
    always @(x)
        begin
            case (x)
                0: seg = 7'b1000000;
                1: seg = 7'b1111001;
                2: seg = 7'b0100100;
                3: seg = 7'b0110000;
                4: seg = 7'b0011001;
                5: seg = 7'b0010010;
                6: seg = 7'b0000010;
                7: seg = 7'b1111000;
                8: seg = 7'b0000000;
                9: seg = 7'b0010000;
                default: seg = 7'bxxxxxxxx;
            endcase;
        end
endmodule