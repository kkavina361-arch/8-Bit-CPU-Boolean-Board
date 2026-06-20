module display_mux(

    input clk,

    input [6:0] HEX0,
    input [6:0] HEX1,
    input [6:0] HEX2,
    input [6:0] HEX3,

    input [6:0] HEX4,
    input [6:0] HEX5,
    input [6:0] HEX6,
    input [6:0] HEX7,

    output reg [3:0] D0_AN,
    output reg [7:0] D0_SEG,

    output reg [3:0] D1_AN,
    output reg [7:0] D1_SEG
);

reg [15:0] refresh_counter=0;
reg [1:0] digit;

always @(posedge clk)
begin
    refresh_counter <= refresh_counter + 1;
end

always @(*)
begin

    digit = refresh_counter[15:14];

    case(digit)

        2'd0:
        begin
            D0_AN  = 4'b1110;
            D0_SEG = {1'b1,HEX0};

            D1_AN  = 4'b1110;
            D1_SEG = {1'b1,HEX4};
        end

        2'd1:
        begin
            D0_AN  = 4'b1101;
            D0_SEG = {1'b1,HEX1};

            D1_AN  = 4'b1101;
            D1_SEG = {1'b1,HEX5};
        end

        2'd2:
        begin
            D0_AN  = 4'b1011;
            D0_SEG = {1'b1,HEX2};

            D1_AN  = 4'b1011;
            D1_SEG = {1'b1,HEX6};
        end

        default:
        begin
            D0_AN  = 4'b0111;
            D0_SEG = {1'b1,HEX3};

            D1_AN  = 4'b0111;
            D1_SEG = {1'b1,HEX7};
        end

    endcase

end

endmodule
