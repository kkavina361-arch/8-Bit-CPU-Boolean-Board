module program_loader_tb;
reg clk;
reg rst;
reg start;
reg demo_select;
wire [3:0] load_addr;
wire [7:0] load_data;
wire load_we;
wire done;
program_loader dut(.clk(clk),.rst(rst),.start(start),.demo_select(demo_select),.load_addr(load_addr),.load_data(load_data),.load_we(load_we),.done(done));
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end
initial begin
    $monitor("T=%0t demo=%b addr=%d data=%h we=%b done=%b",
              $time, demo_select, load_addr, load_data, load_we, done);
    rst = 1;
    start = 0;
    demo_select = 0;
    #20;
    rst = 0;
    start = 1;
    #200;
    rst = 1;
    start = 0;
    demo_select = 1;
    #20;
    rst = 0;
    start = 1;
    #200;
    $finish;
end
endmodule
