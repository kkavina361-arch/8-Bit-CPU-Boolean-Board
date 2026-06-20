# Instruction Set Architecture (ISA)

The processor uses an 8-bit instruction format:

```text
+--------+--------+
| Opcode |Operand |
| 4 bits | 4 bits |
+--------+--------+
```

* Opcode : Specifies the operation to be performed.
* Operand : Memory address, immediate value, or control field.

---

# Instruction Set

| Opcode | Mnemonic | Description                            |
| ------ | -------- | -------------------------------------- |
| 0000   | NOP      | No Operation                           |
| 0001   | IN       | Read input from switches               |
| 0010   | STA      | Store A Register to RAM                |
| 0011   | LDA      | Load RAM data into A Register          |
| 0100   | LDB      | Load RAM data into B Register          |
| 0101   | ADD      | Add A and B Registers                  |
| 0110   | SUB      | Subtract B from A                      |
| 0111   | OUT      | Transfer A Register to Output Register |
| 1000   | HLT      | Halt CPU Execution                     |
| 1001   | INS      | Read input from Sensor Interface       |
| 1010   | JMP      | Jump to specified address              |
| 1011   | MUL      | Multiply A and B Registers             |
| 1100   | INC      | Increment A Register                   |
| 1101   | DEC      | Decrement A Register                   |
| 1110   | CLR      | Clear A Register                       |
| 1111   | SWP      | Swap A and B Register Contents         |

---

# Instruction Categories

## Data Transfer Instructions

```text
IN
INS
STA
LDA
LDB
OUT
```

Used for moving data between input devices, registers, memory, and output devices.

---

## Arithmetic Instructions

```text
ADD
SUB
MUL
INC
DEC
CLR
```

Used for arithmetic and register operations.

---

## Control Instructions

```text
NOP
JMP
HLT
```

Used for controlling program execution flow.

---

## Register Manipulation Instruction

```text
SWP
```

Used to exchange the contents of A Register and B Register.

---

# Supported Features

* 8-bit Data Path
* 4-bit Opcode Field
* 4-bit Operand Field
* 16 Instruction ISA
* Memory Read/Write Operations
* Arithmetic Operations
* Sensor Input Support
* Program Control Instructions
* Register Transfer Operations
