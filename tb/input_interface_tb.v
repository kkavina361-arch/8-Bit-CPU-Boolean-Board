module input_interface_tb;
reg [7:0] switch_data;
reg sensor_in;
reg sensor_enable;
wire [7:0] input_data;

input_interface dut(.switch_data(switch_data),.sensor_in(sensor_in),.sensor_enable(sensor_enable),.input_data(input_data)
);
initial begin
    $monitor("T=%0t sensor_enable=%b switch=%b sensor=%b input_data=%b",
              $time, sensor_enable, switch_data, sensor_in, input_data);
	sensor_enable = 0;
    switch_data = 8'd5;
    sensor_in = 0;
    #10;
    switch_data = 8'd12;
    #10;
	 sensor_enable = 1;
    sensor_in = 0;
    switch_data = 8'd25;
    #10;
	 sensor_in = 1;
    #10;
    sensor_enable = 0;
    switch_data = 8'd9;
    sensor_in = 1;
    #10;
   $finish;
end
endmodule
