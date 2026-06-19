# 8-Bit Computer Architecture on FPGA (Single Bus Architecture)

## Overview

The proposed processor is an 8-bit FPGA-based computer implemented using a Single Bus Architecture. The design supports manual program loading, preloaded demonstration programs, sensor interfacing, arithmetic operations, and seven-segment display output.

---

## Architecture Blocks

### 1. Clock Divider

Generates slow and fast clocks for CPU operation.

**Inputs**

* FPGA System Clock
* SW14 (Clock Select)

**Outputs**

* Slow Clock (1 Hz)
* Fast Clock (5 Hz)

---

### 2. Program Loader

Loads predefined demonstration programs into RAM.

**Modes**

SW15 = 0

* Multiplication Demo Program

SW15 = 1

* Add/Subtract Demo Program

---

### 3. Control Unit (FSM)

Controls the complete instruction execution cycle.

Functions:

* Fetch
* Decode
* Execute
* Wait for Input
* Halt

---

### 4. Program Counter (PC)

Stores address of next instruction.

Functions:

* Increment
* Reset
* Jump

Width:

* 4-bit

Address Range:

* 0 to 15

---

### 5. Memory Address Register (MAR)

Stores RAM address during memory access operations.

Width:

* 4-bit

---

### 6. RAM (16 × 8)

Stores program instructions and data.

Memory Organization:

Address 0–11

* Program Instructions

Address 12–13

* User Data Storage

Address 14–15

* Reserved

---

### 7. Instruction Register (IR)

Stores current instruction fetched from RAM.

Width:

* 8-bit

Instruction Format:

Opcode [7:4]

Operand [3:0]

---

### 8. A Register

Stores primary operand and ALU result.

Width:

* 8-bit

---

### 9. B Register

Stores secondary operand.

Width:

* 8-bit

---

### 10. Arithmetic Logic Unit (ALU)

Supported Operations:

* ADD
* SUB
* MUL
* INC
* DEC
* CLR
* SWP

Output:

* 8-bit Result

---

### 11. Flag Register

Stores processor status flags.

Flags:

* Z (Zero)
* C (Carry)

---

### 12. Output Register

Stores result before display.

Width:

* 8-bit

---

### 13. Input Interface

Provides user and sensor inputs.

Sources:

SW13 = 0

* Switch Input

SW13 = 1

* Sensor Input

---

### 14. Seven Segment Display Driver

Converts binary output to display format.

Displays:

* Arithmetic Results
* User Data
* CPU Output

---

### 15. LED Status Module

Visual CPU status indication.

Green LED:

* WAIT_INPUT State

Red LED:

* HLT State

---

## Single Bus Data Flow

Input Interface
↓
A Register
↓
ALU ↔ B Register
↓
Output Register
↓
Seven Segment Display

Instruction Flow:

PC
↓
MAR
↓
RAM
↓
IR
↓
Control Unit
↓
Execution

---

## User Modes

### Manual Programming Mode

SW12 = 0

User manually writes instructions into RAM using:

* SW[7:0] Data Bus
* SW[11:8] Address Bus
* BTN0 Program Write

---

### Demo Mode

SW12 = 1

Program Loader automatically loads:

SW15 = 0

* Multiplication Demo

SW15 = 1

* Add/Subtract Demo

User presses RUN to execute.

---

## Processor Specifications

* FPGA Based Design
* 8-bit Data Width
* 16 × 8 RAM
* 16 Instruction ISA
* Single Bus Architecture
* Manual Program Loading
* Demo Program Support
* Sensor Interface Support
* Seven Segment Display Output

