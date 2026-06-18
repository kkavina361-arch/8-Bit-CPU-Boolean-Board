module ram_16x8(
    input clk,
    input we,
    input [3:0] addr,
    input [7:0] data_in,
    output reg [7:0] data_out
);
reg [7:0] mem [0:15];
integer i;
initial begin
    for(i = 0; i < 16; i = i + 1)
        mem[i] = 8'd0;
end
always @(posedge clk)
begin
    if(we)
        mem[addr] <= data_in;
end
always @(*)
begin
    data_out = mem[addr];
end
endmodule 
