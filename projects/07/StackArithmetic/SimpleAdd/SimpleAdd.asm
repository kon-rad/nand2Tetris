// init SP stack pointer variable to value that is in RAM[0]
@0
D=M
@SP
M=D
// init LCL stack pointer variable to value that is in RAM[1]
@1
D=M
@LCL
M=D
// init ARG stack pointer variable to value that is in RAM[2]
@2
D=M
@ARG
M=D
// init THIS stack pointer variable to value that is in RAM[3]
@3
D=M
@THIS
M=D
// init THAT stack pointer variable to value that is in RAM[4]
@4
D=M
@THAT
M=D
// push constant 7
@7
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// push constant 8
@8
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// add
// decrement SP and remove
@SP
A=M
M=0
// decrement SP
@SP
M=M-1
// assign SP to D
@SP
A=M
D=M
// decrement SP and remove
@SP
A=M
M=0
// decrement SP
@SP
M=M-1
// add D to SP
@SP
A=M
M=D+M
// increment SP
@SP
M=M+1