`timescale 1ns / 1ps


module start_tx(
input clk,
output  tx_start
    );
reg [32:0]count=0;
reg temp=0;
reg done = 0;
assign tx_start = temp;

always @(posedge clk)
begin
    if (done == 0) begin
        if (count == 10000000) begin
            temp <= 1;
            count <= 0;
            done <=1;
        end
        else begin
            count <= count +1;
            //temp <=0;
        end
    end
    else begin temp <=0; end
end
endmodule
