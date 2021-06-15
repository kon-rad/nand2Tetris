// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

@R2
M=0

@i
M=0

// return early if R1 is zero
@R1
D=M
@END
D;JEQ

// return early if R0 is zero
@R0
D=M
@END
D;JEQ

(LOOP)
// increment i by one
@i
D=M
M=D+1

// add R0 to R2
@R0
D=M
@R2
M=D+M

// if i is less than R1 jump to top of loop
@R1
D=M
@i
D=D-M
@LOOP
D;JGT

(END)
@END
0;JMP


