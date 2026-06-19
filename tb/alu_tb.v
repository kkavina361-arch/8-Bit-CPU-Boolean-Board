module alu_tb;
 
reg [7:0] a;
reg [7:0] b;
reg alu_sel;
wire [7:0] result;
wire carry;
wire zero;
alu dut(.a(a),.b(b),.alu_sel(alu_sel),.result(result),.carry(carry),.zero(zero));

initial
begin
    a = 8'd5;
    b = 8'd3;
	 alu_sel = 1'b0;
    #20;
    a = 8'd5;
    b = 8'd3;
    alu_sel = 1'b1;
    #20;
	 a = 8'd5;
    b = 8'd5;
    alu_sel = 1'b1;
    #20;
    $finish;
end
initial
begin
  $monitor( "Time=%0t A=%d B=%d alu_sel=%b Result=%d Carry=%b Zero=%b",
     $time,a,b,alu_sel,result,carry,zero);
end
endmodule
