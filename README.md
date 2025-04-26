<div align="center">

<h3 align="center">Computer Architecture Examples</h3>

  <p align="center">
    A collection of ARM64 and LEGv8 assembly programs, along with C equivalents.
    <br />
     <a href="https://github.com/tridibbanik17/computer-architecture.git">github.com/tridibbanik17/computer-architecture.git</a>
  </p>
</div>

## Table of Contents

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#key-features">Key Features</a></li>
      </ul>
    </li>
    <li><a href="#architecture">Architecture</a></li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

## About The Project

This repository contains a variety of assembly language programs for ARM64 and LEGv8 architectures, along with a C program demonstrating overflow checking. The programs serve as examples for understanding fundamental computer architecture concepts and assembly language programming.

### Key Features

- **ARM64 Assembly Examples:** Includes programs for signed/unsigned overflow detection, factorial calculation, and Fibonacci sequence generation.
- **LEGv8 Assembly Examples:** Demonstrates basic arithmetic operations, array manipulation, loop constructs, and loading 64-bit constants.
- **C Language Example:** Provides a C program that utilizes the ARM64 assembly overflow checking functions.
- **Comprehensive Examples:** Covers a range of common programming tasks implemented in assembly language.

## Architecture

The repository is structured into three main directories:

- **ARM64:** Contains assembly programs written for the ARM64 architecture. These programs utilize system calls and external functions like `printf` and `atoi`.
- **LEGv8:** Contains assembly programs written for the LEGv8 architecture, demonstrating fundamental assembly programming concepts.
- **C:** Contains a C program that interacts with the ARM64 assembly functions for overflow checking.

The ARM64 assembly programs are designed to be compiled and linked using a suitable ARM64 assembler and linker. The LEGv8 assembly programs can be assembled and simulated using a LEGv8 simulator. The C program can be compiled using a standard C compiler.

## Getting Started

### Prerequisites

- **ARM64 Assembly:**
  - An ARM64 assembler (e.g., `as` from GNU Binutils)
  - A C compiler (e.g., GCC) for linking
  - A system with ARM64 architecture or an emulator

- **LEGv8 Assembly:**
  - A LEGv8 simulator (e.g., a simulator that supports LEGv8 assembly)

- **C:**
  - A C compiler (e.g., GCC)

### Installation

1. **Clone the repository:**
   ```sh
   git clone https://github.com/tridibbanik17/computer-architecture.git
   cd computer-architecture
   ```

2. **ARM64 Assembly (Example - factorial.s):**
   ```sh
   # Assemble the code
   as ARM64/factorial.s -o factorial.o

   # Compile and link with a C driver (if needed, create a simple main.c to call the factorial function)
   gcc factorial.o -o factorial

   # Run the executable
   ./factorial 10 # Example: calculate factorial of 10
   ```

3. **LEGv8 Assembly (Example - AddSub.s):**
   ```sh
   # Use a LEGv8 simulator to load and run the assembly code.
   # The exact steps depend on the simulator being used.
   # For example, in a hypothetical simulator:
   legv8sim LEGv8/AddSub.s
   ```

4. **C Program (overflow.c):**
   ```sh
   # Compile the C code
   gcc C/overflow.c -o overflow

   # Run the executable with two integer arguments
   ./overflow 2147483647 1
   ```

## Acknowledgments

- This README was created using [gitreadme.dev](https://gitreadme.dev) — an AI tool that looks at your entire codebase to instantly generate high-quality README files.
