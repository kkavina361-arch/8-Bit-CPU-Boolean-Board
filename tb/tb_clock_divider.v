module tb_clock_divider;
reg clk_in;
reg rst;
reg clk_select;
wire clk_cpu;
clock_divider uut(.clk_in(clk_in),.rst(rst),.clk_select(clk_select),.clk_cpu(clk_cpu));
initial
begin
clk_in = 0;
forever #5 clk_in = ~clk_in;
end
initial
begin
 rst = 1;
 clk_select = 0;
 #20;
 rst = 0;
 #200;
clk_select = 1;
#100;
clk_select = 0;
 #100;
$finish;
end
endmodule
