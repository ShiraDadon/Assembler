# Assembler Project

## Overview

This project is a two-pass assembler developed in ANSI C as part of the *Systems Programming Laboratory* course at the Open University of Israel.

Final project grade: **99**.

The assembler receives assembly source files (`.as`), processes them through preprocessing, first-pass and second-pass stages, and generates machine-code output files.

---

## Assembly Process

The assembler processes each input file through several stages:

### 1. Preprocessor Stage
- Expands macro definitions
- Validates macro declarations and usage
- Creates an intermediate `.am` file

### 2. First Pass
- Reads and validates assembly lines
- Builds the symbol table
- Encodes instructions and data that can be resolved immediately
- Stores unresolved labels for the second pass

### 3. Second Pass
- Resolves label addresses
- Handles `.entry` and `.extern` declarations
- Completes the machine-code image

### 4. Output Generation
Generates output files according to the source file content:
- `.ob` — object file
- `.ent` — entry labels
- `.ext` — external label usages

---

## Main Data Structures

The assembler relies on several core data structures:

- **Symbol table** — stores labels, memory addresses, and symbol attributes such as code, data, entry, or external.
- **Macro table** — stores macro names and their expanded content during the preprocessing stage.
- **Line structure** — represents a parsed assembly line, including labels, commands, directives, and operands.
- **Code image** — stores encoded instruction words before generating the object file.
- **Data image** — stores encoded data directives such as numbers and strings.
- **Unresolved labels list** — tracks labels that are referenced before their final addresses are known and resolves them during the second pass.

---

## Core Modules

| File | Description |
|---|---|
| `assembler.c` | Main program entry point and file management |
| `preprocessor.c` | Handles preprocessing stage and macro expansion |
| `macro_structure.c` | Manages macro data structures |
| `first_pass.c` | Performs the first pass of the assembler |
| `first_pass_func.c` | Helper functions used during the first pass |
| `second_pass.c` | Performs the second pass of the assembler |
| `second_pass_func.c` | Helper functions used during the second pass |
| `command_parsing.c` | Parses assembly commands and operands |
| `line_structure.c` | Handles line parsing and line representation |
| `octal_translation.c` | Converts binary machine code to unique base-8 representation |
| `tables.c` | Symbol tables and related operations |
| `generic_linked_list.c` | Generic linked-list implementation used throughout the project |
| `global_const.h` | Global constants and shared definitions |

---

## Memory Model

The assembler targets a custom machine architecture with a memory size of **4096 memory cells** and **8 registers**.

- Each memory word contains **15 bits**
- The machine supports **8 registers**
- Instructions and data are stored separately during assembly
- Symbol addresses are resolved during the two-pass process
- The final output is generated in a unique base-8 representation

---

## Input Files

The assembler processes assembly source files with the `.as` extension.

When running the program, file names should be provided **without** the `.as` extension, since the assembler appends it internally.

Test input files are located in the `tests/` directory.

---

## Output Files

Depending on the source file content, the assembler may generate:

| Extension | Description |
|---|---|
| `.am` | Expanded source file after macro processing |
| `.ob` | Object file containing machine code in unique base-8 |
| `.ent` | Entry labels and their addresses |
| `.ext` | External labels and usage addresses |

---

## Running the Program

Compile the project using:

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

---

## Technologies

- ANSI C
- Makefile
- Linux / Ubuntu development environment

---

## Author

Shira Dadon  
Open University of Israel
