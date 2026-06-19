module clock_divider(
    input clk_in,
    input rst,
    input clk_select,   
    output clk_cpu
);
reg [3:0] count;
reg slow_clk;
reg fast_clk;
always @(posedge clk_in or posedge rst)
begin
if(rst)
begin
count<= 4'd0;
slow_clk <= 1'b0;
fast_clk <= 1'b0;
 end
 else
 begin
fast_clk <= ~fast_clk;
 if(count == 4'd9)
 begin
 count    <= 4'd0;
 slow_clk <= ~slow_clk;
 end
else
count <= count + 1'b1;
end
end
assign clk_cpu = (clk_select) ? fast_clk : slow_clk;
endmodule
