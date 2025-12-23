// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

//// Replace this comment with your code.
// variables
@sum
M=0
@count
M=0

// load R1 into variable count
@R1
D=M
@count
M=D+M // count = R1

// adding loop
(LOOP)
    // if count less or equal to 0
    @count
    D=M
    @ENDLOOP
    D;JLE

    // sum
    @R0
    D=M
    @sum
    M=D+M

    // count - 1
    @count
    M=M-1

    @LOOP
    0;JMP
(ENDLOOP)

// loads sum in D
@sum
D=M
// R2 = sum
@R2
M=D

// infinite loop end
(END)
@END
0;JMP
