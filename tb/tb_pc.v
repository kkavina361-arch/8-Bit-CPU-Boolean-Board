module tb_pc;
reg clk;
reg rst;
reg ce;
reg cl;
wire [3:0] pc_out;
pc dut(.clk(clk),.rst(rst),.ce(ce),.cl(cl),.pc_out(pc_out));
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end
initial begin
    rst = 1;
    ce  = 0;
    cl  = 0;
    #20;
    rst = 0;
    ce = 1;
    #100;
    cl = 1;
    #10;
    cl = 0;
    #50;
   $finish;
end
endmodule
