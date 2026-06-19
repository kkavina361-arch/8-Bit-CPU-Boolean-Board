module pc(
    input clk,
    input rst,
    input ce,
    input cl,

    input load,
    input [3:0] load_data,

    output reg [3:0] pc_out
);

always @(posedge clk or posedge rst)
begin
    if(rst)
        pc_out <= 4'd0;

    else if(cl)
        pc_out <= 4'd0;

    else if(load)
        pc_out <= load_data;

    else if(ce)
        pc_out <= pc_out + 1'b1;
end

endmodule
