module tb_mar;
reg clk;
reg rst;
reg mi;
reg [3:0] bus;
wire [3:0] mar_out;
mar dut(.clk(clk),.rst(rst),.mi(mi),.bus(bus),.mar_out(mar_out));
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
rst=1;
mi=0;
bus=0;
#20;
rst=0;
bus=4'd12;
mi=1;
#10;
mi=0;
#20;
bus=4'd5;
mi=1;
#10;
$finish;
end
endmodule 
