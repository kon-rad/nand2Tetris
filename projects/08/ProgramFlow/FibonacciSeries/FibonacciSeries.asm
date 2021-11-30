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
// pop pointer 1
// decrement SP
@SP
M=M-1
@SP
A=M
D=M
@THAT
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
// pop that 0
// decrement SP
@SP
M=M-1
@THAT
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
// pop that 1
// decrement SP
@SP
M=M-1
@THAT
D=M
@1
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
// push constant 2
@2
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
// label MAIN_LOOP_START
(MAIN_LOOP_START)
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
// if-goto COMPUTE_ELEMENT
// decrement SP
@SP
M=M-1
@SP
A=M
D=M
@COMPUTE_ELEMENT
D;JNE
// goto END_PROGRAM
@END_PROGRAM
0;JMP
// label COMPUTE_ELEMENT
(COMPUTE_ELEMENT)
// push that 0
@THAT
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
// push that 1
@THAT
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
// pop that 2
// decrement SP
@SP
M=M-1
@THAT
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
// pop pointer 1
// decrement SP
@SP
M=M-1
@SP
A=M
D=M
@THAT
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
// goto MAIN_LOOP_START
@MAIN_LOOP_START
0;JMP
// label END_PROGRAM
(END_PROGRAM)