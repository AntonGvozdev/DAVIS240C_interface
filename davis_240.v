
module davis_240(
input wire clk,
input wire[8:0]AER_bus,
input wire REQ,
input wire SEL,
input wire [31:0] time_stamp,
output wire ACK,
output reg [31:0]data_out,
output reg [31:0]data_out_time     
    );
    
wire [7:0]AER_Y;
wire [8:0]AER_X;
//wire [7:0]AER_X;
reg ack = 1'b1;
reg [8:0]X_addr_p = 9'b000000000;
reg [7:0]Y_addr = 0;
reg [31:0]counter = 0;
reg [31:0]counter1 = 0;

reg [31:0]time_r = 0;
reg x_done = 0;
reg y_done = 0;

assign ACK = ack;
assign AER_Y[0] = AER_bus[0];
assign AER_Y[1] = AER_bus[1];
assign AER_Y[2] = AER_bus[2];
assign AER_Y[3] = AER_bus[3];
assign AER_Y[4] = AER_bus[4];
assign AER_Y[5] = AER_bus[5];
assign AER_Y[6] = AER_bus[6];
assign AER_Y[7] = AER_bus[7];

assign AER_X[0] = AER_bus[0];
assign AER_X[1] = AER_bus[1];
assign AER_X[2] = AER_bus[2];
assign AER_X[3] = AER_bus[3];
assign AER_X[4] = AER_bus[4];
assign AER_X[5] = AER_bus[5];
assign AER_X[6] = AER_bus[6];
assign AER_X[7] = AER_bus[7];
assign AER_X[8] = AER_bus[8];

/*
assign AER_X[0] = AER_bus[1];
assign AER_X[1] = AER_bus[2];
assign AER_X[2] = AER_bus[3];
assign AER_X[3] = AER_bus[4];
assign AER_X[4] = AER_bus[5];
assign AER_X[5] = AER_bus[6];
assign AER_X[6] = AER_bus[7];
assign AER_X[7] = AER_bus[8];
*/

//Sync SEL
reg temp_sel = 0;  always @(posedge clk) begin temp_sel <= SEL; end
reg SEL_synq = 0;  always @(posedge clk) begin SEL_synq <= temp_sel; end
//Sync REQ
reg temp = 0;  always @(posedge clk) begin temp <= REQ; end
reg REQ_synq = 0;  always @(posedge clk) begin REQ_synq <= temp; end
//Synq DATA 
reg [8:0]temp_data = 9'b000000000;  always @(posedge clk) begin temp_data <= AER_bus; end
reg [8:0]AER_bus_synq = 9'b000000000;  always @(posedge clk) begin AER_bus_synq <= temp_data; end

reg x_flag = 0;
reg y_flag = 0;
reg all_done = 0;

reg INIT = 0;
reg init_flag = 0;
reg [31:0]init_counter = 0;

//INIT
always @(posedge clk)
begin
    if ((REQ_synq == 0)&&(SEL_synq == 0)) begin
        INIT <= 1;
    end else begin
    end
end


always @(posedge clk)
begin
    // GET Y
    if ((REQ_synq == 0)&&(SEL_synq == 0)) begin
        if (counter == 10'h10) begin //delay 50 ns
            counter <= 0;
            ack <= 0;
            y_done <= 1;
            Y_addr <= AER_Y;
        end else begin
            counter <= counter +1;
        end
    // GET X
    end else if ((REQ_synq == 0)&&(SEL_synq == 1)) begin
        if (counter1 == 10'h10) begin //delay 50 ns
            counter1 <=0;
            ack <= 0;
            X_addr_p <= AER_X;
            time_r <= time_stamp;
            x_done <= 1;
         end else begin
            counter1 <= counter1 + 1;
         end
    end else if (REQ_synq == 1) begin
        y_done <= 0;
        x_done <= 0;
        ack <=1;
    end else begin end
end

always @(posedge x_done)
begin
    /*data_out[7:0] <= Y_addr;
    data_out[31:8] <= 0;
    data_out_time[7:0] <= X_addr_p;
    data_out_time[31:8] <= 0;*/
    data_out[7:0] <= Y_addr;
    data_out[16:8] <= X_addr_p;
    data_out[31:17] <= 0;
    data_out_time[31:0] <= time_r;

end

endmodule
