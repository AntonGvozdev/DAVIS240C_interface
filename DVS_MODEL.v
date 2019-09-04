`timescale 1ns / 1ps
module DVS_MODEL(
input clk,
input ACK,
output REQ,
output [9:0]AER
    );
    
reg req = 1'b1;
reg [9:0]aer1 = 10'b0000000000;

assign REQ = req;
assign AER = aer1; 


always @(posedge clk)
begin
    if (ACK == 1'b1) begin
        req = 1'b0;
        #30;
        aer1 = 10'b1111111111;
    end
    else begin
       req <= 1'b1;
       aer1 = 10'b0000000000;
    end
        
end
endmodule
