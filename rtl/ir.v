module ir(
    input clk,
    input rst,
    input ii,

    input [7:0] bus,

    output reg [7:0] ir_data,
    output reg [3:0] opcode,
    output reg [3:0] operand
);

always @(posedge clk or posedge rst)
begin

    if(rst)
    begin
        ir_data <= 8'd0;
        opcode  <= 4'd0;
        operand <= 4'd0;
    end

    else if(ii)
    begin
        ir_data <= bus;
        opcode  <= bus[7:4];
        operand <= bus[3:0];
    end

end

endmodule
