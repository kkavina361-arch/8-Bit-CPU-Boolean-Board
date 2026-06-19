module ir_tb;

reg clk;
reg rst;
reg ii;
reg [7:0] bus;

wire [7:0] ir_data;
wire [3:0] opcode;
wire [3:0] operand;

ir dut(
    .clk(clk),
    .rst(rst),
    .ii(ii),
    .bus(bus),

    .ir_data(ir_data),
    .opcode(opcode),
    .operand(operand)
);

always #5 clk = ~clk;

initial
begin

    clk = 0;
    rst = 1;
    ii = 0;
    bus = 8'h00;

    #10 rst = 0;

    bus = 8'h3C;
    ii = 1;
    #10;

    ii = 0;
    #10;

    bus = 8'hB0;
    ii = 1;
    #10;

    ii = 0;
    #10;

    bus = 8'h80;
    ii = 1;
    #10;

    ii = 0;
    #20;

    $finish;
end

endmodule
