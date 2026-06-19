module control_unit(
    input clk,
    input rst,
    input run,
    input input_enter,
    input [3:0] opcode,
    output reg pc_inc,
    output reg pc_load,
    output reg mar_load,
    output reg ir_load,
    output reg ram_we,
    output reg a_load,
    output reg b_load,
    output reg out_load,
    output reg flag_load,
    output reg swap_en,
    output reg [3:0] alu_op,
    output reg [2:0] bus_sel,
    output reg input_wait_led,
    output reg halt_led,
    output reg [2:0] state_out
);
parameter NOP = 4'b0000;
parameter IN  = 4'b0001;
parameter STA = 4'b0010;
parameter LDA = 4'b0011;
parameter LDB = 4'b0100;
parameter ADD = 4'b0101;
parameter SUB = 4'b0110;
parameter OUT = 4'b0111;
parameter HLT = 4'b1000;
parameter INS = 4'b1001;
parameter JMP = 4'b1010;
parameter MUL = 4'b1011;
parameter INC = 4'b1100;
parameter DEC = 4'b1101;
parameter CLR = 4'b1110;
parameter SWP = 4'b1111;


parameter BUS_NONE    = 3'b000;
parameter BUS_PC      = 3'b001;
parameter BUS_RAM     = 3'b010;
parameter BUS_INPUT   = 3'b011;
parameter BUS_ALU     = 3'b100;
parameter BUS_OPERAND = 3'b101;
parameter BUS_A       = 3'b110;


parameter IDLE       = 3'd0;
parameter FETCH1     = 3'd1;
parameter FETCH2     = 3'd2;
parameter DECODE     = 3'd3;
parameter EXEC1      = 3'd4;
parameter EXEC2      = 3'd5;
parameter WAIT_INPUT = 3'd6;
parameter HALT       = 3'd7;

reg [2:0] state, next_state;

always @(posedge clk or posedge rst)
begin
    if(rst)
        state <= IDLE;
    else
        state <= next_state;
end

always @(*)
begin
    next_state = state;

    case(state)

        IDLE:
        begin
            if(run)
                next_state = FETCH1;
        end

        FETCH1:
            next_state = FETCH2;

        FETCH2:
            next_state = DECODE;

        DECODE:
        begin
            case(opcode)
                HLT: next_state = HALT;
                IN : next_state = WAIT_INPUT;
                INS: next_state = WAIT_INPUT;
                STA: next_state = EXEC1;
                LDA: next_state = EXEC1;
                LDB: next_state = EXEC1;
                JMP: next_state = EXEC1;
                default: next_state = EXEC2;
            endcase
        end

        EXEC1:
            next_state = EXEC2;

        EXEC2:
            next_state = FETCH1;

        WAIT_INPUT:
        begin
            if(input_enter)
                next_state = FETCH1;
            else
                next_state = WAIT_INPUT;
        end

        HALT:
            next_state = HALT;

        default:
            next_state = IDLE;

    endcase
end

always @(*)
begin
    pc_inc = 0;
    pc_load = 0;
    mar_load = 0;
    ir_load = 0;
    ram_we = 0;
    a_load = 0;
    b_load = 0;
    out_load = 0;
    flag_load = 0;
    swap_en = 0;

    alu_op = opcode;
    bus_sel = BUS_NONE;

    input_wait_led = 0;
    halt_led = 0;
    state_out = state;

    case(state)

        FETCH1:
        begin
            bus_sel = BUS_PC;
            mar_load = 1;
        end

        FETCH2:
        begin
            bus_sel = BUS_RAM;
            ir_load = 1;
            pc_inc = 1;
        end

        WAIT_INPUT:
        begin
            input_wait_led = 1;

            if(input_enter)
            begin
                bus_sel = BUS_INPUT;
                a_load = 1;
            end
        end

        EXEC1:
        begin
            case(opcode)

                STA, LDA, LDB:
                begin
                    bus_sel = BUS_OPERAND;
                    mar_load = 1;
                end

                JMP:
                begin
                    bus_sel = BUS_OPERAND;
                    pc_load = 1;
                end

            endcase
        end

        EXEC2:
        begin
            case(opcode)

                STA:
                begin
                    bus_sel = BUS_A;
                    ram_we = 1;
                end

                LDA:
                begin
                    bus_sel = BUS_RAM;
                    a_load = 1;
                end

                LDB:
                begin
                    bus_sel = BUS_RAM;
                    b_load = 1;
                end

                ADD, SUB, MUL, INC, DEC, CLR:
                begin
                    bus_sel = BUS_ALU;
                    a_load = 1;
                    flag_load = 1;
                end

                OUT:
                begin
                    bus_sel = BUS_A;
                    out_load = 1;
                end

                SWP:
                begin
                    swap_en = 1;
                end

            endcase
        end

        HALT:
        begin
            halt_led = 1;
        end

    endcase
end

endmodule
