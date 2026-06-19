module tb_flag_reg;
reg clk;
reg rst;
reg fe;
reg z_in;
reg c_in;
wire z_flag;
wire c_flag;
flag_reg dut(.clk(clk),.rst(rst),.fe(fe),.z_in(z_in),.c_in(c_in),.z_flag(z_flag),.c_flag(c_flag));
initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end
initial
begin
    rst  = 1;
    fe   = 0;
    z_in = 0;
    c_in = 0;
    #20;
    rst = 0;
    fe   = 1;
    z_in = 1;
    c_in = 0;
    #10;
    z_in = 0;
    c_in = 1;
    #10;
    z_in = 1;
    c_in = 1;
    #10;
    fe   = 0;
    z_in = 0;
    c_in = 0;
    #10;
    $finish;
end
endmodule
