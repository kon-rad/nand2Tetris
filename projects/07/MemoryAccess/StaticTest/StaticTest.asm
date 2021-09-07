// push constant 111
@111
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// push constant 333
@333
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// push constant 888
@888
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// pop static 8
// decrement SP
@SP
M=M-1
@SP
A=M
D=M
@StaticTest.8
M=D
// pop static 3
// decrement SP
@SP
M=M-1
@SP
A=M
D=M
@StaticTest.3
M=D
// pop static 1
// decrement SP
@SP
M=M-1
@SP
A=M
D=M
@StaticTest.1
M=D
// push static 3
@StaticTest.3
D=M
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// push static 1
@StaticTest.1
D=M
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// sub
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
// subtract D from SP
@SP
A=M
M=M-D
// increment SP
@SP
M=M+1
// push static 8
@StaticTest.8
D=M
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