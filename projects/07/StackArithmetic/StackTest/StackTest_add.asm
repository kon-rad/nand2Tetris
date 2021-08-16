// init sp stack pointer variable to value that is in RAM[0]
@0
D=M
@SP
M=D
// push constant 17
@17
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// push constant 13
@13
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
@SP
M=M-1
// add D to SP
@SP
A=M
M=D+M
// increment SP
@SP
M=M+1