# 8-Bit Computer Instruction Set Architecture (ISA)

## Instruction Format

Each instruction is 8 bits wide.

```text
+------------+------------+
| Opcode[7:4]| Operand[3:0]|
+------------+------------+
```

* Opcode (4 bits): Operation to perform
* Operand (4 bits): Memory address or parameter

---

## Instruction Set

| Opcode | Mnemonic | Function                             |
| ------ | -------- | ------------------------------------ |
| 0000   | NOP      | No Operation                         |
| 0001   | IN       | Read Switch Input into A Register    |
| 0010   | STA      | Store A Register to RAM              |
| 0011   | LDA      | Load RAM Data into A Register        |
| 0100   | LDB      | Load RAM Data into B Register        |
| 0101   | ADD      | A ← A + B                            |
| 0110   | SUB      | A ← A − B                            |
| 0111   | OUT      | Output A Register                    |
| 1000   | HLT      | Halt CPU Execution                   |
| 1001   | INS      | Read Sensor Input into A Register    |
| 1010   | JMP      | Jump to Specified Address            |
| 1100   | INC      | A ← A + 1                            |
| 1101   | DEC      | A ← A − 1                            |
| 1110   | CLR      | Clear A Register (A ← 0)             |
| 1111   | SWP      | Swap Contents of A and B Registers   |

---

## Instruction Categories

### Data Transfer Instructions

* IN
* INS
* STA
* LDA
* LDB
* OUT
* SWP

### Arithmetic Instructions

* ADD
* SUB
* MUL
* INC
* DEC
* CLR

### Program Control Instructions

* JMP
* HLT
* NOP

---

## Design Features

* 8-bit Data Path
* 16 Instruction ISA
* Single Bus Architecture
* Memory Mapped Program Storage
* Interactive User Input
* Sensor Input Support
* FPGA Friendly Implementation
* Multiplication using Repeated Addition
* Manual Program Loading Mode
* Preloaded Demo Program Support

