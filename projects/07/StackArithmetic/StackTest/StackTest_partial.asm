// init sp stack pointer variable to value that is in RAM[0]
@0
D=0
@SP
M=D
// push constant 892
@892
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// push constant 891
@891
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// lt
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
// SP minus D
@SP
A=M
D=M-D
@IS_FALSE_0
D;JGE
@SP
A=M
M=-1
@IS_TRUE_0
0;JMP
(IS_FALSE_0)
@SP
A=M
M=0
(IS_TRUE_0)
// increment SP
@SP
M=M+1
// push constant 891
@891
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// push constant 892
@892
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// lt
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
// SP minus D
@SP
A=M
D=M-D
@IS_FALSE_1
D;JGE
@SP
A=M
M=-1
@IS_TRUE_1
0;JMP
(IS_FALSE_1)
@SP
A=M
M=0
(IS_TRUE_1)
// increment SP
@SP
M=M+1
// push constant 891
@891
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// push constant 891
@891
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// lt
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
// SP minus D
@SP
A=M
D=M-D
@IS_FALSE_2
D;JGE
@SP
A=M
M=-1
@IS_TRUE_2
0;JMP
(IS_FALSE_2)
@SP
A=M
M=0
(IS_TRUE_2)
// increment SP
@SP
M=M+1
// push constant 32767
@32767
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// push constant 32766
@32766
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// gt
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
// SP minus D
@SP
A=M
D=M-D
@IS_FALSE_3
D;JLE
@SP
A=M
M=-1
@IS_TRUE_3
0;JMP
(IS_FALSE_3)
@SP
A=M
M=0
(IS_TRUE_3)
// increment SP
@SP
M=M+1
// push constant 32766
@32766
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// push constant 32767
@32767
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// gt
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
// SP minus D
@SP
A=M
D=M-D
@IS_FALSE_4
D;JLE
@SP
A=M
M=-1
@IS_TRUE_4
0;JMP
(IS_FALSE_4)
@SP
A=M
M=0
(IS_TRUE_4)
// increment SP
@SP
M=M+1
// push constant 32766
@32766
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// push constant 32766
@32766
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// gt
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
// SP minus D
@SP
A=M
D=M-D
@IS_FALSE_5
D;JLE
@SP
A=M
M=-1
@IS_TRUE_5
0;JMP
(IS_FALSE_5)
@SP
A=M
M=0
(IS_TRUE_5)
// increment SP
@SP
M=M+1
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