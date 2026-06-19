module control_unit_tb;
reg clk;
reg rst;
reg run;
reg input_enter;
reg [3:0] opcode;
wire pc_inc;
wire pc_load;
wire mar_load;
wire ir_load;
wire ram_we;
wire a_load;
wire b_load;
wire out_load;
wire flag_load;
wire swap_en;
wire [3:0] alu_op;
wire [2:0] bus_sel;
wire input_wait_led;
wire halt_led;
wire [2:0] state_out;
control_unit dut(
    .clk(clk),
    .rst(rst),
    .run(run),
    .input_enter(input_enter),
    .opcode(opcode),

    .pc_inc(pc_inc),
    .pc_load(pc_load),
    .mar_load(mar_load),
    .ir_load(ir_load),
    .ram_we(ram_we),
    .a_load(a_load),
    .b_load(b_load),
    .out_load(out_load),
    .flag_load(flag_load),
    .swap_en(swap_en),

    .alu_op(alu_op),
    .bus_sel(bus_sel),

    .input_wait_led(input_wait_led),
    .halt_led(halt_led),
    .state_out(state_out)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $monitor("T=%0t state=%d opcode=%b run=%b enter=%b pc_inc=%b mar=%b ir=%b a=%b b=%b out=%b ram_we=%b wait=%b halt=%b bus=%b",
              $time, state_out, opcode, run, input_enter,
              pc_inc, mar_load, ir_load, a_load, b_load,
              out_load, ram_we, input_wait_led, halt_led, bus_sel);

    rst = 1;
    run = 0;
    input_enter = 0;
    opcode = 4'b0000;

    #20;
    rst = 0;

    run = 1;
    opcode = 4'b0101;   
    #60;

    opcode = 4'b0001;   
    #50;

    input_enter = 1;
    #10;
    input_enter = 0;

    #40;

    opcode = 4'b0111;  
    #60;

    opcode = 4'b0010;   
    #70;

    opcode = 4'b1000;  
    #60;

    $finish;
end
endmodule
