// init sp stack pointer variable to value that is in RAM[0]
@0
D=M
@SP
M=D
// push constant 17
@17
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// push constant 17
@17
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// eq
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
// eq D to SP
@SP
A=M
D=M-D
@IS_TRUE
D;JEQ
@SP
A=M
M=0
@IS_FALSE
0;JMP
(IS_TRUE)
@SP
A=M
M=-1
(IS_FALSE)
// increment SP
@SP
M=M+1
// push constant 17
@17
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// push constant 16
@16
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// eq
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
// eq D to SP
@SP
A=M
D=M-D
@IS_TRUE
D;JEQ
@SP
A=M
M=0
@IS_FALSE
0;JMP
(IS_TRUE)
@SP
A=M
M=-1
(IS_FALSE)
// increment SP
@SP
M=M+1
// push constant 16
@16
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// push constant 17
@17
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// eq
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
// eq D to SP
@SP
A=M
D=M-D
@IS_TRUE
D;JEQ
@SP
A=M
M=0
@IS_FALSE
0;JMP
(IS_TRUE)
@SP
A=M
M=-1
(IS_FALSE)
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
// increment SP
@SP
M=M+1