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
// pop local 0
// decrement SP
@SP
M=M-1
@LCL
D=M
@0
D=D+A
@temp
M=D
@SP
A=M
D=M
@temp
A=M
M=D
// label LOOP_START
(LOOP_START)
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
// pop local 0
// decrement SP
@SP
M=M-1
@LCL
D=M
@0
D=D+A
@temp
M=D
@SP
A=M
D=M
@temp
A=M
M=D
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
// push constant 1
@1
D=A
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
// pop argument 0
// decrement SP
@SP
M=M-1
@ARG
D=M
@0
D=D+A
@temp
M=D
@SP
A=M
D=M
@temp
A=M
M=D
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
// if-goto LOOP_START
// decrement SP
@SP
M=M-1
@SP
A=M
D=M
@LOOP_START
D;JNE
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