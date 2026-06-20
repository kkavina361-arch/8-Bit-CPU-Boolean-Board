module cpu_top( 
    input CLK100MHZ,

    input [15:0] SW,

    input BTN0,     // Program Write
    input BTN1,     // Run
    input BTN2,     // Reset
    input BTN3,     // Input Enter

    output GREEN_LED,
    output RED_LED,
output [3:0] D0_AN,
output [7:0] D0_SEG,

output [3:0] D1_AN,
output [7:0] D1_SEG
);


wire [7:0] switch_data;
wire [3:0] switch_addr;

wire program_mode;
wire sensor_enable;
wire clock_select;
wire demo_select;

assign switch_data   = SW[7:0];
assign switch_addr   = SW[11:8];

assign program_mode  = SW[12];
assign sensor_enable = SW[13];
assign clock_select  = SW[14];
assign demo_select   = SW[15];

wire cpu_clk;

reg [7:0] bus;

wire [3:0] pc_out;

wire [3:0] mar_out;

wire [7:0] ram_data;

wire [3:0] ram_addr;
wire [7:0] ram_din;
wire ram_we;

wire [3:0] opcode;
wire [3:0] operand;

wire [7:0] ir_instruction;

wire [7:0] a_out;
wire [7:0] b_out;

wire [7:0] output_data;

wire [7:0] input_data;


wire [7:0] alu_result;

wire alu_z;
wire alu_c;
wire alu_br;
wire alu_n;

wire z_flag;
wire c_flag;


wire pc_inc;
wire pc_load;

wire mar_load;
wire ir_load;

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


wire [3:0] load_addr;
wire [7:0] load_data;

wire load_we;
wire load_done;
wire ram_write_final;


wire [3:0] bcd_hundreds;
wire [3:0] bcd_tens;
wire [3:0] bcd_ones;
wire [6:0] HEX0;
wire [6:0] HEX1;
wire [6:0] HEX2;
wire [6:0] HEX3;
wire [6:0] HEX4;
wire [6:0] HEX5;
wire [6:0] HEX6;
wire [6:0] HEX7;

clock_divider clk_div_inst(
    .clk_in(CLK100MHZ),
    .rst(BTN2),
    .clk_select(clock_select),
    .clk_cpu(cpu_clk)
);

input_interface input_if_inst(
    .switch_data(switch_data),
    .sensor_in(1'b0),
    .sensor_enable(sensor_enable),
    .input_data(input_data)
);

program_loader loader_inst(
    .clk(cpu_clk),
    .rst(BTN2),
    .start(program_mode),
    .demo_select(demo_select),
    .load_addr(load_addr),
    .load_data(load_data),
    .load_we(load_we),
    .done(load_done)
);

control_unit cu_inst(
    .clk(cpu_clk),
    .rst(BTN2),
    .run(BTN1),
    .input_enter(BTN3),
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

pc pc_inst(
    .clk(cpu_clk),
    .rst(BTN2),

    .ce(pc_inc),
    .cl(1'b0),

    .load(pc_load),
    .load_data(operand),

    .pc_out(pc_out)
);

mar mar_inst(
    .clk(cpu_clk),
    .rst(BTN2),

    .mi(mar_load),

    .bus(bus[3:0]),

    .mar_out(mar_out)
);
ram_16x8 ram_inst(
    .clk(cpu_clk),

    .we(ram_write_final),

    .addr(ram_addr),

    .data_in(ram_din),

    .data_out(ram_data)
);

ir ir_inst(
    .clk(cpu_clk),
    .rst(BTN2),

    .ii(ir_load),

    .bus(ram_data),

    .opcode(opcode),
    .operand(operand)
);

a_reg a_reg_inst(
    .clk(cpu_clk),
    .rst(BTN2),

    .ai(a_load),

    .bus(bus),

    .a_out(a_out)
);

b_reg b_reg_inst(
    .clk(cpu_clk),
    .rst(BTN2),

    .bi(b_load),

    .bus(bus),

    .b_out(b_out)
);

alu alu_inst(
    .a(a_out),
    .b(b_out),

    .opcode(alu_op),

    .result(alu_result),

    .z(alu_z),
    .c(alu_c),
    .br(alu_br),
    .n(alu_n)
);

flag_reg flag_inst(
    .clk(cpu_clk),
    .rst(BTN2),

    .fe(flag_load),

    .z_in(alu_z),
    .c_in(alu_c),

    .z_flag(z_flag),
    .c_flag(c_flag)
);

output_reg out_reg_inst(
    .clk(cpu_clk),
    .rst(BTN2),

    .oi(out_load),

    .bus(bus),

    .out(output_data)
);


assign ram_addr =
       (program_mode == 1'b0) ? switch_addr :
       (load_done ? mar_out : load_addr); 


assign ram_din =
       (program_mode == 1'b0) ? switch_data :
       load_data;
assign ram_write_final =
       (program_mode == 1'b0) ? BTN0 :
       (load_done ? ram_we : load_we);


always @(*)
begin
    case(bus_sel)

        3'b001: bus = {4'b0000, pc_out};

        3'b010: bus = ram_data;

        3'b011: bus = input_data;

        3'b100: bus = alu_result;

        3'b101: bus = {4'b0000, operand};

        3'b110: bus = a_out;

        default: bus = 8'h00;

    endcase
end


assign GREEN_LED = input_wait_led;

assign RED_LED = halt_led;
binary_to_bcd bcd_inst(
    .binary(output_data),
    .hundreds(bcd_hundreds),
    .tens(bcd_tens),
    .ones(bcd_ones)
);

seven_seg hex0_inst(
    .data(bcd_ones),
    .seg(HEX0)
);

seven_seg hex1_inst(
    .data(bcd_tens),
    .seg(HEX1)
);

seven_seg hex2_inst(
    .data(bcd_hundreds),
    .seg(HEX2)
);

assign HEX3 = 7'b1111111;

seven_seg hex4_inst(
    .data(pc_out),
    .seg(HEX4)
);

assign HEX5 = 7'b1111111;

seven_seg hex6_inst(
    .data(opcode),
    .seg(HEX6)
);

seven_seg hex7_inst(
    .data(operand),
    .seg(HEX7)
);
display_mux disp_inst(
    .clk(CLK100MHZ),

    .HEX0(HEX0),
    .HEX1(HEX1),
    .HEX2(HEX2),
    .HEX3(HEX3),
    .HEX4(HEX4),
    .HEX5(HEX5),
    .HEX6(HEX6),
    .HEX7(HEX7),

.D0_AN(D0_AN),
.D0_SEG(D0_SEG),

.D1_AN(D1_AN),
.D1_SEG(D1_SEG)
);
endmodule
