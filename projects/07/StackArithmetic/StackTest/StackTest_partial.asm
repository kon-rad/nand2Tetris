// init sp stack pointer variable to value that is in RAM[0]
@0
D=M
@SP
M=D
// push constant 57
@57
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// push constant 31
@31
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// push constant 53
@53
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
// push constant 112
@112
D=A
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
// subtract D from SP
@SP
A=M
M=M-D
// increment SP
@SP
M=M+1
// neg
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
// subtract D from 0 to negate
@0
D=A-D
@SP
M=M+1
A=M
M=D
// increment SP
@SP
M=M+1
// and
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
// handle D and SP
@SP
A=M
M=D&M
// increment SP
@SP
M=M+1
// push constant 82
@82
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// or
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
// handle D and SP
@SP
A=M
M=D|M
// increment SP
@SP
M=M+1
// not
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
// handle not D
@SP
A=M
M=!D
// increment SP
@SP
M=M+1