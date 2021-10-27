// function Class1.set 0
(Class1.set)
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
// pop static 0
// decrement SP
@SP
M=M-1
@SP
A=M
D=M
@Class1.0
M=D
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
// pop static 1
// decrement SP
@SP
M=M-1
@SP
A=M
D=M
@Class1.1
M=D
// push constant 0
@0
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// return
// function Class1.get 0
(Class1.get)
// push static 0
@Class1.0
D=M
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// push static 1
@Class1.1
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