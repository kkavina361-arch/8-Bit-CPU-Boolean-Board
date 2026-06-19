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

// Opcodes
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

// Bus Select
parameter BUS_NONE    = 3'b000;
parameter BUS_PC      = 3'b001;
parameter BUS_RAM     = 3'b010;
parameter BUS_INPUT   = 3'b011;
parameter BUS_ALU     = 3'b100;
parameter BUS_OPERAND = 3'b101;
parameter BUS_A       = 3'b110;

// States
parameter IDLE       = 3'd0;
parameter FETCH1     = 3'd1;
parameter FETCH2     = 3'd2;
parameter DECODE     = 3'd3;
parameter EXEC1      = 3'd4;
parameter EXEC2      = 3'd5;
parameter WAIT_INPUT = 3'd6;
parameter HALT       = 3'd7;

reg [2:0] state;
reg [2:0] next_state;

// State Register
always @(posedge clk or posedge rst)
begin
    if(rst)
        state <= IDLE;
    else
        state <= next_state;
end

// Next State Logic
always @(*)
begin
    next_state = state;

    case(state)

        IDLE:
        begin
            if(run)
                next_state = FETCH1;
            else
                next_state = IDLE;
        end

        FETCH1:
        begin
            next_state = FETCH2;
        end

        FETCH2:
        begin
            next_state = DECODE;
        end

        DECODE:
        begin
            case(opcode)

                HLT:
                    next_state = HALT;

                IN:
                    next_state = WAIT_INPUT;

                INS:
                    next_state = WAIT_INPUT;

                STA:
                    next_state = EXEC1;

                LDA:
                    next_state = EXEC1;

                LDB:
                    next_state = EXEC1;

                JMP:
                    next_state = EXEC1;

                default:
                    next_state = EXEC2;

            endcase
        end

        EXEC1:
        begin
            next_state = EXEC2;
        end

        EXEC2:
        begin
            next_state = FETCH1;
        end

        WAIT_INPUT:
        begin
            if(input_enter)
                next_state = FETCH1;
            else
                next_state = WAIT_INPUT;
        end

        HALT:
        begin
            next_state = HALT;
        end

        default:
        begin
            next_state = IDLE;
        end

    endcase
end

// Output Control Logic
always @(*)
begin
    pc_inc = 1'b0;
    pc_load = 1'b0;
    mar_load = 1'b0;
    ir_load = 1'b0;
    ram_we = 1'b0;
    a_load = 1'b0;
    b_load = 1'b0;
    out_load = 1'b0;
    flag_load = 1'b0;
    swap_en = 1'b0;

    alu_op = opcode;
    bus_sel = BUS_NONE;

    input_wait_led = 1'b0;
    halt_led = 1'b0;
    state_out = state;

    case(state)

        FETCH1:
        begin
            bus_sel = BUS_PC;
            mar_load = 1'b1;
        end

        FETCH2:
        begin
            bus_sel = BUS_RAM;
            ir_load = 1'b1;
            pc_inc = 1'b1;
        end

        WAIT_INPUT:
        begin
            input_wait_led = 1'b1;

            if(input_enter)
            begin
                bus_sel = BUS_INPUT;
                a_load = 1'b1;
            end
        end

        EXEC1:
        begin
            case(opcode)

                STA:
                begin
                    bus_sel = BUS_OPERAND;
                    mar_load = 1'b1;
                end

                LDA:
                begin
                    bus_sel = BUS_OPERAND;
                    mar_load = 1'b1;
                end

                LDB:
                begin
                    bus_sel = BUS_OPERAND;
                    mar_load = 1'b1;
                end

                JMP:
                begin
                    bus_sel = BUS_OPERAND;
                    pc_load = 1'b1;
                end

                default:
                begin
                    bus_sel = BUS_NONE;
                end

            endcase
        end

        EXEC2:
        begin
            case(opcode)

                STA:
                begin
                    bus_sel = BUS_A;
                    ram_we = 1'b1;
                end

                LDA:
                begin
                    bus_sel = BUS_RAM;
                    a_load = 1'b1;
                end

                LDB:
                begin
                    bus_sel = BUS_RAM;
                    b_load = 1'b1;
                end

                ADD:
                begin
                    bus_sel = BUS_ALU;
                    a_load = 1'b1;
                    flag_load = 1'b1;
                end

                SUB:
                begin
                    bus_sel = BUS_ALU;
                    a_load = 1'b1;
                    flag_load = 1'b1;
                end

                MUL:
                begin
                    bus_sel = BUS_ALU;
                    a_load = 1'b1;
                    flag_load = 1'b1;
                end

                INC:
                begin
                    bus_sel = BUS_ALU;
                    a_load = 1'b1;
                    flag_load = 1'b1;
                end

                DEC:
                begin
                    bus_sel = BUS_ALU;
                    a_load = 1'b1;
                    flag_load = 1'b1;
                end

                CLR:
                begin
                    bus_sel = BUS_ALU;
                    a_load = 1'b1;
                    flag_load = 1'b1;
                end

                OUT:
                begin
                    bus_sel = BUS_A;
                    out_load = 1'b1;
                end

                SWP:
                begin
                    swap_en = 1'b1;
                end

                default:
                begin
                    bus_sel = BUS_NONE;
                end

            endcase
        end

        HALT:
        begin
            halt_led = 1'b1;
        end

        default:
        begin
            bus_sel = BUS_NONE;
        end

    endcase
end

endmodule
