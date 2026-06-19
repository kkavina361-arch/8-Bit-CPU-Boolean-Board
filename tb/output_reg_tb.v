module output_reg_tb;
reg clk;
reg rst;
reg oi;
reg [7:0] bus;
wire [7:0] out;
output_reg dut(
    .clk(clk),
    .rst(rst),
    .oi(oi),
    .bus(bus),
    .out(out)
);
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end
initial begin
    rst = 1;
    oi  = 0;
    bus = 8'd0;
    #20;
    rst = 0;
    bus = 8'd8;
    oi = 1;
    #10;
    oi = 0;
    #20;
    bus = 8'd15;
    oi = 1;
    #10;
    oi = 0;
    #20;
    bus = 8'd25;
    oi = 0;
    #20;
   $finish;
end
endmodule
