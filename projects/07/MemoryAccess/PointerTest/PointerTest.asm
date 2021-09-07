// push constant 3030
@3030
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// pop pointer 0
// decrement SP
@SP
M=M-1
@SP
A=M
D=M
@THIS
M=D
// push constant 3040
@3040
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// pop pointer 1
// decrement SP
@SP
M=M-1
@SP
A=M
D=M
@THAT
M=D
// push constant 32
@32
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
@THIS
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
// push constant 46
@46
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// pop that 6
// decrement SP
@SP
M=M-1
@THAT
D=M
@6
D=D+A
@temp
M=D
@SP
A=M
D=M
@temp
A=M
M=D
// push pointer 0
@THIS
D=M
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// push pointer 1
@THAT
D=M
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// add
// decrement SP
@SP
M=M-1
// assign SP to D
@SP
A=M
D=M
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
// push this 2
@THIS
D=M
@2
D=D+A
A=D
D=M
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// sub
// decrement SP
@SP
M=M-1
// assign SP to D
@SP
A=M
D=M
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
// push that 6
@THAT
D=M
@6
D=D+A
A=D
D=M
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// add
// decrement SP
@SP
M=M-1
// assign SP to D
@SP
A=M
D=M
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