module a_reg(
    input clk,
    input rst,
    input ai,
    input [7:0] bus,
    output reg [7:0] a_out
);
always @(posedge clk or posedge rst)
begin
    if(rst)
        a_out <= 8'd0;
   else if(ai)
        a_out <= bus;
end
endmodule
