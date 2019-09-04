`timescale 1ns / 1ps

module tx_count(
input wire new_tx,
output wire [31:0]tx_counter
);
    
reg [31:0]counter = 0;   

assign tx_counter = counter;

always @(posedge new_tx)
    begin
        counter <= counter+1;
    end
endmodule
