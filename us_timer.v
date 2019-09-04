
module us_timer(
input wire clk,
output wire [31:0]time_stamp //in us
    );

reg [31:0]count = 0;
reg [6:0]counter = 0;


assign time_stamp = count;


always@(posedge clk) begin
        if (counter == 'h64)//32 for 0.5us || 64 for 1us at 100MHz || D7 for 1 us at 215 || FA @ 215
            begin
            counter <= 0;
            count <= count+1;
            end
        else begin counter <= counter + 1'h1; end
	end

endmodule
