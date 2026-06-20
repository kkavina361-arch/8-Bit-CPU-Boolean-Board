module clock_divider(
    input clk_in,
    input rst,
    input clk_select,
    output clk_cpu
);

reg slow_clk;
reg fast_clk;

reg [26:0] count_1hz;
reg [23:0] count_10hz;

always @(posedge clk_in or posedge rst)
begin
    if(rst)
    begin
        count_1hz  <= 27'd0;
        count_10hz <= 24'd0;
        slow_clk   <= 1'b0;
        fast_clk   <= 1'b0;
    end
    else
    begin

        // 1 Hz Clock from 100 MHz
        if(count_1hz == 27'd49_999_999)
        begin
            count_1hz <= 27'd0;
            slow_clk <= ~slow_clk;
        end
        else
            count_1hz <= count_1hz + 1'b1;

        // 10 Hz Clock from 100 MHz
        if(count_10hz == 24'd4_999_999)
        begin
            count_10hz <= 24'd0;
            fast_clk <= ~fast_clk;
        end
        else
            count_10hz <= count_10hz + 1'b1;

    end
end

assign clk_cpu = (clk_select) ? fast_clk : slow_clk;

endmodule
