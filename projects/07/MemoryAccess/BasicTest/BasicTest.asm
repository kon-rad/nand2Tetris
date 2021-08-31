// init SP stack pointer variable to value that is in RAM[0]
@0
D=M
@SP
M=D
// init LCL stack pointer variable to value that is in RAM[1]
@1
D=M
@LCL
M=D
// init ARG stack pointer variable to value that is in RAM[2]
@2
D=M
@ARG
M=D
// init THIS stack pointer variable to value that is in RAM[3]
@3
D=M
@THIS
M=D
// init THAT stack pointer variable to value that is in RAM[4]
@4
D=M
@THAT
M=D
// push constant 10
@10
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
// decrement SP and remove
@SP
A=M
M=0
// decrement SP
@SP
M=M-1
// increment SP
@SP
M=M+1
// push constant 21
@21
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// push constant 22
@22
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// pop argument 2
// decrement SP
@SP
M=M-1
@ARG
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
// decrement SP and remove
@SP
A=M
M=0
// decrement SP
@SP
M=M-1
// increment SP
@SP
M=M+1
// pop argument 1
// decrement SP
@SP
M=M-1
@ARG
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
// decrement SP and remove
@SP
A=M
M=0
// decrement SP
@SP
M=M-1
// increment SP
@SP
M=M+1
// push constant 36
@36
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// pop this 6
// decrement SP
@SP
M=M-1
@THIS
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
// decrement SP and remove
@SP
A=M
M=0
// decrement SP
@SP
M=M-1
// increment SP
@SP
M=M+1
// push constant 42
@42
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// push constant 45
@45
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// pop that 5
// decrement SP
@SP
M=M-1
@THAT
D=M
@5
D=D+A
@temp
M=D
@SP
A=M
D=M
@temp
A=M
M=D
// decrement SP and remove
@SP
A=M
M=0
// decrement SP
@SP
M=M-1
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
// decrement SP and remove
@SP
A=M
M=0
// decrement SP
@SP
M=M-1
// increment SP
@SP
M=M+1
// push constant 510
@510
D=A
// assign D to SP
@SP
A=M
M=D
// increment SP
@SP
M=M+1
// pop temp 6
// decrement SP
@SP
M=M-1
@SP
A=M
D=M
@11
M=D
// decrement SP and remove
@SP
A=M
M=0
// decrement SP
@SP
M=M-1
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
// push that 5
@THAT
D=M
@5
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
// push this 6
@THIS
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
// push this 6
@THIS
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
// push temp 6
@11
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