Let's write some Hack assembly language, which is a low-level language designed for the Hack computer.

## Multiplication Program
This program multiplies the values in R0 and R1, storing the result in R2. It uses a simple repeated addition algorithm. The program loops R1 times, adding R0 to R2 each time, and then decrements R1. This continues until R1 reaches zero.
```
// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

    @R2
    M=0    // Initialize R2 to 0
    @R0
    D=M    // D = R0
    @END
    D;JEQ  // If R0 == 0, goto END

(LOOP)
    @R1
    D=M    // D = R1
    @END
    D;JEQ  // If R1 == 0, goto END
    @R2
    D=M    // D = R2
    @R0
    D=D+M  // D = R2 + R0
    @R2
    M=D    // R2 = R2 + R0
    @R1
    M=M-1  // R1 = R1 - 1
    @LOOP
    0;JMP  // Goto LOOP

(END)
    @END
    0;JMP  // Infinite loop
```
## I/O-Handling Program
This program demonstrates basic I/O handling in the Hack computer:

It continuously reads from the keyboard (mapped to memory address KBD).
If 'T' is pressed, it displays 'T' on the screen (at the memory address SCREEN).
If 'q' is pressed, the program ends.
For any other key, it continues listening.
```
// This program reads from the keyboard and displays on the screen.
// It stops when the user presses 'q' (ASCII 113).

(LOOP)
    @KBD
    D=M        // Read from keyboard
    @84
    D=D-A      // Check if 'T' was pressed (ASCII 84)
    @DISPLAY_T
    D;JEQ      // If 'T', goto DISPLAY_T
    @29
    D=D-A      // Check if 'q' was pressed (ASCII 113)
    @END
    D;JEQ      // If 'q', goto END
    @LOOP
    0;JMP      // Otherwise, continue listening

(DISPLAY_T)
    @84
    D=A        // D = 'T'
    @SCREEN
    M=D        // Display 'T' at the top-left of the screen
    @LOOP
    0;JMP      // Go back to listening

(END)
    @END
    0;JMP      // Infinite loop
```

There are very simple examples but these programs showcase key aspects of Hack assembly:

+ Use of A-instructions (@) to set the A register.
+ Use of C-instructions for computation and jumps.
+ Labels for program flow control.
+ Interaction with memory-mapped I/O.