module pc(
    input clk,
    input rst,
    input ce,           // count enable
    input cl,           // clear
    output reg [3:0] pc_out
);

always @(posedge clk or posedge rst)
begin
    if(rst)
        pc_out <= 4'd0;
    else if(cl)
        pc_out <= 4'd0;
    else if(ce)
        pc_out <= pc_out + 1'b1;
end
endmodule
