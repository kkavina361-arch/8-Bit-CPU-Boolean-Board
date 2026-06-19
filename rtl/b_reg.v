module b_reg(
input clk,
input rst,
input bi,
input [7:0] bus,
output reg [7:0] b_out
);
always @(posedge clk or posedge rst)
begin
if(rst)
     b_out <= 8'd0;
else if(bi)
    b_out <= bus;
end
endmodule
