// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Replace this comment with your code.

// pointer to screen
@counter
D=0
M=D

// max value for the screen
@8192
D=A
@max
M=D

// loop listen to key press
(LOOP)
    @KBD
    D=M
    // keyboard state will either be 
    // KBD != 0, go to write
    // KBD = 0, go to clear
    @WRITE
    D;JNE
    @CLEAR
    D;JEQ
    // since there's no other state, there's no need
    // for any other condition

// keep writing until key is released
(WRITE)
    // change pixels in word to black
    @counter
    D=M
    // Turn screen black
    @SCREEN
    A=D+A
    M=-1

    // In order to not overwrite ram, check if counter bigger than screen
    @max
    D=M-D
    @ADD
    D;JGE

    (WRCONT)
    // move to next bit
    @KBD
    D=M
    @LOOP
    D;JEQ
    @WRITE
    D;JMP

// add to counter
(ADD)
    @counter
    M=M+1
    @WRCONT
    D;JMP

// subtracted from counter
(SUB)
    @counter
    M=M-1
    @CLCONT
    D;JMP

// keep erasing until Screen = 16384 again
(CLEAR)
    // Load counter to D register 
    @counter
    D=M
    // turn the screen white
    @SCREEN
    A=D+A
    M=0

    @min
    D=M-D
    @SUB
    D;JLE

    (CLCONT)
    // move to next bit
    @KBD
    D=M
    @LOOP
    D;JEQ
    @WRITE
    D;JMP


