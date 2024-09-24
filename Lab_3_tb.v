`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2024 01:50:47 PM
// Design Name: 
// Module Name: Lab_3_tb
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

//PART 2
module Lab_3_tb(  );
    reg [1:0] A, B;
    reg Cin;
    wire [1:0] S;
    wire Cout;
    integer a,b,c;
    
    Lab_3 uut(A, B, Cin,S,Cout);
    
    initial begin
        for (a = 0; a<4; a = a+1) begin
            for (b = 0; b<4; b = b+1) begin
                for (c = 0; c<2; c = c+1) begin
                    #10; A=a; B=b; Cin=c;
                    end
                end
            end
    end
endmodule




//PART 1
//module Lab_3_tb(  );
//    reg [2:0] input_tb;
//    wire S, Cout;
//    integer i;
    
//    Lab_3 uut(input_tb[2],input_tb[1],input_tb[0],S,Cout);
    
//    initial begin
//        for (i = 0; i<8; i = i+1) begin
//            #10; input_tb=i;
//            end
//    end
//endmodule


