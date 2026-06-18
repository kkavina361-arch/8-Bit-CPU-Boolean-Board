module mar(
    input clk,
    input rst,
    input mi,
    input [3:0] bus,
    output reg [3:0] mar_out
);
always @(posedge clk or posedge rst)
begin
    if(rst)
        mar_out <= 4'd0;
    else if(mi)
        mar_out <= bus;
end
endmodule 
