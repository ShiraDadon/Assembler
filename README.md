# Assembler Project

## Overview

This project is a two-pass assembler developed in ANSI C as part of the *Systems Programming Laboratory* course at the Open University of Israel.

Final project grade: **99**.

The assembler receives assembly source files (`.as`), processes them through preprocessing, first-pass and second-pass stages, and generates machine-code output files.



## Assembly Process

### 1. Preprocessor

Expands macro definitions, validates macro usage, and creates an intermediate `.am` file.

### 2. First Pass

Reads and validates the assembly code, builds the symbol table, encodes data and instructions that can be resolved immediately, and leaves label operands for the second pass.

### 3. Second Pass

Resolves label operands using the symbol table, handles `.entry` and `.extern` declarations, and completes the final machine-code image.



## Main Data Structures

- **Symbol table** — stores labels, memory addresses, and symbol attributes such as code, data, entry, or external.
- **Macro table** — stores macro names and their expanded content during preprocessing.
- **Line structure** — represents a parsed assembly line, including labels, commands, directives, and operands.
- **Code image** — stores encoded instruction words before generating the object file.
- **Data image** — stores encoded data directives such as numbers and strings.
- **External references list** — stores external symbol usage addresses for the `.ext` output file.



## Core Modules

- `assembler.c` — main program entry point and file handling.
- `preprocessor.c`, `macro_structure.c` — handle macro expansion and preprocessing.
- `first_pass.c`, `first_pass_func.c` — perform the first pass, including symbol-table construction and initial encoding.
- `second_pass.c`, `second_pass_func.c` — resolve label operands, handle entries and externals, and complete the machine-code image.
- `command_parsing.c`, `line_structure.c` — parse assembly lines, commands, directives, and operands.
- `tables.c` — manages symbol tables and related operations.
- `generic_linked_list.c` — generic linked-list implementation used across the project.
- `octal_translation.c` — converts machine code to the required base-8 output format.
- `global_const.h` — global constants and shared definitions.



## Memory Model

The assembler targets a custom machine architecture with:

- 4096 memory cells
- 8 registers
- 15-bit memory words
- Separate instruction and data images during assembly
- Final output in a unique base-8 representation



## Input Files

The assembler processes source files with the `.as` extension.

When running the program, file names should be provided without the `.as` extension, because the assembler appends it internally.

Test input files are located in the `tests/` directory.



## Output Files

The assembler may generate the following files:

- `.am` — expanded source file after macro processing.
- `.ob` — object file containing the translated machine code.
- `.ent` — entry labels and their addresses.
- `.ext` — external label usages and their addresses.



## Running the Program

Compile the project:

```bash
make
```

Run the assembler with one or more input file names, without the `.as` extension:

```bash
./assembler file1 file2
```

Example:

```bash
./assembler tests/valid_input_1
```

This command processes `tests/valid_input_1.as`.

