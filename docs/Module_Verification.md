# Module Verification Report

## 1. Program Counter (PC)

### Objective
Generate sequential instruction addresses.

### Verification
- Reset Operation ✓
- Count Enable (CE) ✓
- Clear (CL) ✓
- 4-bit Overflow ✓

### Result
PASS

---

## 2. Memory Address Register (MAR)

### Objective
Store memory address from bus.

### Verification
- Reset Operation ✓
- Address Loading using MI ✓

### Result
PASS

---

## 3. RAM (16×8)

### Objective
Store instructions and data.

### Verification
- Write Operation ✓
- Read Operation ✓
- Address Decoding ✓

### Result
PASS

---

## 4. Instruction Register (IR)

### Objective
Store fetched instruction and split into opcode and operand.

### Verification
Input: 2C

Opcode = 2 ✓

Operand = C ✓

Input: 3D

Opcode = 3 ✓

Operand = D ✓

### Result
PASS

---

## 5. A Register

### Objective
Store operand for ALU operations.

### Verification
- Reset Operation ✓
- Data Load using AI ✓

### Result
PASS

---

## 6. B Register

### Objective
Store second operand for ALU operations.

### Verification
- Reset Operation ✓
- Data Load using BI ✓

### Result
PASS

---

# Verification Environment

Tool 1:
- Intel Quartus Prime

Tool 2:
- Xilinx Vivado 2024.1

# Current CPU Status

Verified Modules:

✓ Program Counter (PC)

✓ Memory Address Register (MAR)

✓ RAM (16×8)

✓ Instruction Register (IR)

✓ A Register

✓ B Register

Modules Under Development:

□ ALU

□ Flag Register

□ Output Register

□ Control Unit

□ CPU Top Module
