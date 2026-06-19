module output_reg(
    input clk,
    input rst,
    input oi,              
    input [7:0] bus,
    output reg [7:0] out
);
always @(posedge clk or posedge rst)
begin
    if(rst)
        out <= 8'd0;
    else if(oi)
        out <= bus;
end
endmodule
