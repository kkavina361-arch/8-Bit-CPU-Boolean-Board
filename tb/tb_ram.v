module tb_ram;
reg clk;
reg we;
reg [3:0] addr;
reg [7:0] data_in;
wire [7:0] data_out;
ram_16x8 dut(.clk(clk),.we(we),.addr(addr),.data_in(data_in),.data_out(data_out));
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
we=1;
addr=4'd12;
data_in=8'd5;
#10;
addr=4'd13;
data_in=8'd3;
#10;
we=0;
addr=4'd12;
#10;
addr=4'd13;
#10;
$finish;
end
endmodule 
