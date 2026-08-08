# 4-Bit Universal Shift Register using Verilog

## Overview

This project implements a **4-bit Universal Shift Register** using Verilog HDL.

A universal shift register is a sequential digital circuit capable of performing multiple operations on stored data. It can hold data, shift data to the left, shift data to the right, and load data in parallel.

## Features

* 4-bit universal shift register
* Verilog HDL implementation
* Asynchronous active-high reset
* Hold operation
* Shift-right operation
* Shift-left operation
* Parallel-load operation
* Verilog testbench
* Simulation output
* VCD waveform generation
* Icarus Verilog compatible
* GTKWave compatible
* Makefile included

## Project Structure

```text
universal-shift-register/
├── rtl/
│   └── universal_shift_register.v
├── tb/
│   └── tb_universal_shift_register.v
├── simulation/
│   └── simulation_output.txt
├── README.md
└── Makefile
```

## Objective

The objective of this project is to design and simulate a 4-bit universal shift register capable of performing four basic operations:

1. Hold
2. Shift right
3. Shift left
4. Parallel load

## Operation Table

| Mode | Operation     | Description                           |
| :--: | ------------- | ------------------------------------- |
| `00` | Hold          | Retains the current data              |
| `01` | Shift Right   | Shifts data one position to the right |
| `10` | Shift Left    | Shifts data one position to the left  |
| `11` | Parallel Load | Loads all four bits simultaneously    |

## Working Principle

The universal shift register consists of four flip-flops and multiplexing logic.

The `mode` input determines which operation is performed at each rising edge of the clock.

### Mode 00 — Hold

When:

```text
mode = 00
```

the current value remains unchanged.

Example:

```text
1010 → 1010
```

### Mode 01 — Shift Right

When:

```text
mode = 01
```

the data shifts toward the right.

The `serial_right` input enters the most-significant-bit position.

Example:

```text
1010
 ↓
1101
```

when `serial_right = 1`.

### Mode 10 — Shift Left

When:

```text
mode = 10
```

the data shifts toward the left.

The `serial_left` input enters the least-significant-bit position.

Example:

```text
1010
 ↓
0101
```

when `serial_left = 1`.

### Mode 11 — Parallel Load

When:

```text
mode = 11
```

the four-bit `parallel_in` value is loaded into the register.

Example:

```text
parallel_in = 1010

q = 1010
```

## Input Signals

| Signal         | Width | Description                  |
| -------------- | ----: | ---------------------------- |
| `clk`          |     1 | Clock                        |
| `reset`        |     1 | Active-high reset            |
| `mode`         |     2 | Operation selection          |
| `serial_left`  |     1 | Serial input for left shift  |
| `serial_right` |     1 | Serial input for right shift |
| `parallel_in`  |     4 | Parallel data input          |

## Output Signal

| Signal | Width | Description     |
| ------ | ----: | --------------- |
| `q`    |     4 | Register output |

## Reset

When:

```text
reset = 1
```

the register is cleared:

```text
q = 0000
```

When reset is released, the selected operation occurs on each positive clock edge.

## Simulation

The testbench is located at:

```text
tb/tb_universal_shift_register.v
```

The testbench verifies all four operating modes.

### Test Sequence

The simulation performs:

```text
1. Reset
2. Parallel Load
3. Hold
4. Shift Right
5. Shift Right
6. Shift Left
7. Shift Left
```

The initial parallel value is:

```text
1010
```

## Expected Result

The expected output sequence is:

```text
1010  → Parallel Load

1010  → Hold

1101  → Shift Right

0110  → Shift Right

1101  → Shift Left

1010  → Shift Left
```

## Simulation Output

Example output:

```text
================================================
       4-BIT UNIVERSAL SHIFT REGISTER TEST
================================================
Time    Reset   Mode    Parallel    SerialL SerialR Q
------------------------------------------------
0       1       00      0000        0       0       0000
12000   0       00      0000        0       0       0000
15000   0       11      1010        0       0       1010
25000   0       00      1010        0       0       1010
35000   0       01      1010        0       1       1101
45000   0       01      1010        0       0       0110
55000   0       10      1010        1       0       1101
65000   0       10      1010        0       0       1010
------------------------------------------------
Simulation completed successfully.
```

## Waveform

The testbench generates:

```text
universal_shift_register.vcd
```

The waveform can be viewed using GTKWave.

Signals to observe:

```text
clk
reset
mode
parallel_in
serial_left
serial_right
q
```

## Running the Simulation

### Using Icarus Verilog

Compile:

```bash
iverilog -o universal_shift_register_sim rtl/universal_shift_register.v tb/tb_universal_shift_register.v
```

Run:

```bash
vvp universal_shift_register_sim
```

### Using GTKWave

Open the generated waveform:

```bash
gtkwave universal_shift_register.vcd
```

## Applications

Universal shift registers are used in:

* Data transfer
* Serial-to-parallel conversion
* Parallel-to-serial conversion
* Digital communication
* Temporary data storage
* Data manipulation
* Microprocessor interfaces
* Digital control systems

## Advantages

* Supports multiple data-transfer modes
* Can perform both left and right shifts
* Supports parallel data loading
* Useful for serial and parallel data conversion
* Flexible sequential circuit

## Tools Used

* Verilog HDL
* Icarus Verilog
* GTKWave
* Git/GitHub

## Result

The 4-bit Universal Shift Register was successfully designed and simulated.

The simulation verifies all four operations:

```text
Hold
Shift Right
Shift Left
Parallel Load
```

**Result: PASS**

## Author

```text
Name: Your Name
Department: Your Department
College: Your College
```

## License

This project is intended for educational and academic purposes.
