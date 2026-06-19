module a_reg_tb;
reg clk;
reg rst;
reg ai;
reg [7:0] bus;
wire [7:0] a_out;
a_reg dut(.clk(clk),.rst(rst),.ai(ai),.bus(bus),.a_out(a_out) );
initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end
initial
begin
    rst = 1;
    ai  = 0;
    bus = 0;
	 #20 rst = 0;
    bus = 8'd5;
    ai  = 1;
    #10;
    ai = 0;
    #20;
	 bus = 8'd12;
    ai  = 1;
    #10;
    ai = 0;
    #20;
   $finish;
end
endmodule
