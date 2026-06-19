module input_interface(
    input  [7:0] switch_data,
    input        sensor_in,
    input        sensor_enable,
    output reg [7:0] input_data
);
always @(*)
begin
    if(sensor_enable)
        input_data = {7'd0, sensor_in};   
    else
        input_data = switch_data;        
end
endmodule
