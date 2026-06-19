module flag_reg(
    input clk,
    input rst,
    input fe,          
    input z_in,        
    input c_in,        
    output reg z_flag,
    output reg c_flag);
always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        z_flag <= 1'b0;
        c_flag <= 1'b0;
    end

    else if(fe)
    begin
        z_flag <= z_in;
        c_flag <= c_in;
    end
end
endmodule
