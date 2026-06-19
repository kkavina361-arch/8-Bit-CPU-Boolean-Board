module ir_tb;
reg clk;
reg rst;
reg ii;
reg [7:0] bus;
wire [3:0] opcode;
wire [3:0] operand;
ir dut(.clk(clk),.rst(rst),.ii(ii),.bus(bus),.opcode(opcode),.operand(operand));
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end
initial begin
    rst = 1;
    ii  = 0;
    bus = 8'b00000000;
    #20;
    rst = 0;
    bus = 8'b00101100;
    ii  = 1;
    #10;
    ii  = 0;
    #20;
    bus = 8'b00111101;
    ii  = 1;
    #10;
    ii  = 0;
    #20;
    $finish;
end
initial begin
    $monitor("Time=%0t bus=%b opcode=%b operand=%b",
              $time,bus,opcode,operand);
end
endmodule
