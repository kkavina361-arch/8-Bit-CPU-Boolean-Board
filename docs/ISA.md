# Instruction Set Architecture (ISA)

## Instruction Format

The processor uses an 8-bit instruction format.

```text
+------------+------------+
| Opcode[7:4]| Operand[3:0]|
+------------+------------+
```

* Opcode (4 bits): Specifies the operation to perform.
* Operand (4 bits): Specifies memory address or instruction parameter.

---

## Instruction Set

| Opcode | Mnemonic | Function                             |
| ------ | -------- | ------------------------------------ |
| 0000   | NOP      | No Operation                         |
| 0001   | IN       | Read Switch Input into A Register    |
| 0010   | STA      | Store A Register into RAM            |
| 0011   | LDA      | Load RAM Data into A Register        |
| 0100   | LDB      | Load RAM Data into B Register        |
| 0101   | ADD      | A ← A + B                            |
| 0110   | SUB      | A ← A - B                            |
| 0111   | OUT      | Output A Register                    |
| 1000   | HLT      | Halt CPU Execution                   |
| 1001   | INS      | Read Sensor Input into A Register    |
| 1010   | JMP      | Jump to Specified Address            |
| 1011   | MUL      | A ← A × B (Repeated Addition Method) |
| 1100   | INC      | A ← A + 1                            |
| 1101   | DEC      | A ← A - 1                            |
| 1110   | CLR      | Clear A Register (A ← 0)             |
| 1111   | SWP      | Swap Contents of A and B Registers   |

---

## Supported Operations

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

## Example Program

```assembly
IN
STA 12

IN
STA 13

LDA 12
LDB 13

ADD

OUT

HLT
```

### Program Description

1. Read first input from switches.
2. Store value at RAM address 12.
3. Read second input from switches.
4. Store value at RAM address 13.
5. Load RAM[12] into A Register.
6. Load RAM[13] into B Register.
7. Add A and B.
8. Display result.
9. Halt processor execution.

---

## Design Philosophy

The ISA is designed to provide:

* Simple educational CPU architecture
* Memory access operations
* Arithmetic computation capability
* Sensor interfacing support
* Interactive user input
* FPGA-friendly implementation
* Minimal hardware complexity

