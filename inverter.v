`timescale 1ns / 1ps


module inverter(
input wire clk,
input wire [8:0]AER_bus,
output [8:0]AER
    );
assign AER[0] = AER_bus[0];
assign AER[1] = AER_bus[1];
assign AER[2] = AER_bus[2];
assign AER[3] = AER_bus[3];
assign AER[4] = AER_bus[4];
assign AER[5] = AER_bus[5];
assign AER[6] = ~AER_bus[6];
assign AER[7] = ~AER_bus[7];
assign AER[8] = AER_bus[8];

always @(posedge clk)
begin

end
endmodule
