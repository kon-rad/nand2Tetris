// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// there are 512 columns - that is 32 columns of 16 bits each (32 * 16 = 512)
// there are 255 rows
// keyboard is at 24576

// first screen address is 16384
// 256 * 32 = 8192
// 16383 + 8192 = 24575
// there are 8192 16 bits in the screen
// last screen address is 24575

@32
D=A
@col
M=D


@256
D=A
@row
M=D

(START)
@j
M=0

@16384
D=A
@screenpt
M=D

(LOOP_COL)

// set (or reset) i to zero after every row is filled up
@i
M=0
(LOOP_ROW)

// set current bit to black
// 16384 is the first bit


// @24576
@KBD
D=M
@KEY_PRESSED
D;JNE

// set screen pointer to 0 to make it white if no key is pressed
@screenpt
A=M
M=0

@KEY_NOT_PRESSED
0;JMP

(KEY_PRESSED)
// set screen pointer to -1 to make it all black
@screenpt
A=M
M=-1

(KEY_NOT_PRESSED)
// increment the screen pointer by 1
@screenpt
M=M+1

// increment i by 1
@i
M=M+1
D=M

// if i is less than 32 go to top of loop
@col
D=D-M
@LOOP_ROW
D;JLT

// otherwise it is the end of the row - increment j
@j
M=M+1

// if j is greater than 255 then exit loop, otherwise restart the row
@j
D=M
@row
D=D-M
@LOOP_COL
D;JLT

// restart the paint loop
@START
0;JMP


