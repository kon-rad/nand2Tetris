// function SimpleFunction.test 2
(SimpleFunction.test)
push 0
push 0
// push local 0
@LCL
D=M
@0
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
// push local 1
@LCL
D=M
@1
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
// not
// decrement SP
@SP
M=M-1
// assign SP to D
@SP
A=M
D=M
// write not D
@SP
A=M
M=!D
// increment SP
@SP
M=M+1
// push argument 0
@ARG
D=M
@0
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
// push argument 1
@ARG
D=M
@1
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
// return