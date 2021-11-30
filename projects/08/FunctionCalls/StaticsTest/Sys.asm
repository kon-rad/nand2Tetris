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
@Sys.0
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
@Sys.1
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
@Sys.0
D=M
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// push static 1
@Sys.1
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
// function Sys.init 0
(Sys.init)
// push constant 6
@6
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
// call Class1.set 2
(ret.Sys.Class1.set)
LCL
ARG
THIS
THAT
@SP
D=A-5
@ARG
M=D
@SP
D=M
@LCL
M=D
@Class1.set
0;JMP
((ret.Sys.Class1.set))
// pop temp 0
// decrement SP
@SP
M=M-1
@SP
A=M
D=M
@5
M=D
// push constant 23
@23
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// push constant 15
@15
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// call Class2.set 2
(ret.Sys.Class2.set)
LCL
ARG
THIS
THAT
@SP
D=A-5
@ARG
M=D
@SP
D=M
@LCL
M=D
@Class2.set
0;JMP
((ret.Sys.Class2.set))
// pop temp 0
// decrement SP
@SP
M=M-1
@SP
A=M
D=M
@5
M=D
// call Class1.get 0
(ret.Sys.Class1.get)
LCL
ARG
THIS
THAT
@SP
D=A-5
@ARG
M=D
@SP
D=M
@LCL
M=D
@Class1.get
0;JMP
((ret.Sys.Class1.get))
// call Class2.get 0
(ret.Sys.Class2.get)
LCL
ARG
THIS
THAT
@SP
D=A-5
@ARG
M=D
@SP
D=M
@LCL
M=D
@Class2.get
0;JMP
((ret.Sys.Class2.get))
// label WHILE
(WHILE)
// goto WHILE
@WHILE
0;JMP