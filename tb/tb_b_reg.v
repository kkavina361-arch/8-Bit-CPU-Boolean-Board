module tb_b_reg;
reg clk;
reg rst;
reg bi;
reg [7:0] bus;
wire [7:0] b_out;
b_reg dut(.clk(clk),.rst(rst),.bi(bi),.bus(bus),.b_out(b_out));
initial
begin
clk = 0;
forever #5 clk = ~clk;
end
initial
begin
 rst = 1;
 bi  = 0;
 bus = 0;
 #20;
 rst = 0;
 bus = 8'b00000011;
 bi  = 1;
 #10;
 bi = 0;
 #20;
 bus = 8'b00000111;
 bi  = 1;
 #10;
 bi = 0;
 #20;
$finish;
end
initial
begin
 $monitor("Time=%0t bus=%b bi=%b b_out=%b",$time,bus,bi,b_out);
end
endmodule
