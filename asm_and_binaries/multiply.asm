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