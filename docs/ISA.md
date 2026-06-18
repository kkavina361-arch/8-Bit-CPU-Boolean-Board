# Instruction Set Architecture (ISA)

The processor uses an 8-bit instruction format.

Instruction Format:

[ OPCODE (4-bit) ][ OPERAND (4-bit) ]

| Opcode | Mnemonic | Description                 |
| ------ | -------- | --------------------------- |
| 0000   | NOP      | No Operation                |
| 0001   | IN       | Read Switch Input           |
| 0010   | STA      | Store A Register to RAM     |
| 0011   | LDA      | Load RAM Data to A Register |
| 0100   | LDB      | Load RAM Data to B Register |
| 0101   | ADD      | A = A + B                   |
| 0110   | SUB      | A = A - B                   |
| 0111   | OUT      | Output A Register           |
| 1000   | HLT      | Halt Processor              |
| 1001   | INS      | Read Sensor Input           |
| 1010   | JMP      | Jump to Address             |

Flag Register:

Z = Zero Flag
C = Carry Flag
B = Borrow Flag
N = Negative Flag
