@256
D=A
@0
M=D
@1015
D=A
@1
M=D
@2015
D=A
@2
M=D
@3015
D=A
@3
M=D
@4015
D=A
@4
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
// pop argument 2
// decrement SP
@SP
M=M-1
@LCL
D=M
@2
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
// push constant 11
@11
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// push argument 2
@ARG
D=M
@2
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
// push constant 12
@12
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// pop this 2
// decrement SP
@SP
M=M-1
@LCL
D=M
@2
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
// pop that 2
// decrement SP
@SP
M=M-1
@LCL
D=M
@2
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