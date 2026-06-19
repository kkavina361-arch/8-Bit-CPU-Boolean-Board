module tb_pc;

reg clk;
reg rst;
reg ce;
reg cl;
reg load;
reg [3:0] load_data;

wire [3:0] pc_out;

pc dut(
    .clk(clk),
    .rst(rst),
    .ce(ce),
    .cl(cl),
    .load(load),
    .load_data(load_data),
    .pc_out(pc_out)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;
    ce = 0;
    cl = 0;
    load = 0;
    load_data = 0;

    #10 rst = 0;

    ce = 1;
    #40;

    ce = 0;
    load = 1;
    load_data = 4'd10;
    #10;

    load = 0;
    ce = 1;
    #20;

    cl = 1;
    #10;

    cl = 0;
    #20;

    $finish;
end

endmodule
