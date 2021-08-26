@256
D=A
@0
M=D
@1015
D=A
@1
M=D
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
// push constant 10
@10
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// pop local 98
// decrement SP
@SP
M=M-1
@LCL
D=M
@98
D=D+A
@temp
M=D
@SP
A=M
D=M
@temp
A=M
M=D
// decrement SP and remove
@SP
A=M
M=0
// decrement SP
@SP
M=M-1
// increment SP
@SP
M=M+1
// push constant 21
@21
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// push local 98
@LCL
D=M
@98
D=D+A
A=D
D=M
@SP
A=M
M=D
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1