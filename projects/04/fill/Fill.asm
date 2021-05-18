// by Konrad Gnat
// 05/16/2021
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(START)

@column
M=0

@SCREEN
D=A
@spointer
M=D

(COLUMN_START)
@i
M=0

(ROW)

  @i
  D=M
  @32
  D=D-A // if i == 32 move on to new row
  @ENDROW
  D;JEQ

  // check if key pressed
  @24576
  D=M

  // jump to pressed if keyboard memory != 0
  @PRESSED
  D;JNE

  // set 0 if key not pressed
  @spointer 
  A=M
  M=0
  @ENDLOOP
  0;JMP

  // set -1 if key pressed
  (PRESSED)
  @spointer 
  A=M
  M=-1

  (ENDLOOP)
  @i // increment i
  M=M+1

  @spointer
  D=M
  D=D+1
  @spointer // increment screen pointer - there are 32 in the screen width
  M=D

  @ROW
  0;JMP

(ENDROW)

@column // increment column
M=M+1

// check if column iteration ended
D=M
@256
D=D-A // if column iterated over all 16 - go to start
@START
D;JEQ

@COLUMN_START
0;JMP

@START
0;JMP

