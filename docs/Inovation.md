# Innovations

This project extends the traditional 8-Bit Single Bus CPU architecture by introducing several enhancements that improve usability, observability, flexibility, and educational value.

---

## 1. Automatic Program Loader

Unlike conventional educational CPUs that require manual instruction entry before every execution, this design includes an automatic program loader.

### Features

- Preloaded demonstration programs
- Instant execution after reset
- Reduced setup time during demonstrations

### Benefits

- Improves user experience
- Simplifies project demonstrations
- Enables quick testing and debugging

---

## 2. Interactive Input Wait Mechanism

The CPU supports interactive user input through a dedicated wait state.

### Operation

```text
IN Instruction
      ↓
CPU Enters WAIT_INPUT State
      ↓
Green LED Turns ON
      ↓
User Enters Data
      ↓
BTN3 Pressed
      ↓
CPU Resumes Execution
```

### Benefits

- Real-time user interaction
- Better demonstration capability
- Similar to embedded controller behavior

---

## 3. Dual Operating Modes

The processor supports both manual programming and automatic execution modes.

### Mode Selection

```text
SW12 = 0 → Manual Programming Mode

SW12 = 1 → CPU Execution Mode
```

### Benefits

- Supports educational learning
- Supports standalone demonstrations
- Flexible operation

---

## 4. Sensor Interface Support

The CPU can accept inputs from either board switches or external sensors.

### Input Source Selection

```text
SW13 = 0 → Switch Input

SW13 = 1 → Sensor Input
```

### Future Expansion

- IR Sensor
- Temperature Sensor
- LDR Sensor
- Ultrasonic Sensor

### Benefits

- Real-world interfacing capability
- Easy future upgrades

---

## 5. Real-Time CPU Execution Monitoring

The internal operation of the processor is displayed using onboard seven-segment displays.

### Display Mapping

```text
HEX7 HEX6 → Program Counter (PC)

HEX5 HEX4 → Current Instruction

HEX3 HEX2 → A Register

HEX1 HEX0 → Output Register
```

### Benefits

- Real-time visualization of instruction execution
- Easy debugging and verification
- Enhanced educational value

---

## 6. Expanded Instruction Set Architecture

The processor fully utilizes the 4-bit opcode space by supporting 16 instructions.

### Supported Instructions

```text
NOP
IN
STA
LDA
LDB
ADD
SUB
OUT
HLT
INS
JMP
INC
DEC
CLR
SWP
```

### Benefits

- Increased functionality
- Enhanced computational capability
- More comprehensive CPU architecture

---

## Summary

Compared to a basic educational 8-bit CPU, this design introduces:

- Automatic Program Loading
- Interactive User Input Handling
- Dual Operating Modes
- Sensor Interfacing Capability
- Real-Time CPU Monitoring
- Expanded 16-Instruction ISA

These enhancements improve usability, observability, flexibility, and educational value while maintaining a simple single-bus architecture.
