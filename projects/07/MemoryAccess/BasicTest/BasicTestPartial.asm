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
// pop static 98
// decrement SP
@SP
M=M-1
@SP
A=M
D=M
@BasicTestPartial.98
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
// push static 98
@BasicTestPartial.98
D=M
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// push constant 231
@231
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// pop static 2
// decrement SP
@SP
M=M-1
@SP
A=M
D=M
@BasicTestPartial.2
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
// pop static 3
// decrement SP
@SP
M=M-1
@SP
A=M
D=M
@BasicTestPartial.3
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
// push static 2
@BasicTestPartial.2
D=M
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// push static 3
@BasicTestPartial.3
D=M
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1