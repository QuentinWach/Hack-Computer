# Assembler
We'll the high-level language [Python](https://www.python.org/) to describe the assembler, and Hack assembly language for the example programs.
The workflow for now will then be to write a code in Hack, convert it into binary code using our Assembler written in Python, and execute that binary code with our computer.

## Writing an Assembler in Python
The assembler I lay out here does two passes. First, we'll record label declarations, then we'll generate binary code, handling both A-instructions and C-instructions. I provide the code for the assembler in the [code repository on GitHub](https://github.com/QuentinWach/Hack-Computer). But I encourage you to look at these functions and try to fill it in yourself. It's a simple idea but can be a bit tricky to not make a mistake.
In more detail:
1. Initializes symbol tables and instruction code tables.
2. Removes comments and whitespace from the input.
3. Performs a first pass to record label declarations.
4. Performs a second pass to generate binary code:
5. Handles A-instructions (starting with @)
6. Handles C-instructions (dest=comp;jump)
7. Writes the resulting binary code to a `.hack` file.

```python
import re
import sys

class Assembler:
    def __init__(self):
        self.symbol_table = {
            'SP': 0, 'LCL': 1, 'ARG': 2, 'THIS': 3, 'THAT': 4,
            'R0': 0, 'R1': 1, 'R2': 2, 'R3': 3, 'R4': 4, 'R5': 5, 'R6': 6, 'R7': 7,
            'R8': 8, 'R9': 9, 'R10': 10, 'R11': 11, 'R12': 12, 'R13': 13, 'R14': 14, 'R15': 15,
            'SCREEN': 16384, 'KBD': 24576
        }
        self.next_variable_address = 16
        self.comp_table = {
            '0': '0101010', '1': '0111111', '-1': '0111010', 'D': '0001100',
            'A': '0110000', '!D': '0001101', '!A': '0110001', '-D': '0001111',
            '-A': '0110011', 'D+1': '0011111', 'A+1': '0110111', 'D-1': '0001110',
            'A-1': '0110010', 'D+A': '0000010', 'D-A': '0010011', 'A-D': '0000111',
            'D&A': '0000000', 'D|A': '0010101',
            'M': '1110000', '!M': '1110001', '-M': '1110011', 'M+1': '1110111',
            'M-1': '1110010', 'D+M': '1000010', 'D-M': '1010011', 'M-D': '1000111',
            'D&M': '1000000', 'D|M': '1010101'
        }
        self.dest_table = {
            '': '000', 'M': '001', 'D': '010', 'MD': '011',
            'A': '100', 'AM': '101', 'AD': '110', 'AMD': '111'
        }
        self.jump_table = {
            '': '000', 'JGT': '001', 'JEQ': '010', 'JGE': '011',
            'JLT': '100', 'JNE': '101', 'JLE': '110', 'JMP': '111'
        }

    def remove_comments_and_whitespace(self, line):
        pass

    def first_pass(self, assembly_code):
        pass

    def get_address(self, symbol):
        pass

    def assemble_a_instruction(self, instruction):
        pass

    def assemble_c_instruction(self, instruction):
        pass

    def second_pass(self, assembly_code):
        pass

    def assemble(self, filename):
        pass

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Usage: python assembler.py <input_file.asm>")
        sys.exit(1)

    input_file = sys.argv[1]
    assembler = Assembler()
    assembler.assemble(input_file)
```

If you use the provided `assembler.py` script, you can use it from the command line, providing the input `.asm` file as an argument:
```bash
> python assembler.py input_file.asm
```
The assembler will generate an output file with the same name but with a `.hack` extension, containing the binary machine code. So let's go back to writing some assembly programs and see what we can make our computer do!

## Add
This is one of our two basic arithmetic operations our ALU can do.
```asm
// Add.asm
// Computes R0 = 2 + 3

@2
D=A
@3
D=D+A
@0
M=D
```
Feeding this `add.asm` file through our assembler, you'll see Hack binary code like `add.hack` this
```hack
0000000000000010
1110110000010000
0000000000000011
1110000010010000
0000000000000000
1110001100001000
```
created. 

In the Hack computer architecture, every line of generated binary code represents one operation or instruction. This is known as a **"one instruction per line" or "single instruction per line" architecture**. 

Note how the assembly code and the generate binary code thus have roughly the same number of lines.

## Max
Compared to the `add.asm` program, `max.asm` finding the maximum number of two numbers is a bit longer:

```asm
// Max.asm
// Computes R2 = max(R0, R1)

   @R0
   D=M              // D = first number
   @R1
   D=D-M            // D = first number - second number
   @OUTPUT_FIRST
   D;JGT            // if D>0 (first is greater) goto output_first
   @R1
   D=M              // D = second number
   @OUTPUT_D
   0;JMP            // goto output_d
(OUTPUT_FIRST)
   @R0             
   D=M              // D = first number
(OUTPUT_D)
   @R2
   M=D              // M[2] = D (greatest number)
(INFINITE_LOOP)
   @INFINITE_LOOP
   0;JMP            // infinite loop
```
## Rect
Now, the next big goal is to be able to play a game of Pong on our computer. For that, we need to draw images to the screen! The code below shows how to draw a simple rectangle.

```asm
// Rect.asm
// Draws a rectangle at the top-left corner of the screen.
// The rectangle is 16 pixels wide and R0 pixels high.

   @0
   D=M
   @INFINITE_LOOP
   D;JLE 
   @counter
   M=D
   @SCREEN
   D=A
   @address
   M=D
(LOOP)
   @address
   A=M
   M=-1
   @address
   D=M
   @32
   D=D+A
   @address
   M=D
   @counter
   MD=M-1
   @LOOP
   D;JGT
(INFINITE_LOOP)
   @INFINITE_LOOP
   0;JMP
```

## Pong