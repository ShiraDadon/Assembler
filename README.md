# Assembler

*Systems Programming Laboratory (ANSI C) | Final Grade: 99*

Developed a two-pass assembler in ANSI C for a custom assembly language and architecture (4096-byte memory, 8 registers, 15-bit words).

The assembler translates `.as` source files into machine code and generates output files in a unique base-8 representation.  
The project includes macro preprocessing, syntax and semantic validation, symbol resolution, and machine code generation.

---

## Core Components

### Preprocessing Stage
**Files:** `preprocessor.c`, `macro_structure.c`

Handles macro expansion before the assembly process begins.

**Main Data Structures:**
- **Macro Table** – Stores macro names and their expanded content
- **Generic Linked Lists** – Used for dynamic macro storage and memory management

---

### First Pass
**Files:** `first_pass.c`, `first_pass_func.c`

Scans the source file, validates syntax, identifies labels and directives, and builds the initial symbol table.

**Main Data Structures:**
- **Symbol Table** – Stores labels, addresses, and label types
- **Instruction Structures** – Represents parsed assembly commands and operands
- **Unresolved Symbol Structures** – Keeps references to labels that will be resolved during the second pass

---

### Second Pass
**Files:** `second_pass.c`, `second_pass_func.c`

Resolves symbol addresses, processes `.entry` and `.extern` labels, and completes machine code generation.

**Main Data Structures:**
- **Entry/External Label Tables** – Tracks exported and external symbols
- **Machine Word Structures** – Represents encoded machine instructions and memory words

---

### Parsing & Translation
**Files:** `command_parsing.c`, `line_structure.c`, `octal_translation.c`

Responsible for parsing assembly instructions and converting machine code into the unique base-8 output format.

**Main Data Structures:**
- **Line Structures** – Represents parsed assembly lines
- **Code Word Structures** – Encodes instructions and operands into machine representation

---

### Shared Infrastructure
**Files:** `tables.c`, `generic_linked_list.c`

Provides reusable infrastructure used throughout the assembler.

**Main Data Structures:**
- **Generic Linked Lists** – Dynamic memory management across the project
- **Symbol & Lookup Tables** – Shared table operations and data access utilities

---

## Generated Output Files

- `.am` – Expanded source file  
- `.ob` – Object file containing machine code  
- `.ent` – Entry symbols  
- `.ext` – External symbol references  

---

## Technologies

`ANSI C` • `Makefile` • `Linux`
