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