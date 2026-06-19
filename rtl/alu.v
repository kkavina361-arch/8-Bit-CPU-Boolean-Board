module alu(
    input [7:0] a,
    input [7:0] b,
    input alu_sel,
    output reg [7:0] result,
    output reg carry,
    output reg zero  );
always @(*)
begin
     case(alu_sel)
       1'b0:
            {carry,result} = a + b;
       1'b1:
            {carry,result} = a - b;
				endcase
   if(result == 8'd0)
        zero = 1'b1;
    else
        zero = 1'b0;
    end
endmodule
