module tb_binary_to_bcd;

reg [7:0] binary;

wire [3:0] hundreds;
wire [3:0] tens;
wire [3:0] ones;

binary_to_bcd dut(
    .binary(binary),
    .hundreds(hundreds),
    .tens(tens),
    .ones(ones)
);

initial
begin

    binary = 0;     #10;
    binary = 5;     #10;
    binary = 15;    #10;
    binary = 99;    #10;
    binary = 100;   #10;
    binary = 128;   #10;
    binary = 200;   #10;
    binary = 255;   #10;

    $finish;

end

initial
begin
    $monitor(
        "Binary=%d  Hundreds=%d Tens=%d Ones=%d",
         binary,
         hundreds,
         tens,
         ones
    );
end

endmodule
