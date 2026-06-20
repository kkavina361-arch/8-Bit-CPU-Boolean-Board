module tb_clock_divider;

reg clk_in;
reg rst;
reg clk_select;

wire clk_cpu;

clock_divider dut(
    .clk_in(clk_in),
    .rst(rst),
    .clk_select(clk_select),
    .clk_cpu(clk_cpu)
);

always #5 clk_in = ~clk_in;

initial
begin

    clk_in = 0;
    rst = 1;
    clk_select = 0;

    #20;
    rst = 0;

    // Test slow clock
    #300;

    // Test fast clock
    clk_select = 1;
    #300;

    // Back to slow clock
    clk_select = 0;
    #300;

    $finish;

end

initial
begin
    $monitor(
    "Time=%0t rst=%b clk_select=%b clk_cpu=%b",
     $time,
     rst,
     clk_select,
     clk_cpu
    );
end

endmodule
