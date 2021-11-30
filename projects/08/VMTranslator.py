import sys
import os
import re
from os import listdir
from os.path import isfile, join

# Notes:
# when running test scripts, manually set RAM 0 to 256
# set RAM[0] 256,  // initializes the stack pointer

class CommandTypes:
  C_ARITHMETIC = 'C_ARITHMETIC'
  C_PUSH = 'C_PUSH'
  C_POP = 'C_POP'
  C_LABEL = 'C_LABEL'
  C_GOTO = 'C_GOTO'
  C_IF = 'C_IF'
  C_FUNCTION = 'C_FUNCTION'
  C_RETURN = 'C_RETURN'
  C_CALL = 'C_CALL'
  C_IF_GOTO = 'C_IF_GOTO'
  C_GOTO = 'C_GOTO'
  C_LABEL = 'C_LABEL'
  C_CALL = 'C_CALL'
  C_FUNCTION = 'C_FUNCTION'
  C_RETURN = 'C_RETURN'

class MemorySegments:
  CONSTANT = 'constant'
  LOCAL = 'local'
  ARGUMENT = 'argument'
  THIS = 'this'
  THAT = 'that'
  STATIC = 'static'
  TEMP = 'temp'
  POINTER = 'pointer'

class CodeWriter:
  filePath = ''
  fileName = ''
  fileNameWithExt = ''
  lines = []
  labelCount = 0
  isDev = False
  segmentsWithPointer = [MemorySegments.LOCAL, MemorySegments.ARGUMENT, MemorySegments.THIS, MemorySegments.THAT]
  segToPointer = { 'local': '@LCL', 'argument': '@ARG', 'this': '@THIS', 'that': '@THAT' }

  def __init__(self, filePath):
    filePathArr = filePath.split("/")
    self.filePath = filePath
    self.fileNameWithExt = filePathArr[-1]
    self.fileName = self.fileNameWithExt.split(".")[0]
    # self.initVariables()

  # def initVariables(self):
    # if self.isDev:
    #   self.lines.extend(['@256', 'D=A', '@0', 'M=D', '@1015', 'D=A', '@1', 'M=D']) # SP, LCL
    #   self.lines.extend(['@2015', 'D=A', '@2', 'M=D', '@3015', 'D=A', '@3', 'M=D', '@4015', 'D=A', '@4', 'M=D']) # ARG, THIS, THAT
    # self.lines.extend(['// init SP stack pointer variable to value that is in RAM[0]', '@0', 'D=M', '@SP', 'M=D'])
    # self.lines.extend(['// init LCL stack pointer variable to value that is in RAM[1]', '@1', 'D=M', '@LCL', 'M=D'])
    # self.lines.extend(['// init ARG stack pointer variable to value that is in RAM[2]', '@2', 'D=M', '@ARG', 'M=D'])
    # self.lines.extend(['// init THIS stack pointer variable to value that is in RAM[3]', '@3', 'D=M', '@THIS', 'M=D'])
    # self.lines.extend(['// init THAT stack pointer variable to value that is in RAM[4]', '@4', 'D=M', '@THAT', 'M=D'])

  def writeNewLine(self, line):
    self.lines.append(line)

  # push value from segment to the stack
  def writePushLine(self, line):
    lineArr = line.split(' ')
    if len(lineArr) != 3:
      raise Exception("Push command has the wrong number of arguments: ", line)
    memorySegment = lineArr[1]
    pushVal = lineArr[2]
    # get value from segment and assign to D
    if memorySegment == MemorySegments.CONSTANT:
      self.lines.extend([f"@{pushVal}", 'D=A'])
    elif memorySegment in self.segmentsWithPointer:
      segmentPointer = self.segToPointer[memorySegment]
      self.lines.extend([segmentPointer, 'D=M', f'@{pushVal}', 'D=D+A', 'A=D', 'D=M'])
    elif memorySegment == MemorySegments.STATIC:
      self.lines.extend([f'@{self.fileName}.{pushVal}', 'D=M'])
    elif memorySegment == MemorySegments.TEMP:
      if int(pushVal) > 8 or int(pushVal) < 0:
        raise Exception("Push value to the Temp memory segment can only be from 0-7: ", line)
      self.lines.extend([f'@{int(pushVal) + 5}', 'D=M'])
    elif memorySegment == MemorySegments.POINTER:
      if pushVal == '1':
        thisOrThat = '@THAT'
      elif pushVal == '0':
        thisOrThat = '@THIS'
      else:
        raise Exception("Push value to the Pointer memory segment can only be 0 or 1: ", line)
      self.lines.extend([thisOrThat, 'D=M'])
    self.assignDToSP()
    self.incrementSP()

  # pop value from the stack to the segment
  def writePopLine(self, line):
    lineArr = line.split(' ')
    if len(lineArr) != 3:
      raise Exception("Pop command has the wrong number of arguments: ", line)
    memorySegment = lineArr[1]
    popVal = lineArr[2]

    if memorySegment in self.segmentsWithPointer:
      # get val from LCL
      # add i to it
      # set value in SP to it
      self.decrementSP()
      segmentPointer = self.segToPointer[memorySegment]
      self.lines.extend([segmentPointer, 'D=M', f'@{popVal}', 'D=D+A', '@temp', 'M=D', '@SP', 'A=M', 'D=M', '@temp', 'A=M', 'M=D'])

    elif memorySegment == MemorySegments.STATIC:
      self.decrementSP()
      self.lines.extend(['@SP', 'A=M', 'D=M', f'@{self.fileName}.{popVal}', 'M=D'])

    elif memorySegment == MemorySegments.TEMP:
      if int(popVal) > 8 or int(popVal) < 0:
        raise Exception("Pop value to the Temp memory segment can only be from 0-7: ", line)
      self.decrementSP()
      self.lines.extend(['@SP', 'A=M', 'D=M', f'@{int(popVal) + 5}', 'M=D'])

    elif memorySegment == MemorySegments.POINTER:
      if popVal == '1':
        thisOrThat = '@THAT'
      elif popVal == '0':
        thisOrThat = '@THIS'
      else:
        raise Exception("Pop value to the Pointer memory segment can only be 0 or 1: ", line)
      self.decrementSP()
      self.lines.extend(['@SP', 'A=M', 'D=M', thisOrThat, 'M=D'])

  def writeArithmeticLine(self, line):
    print("writeArithmeticLine", line)
    self.decrementSP()
    self.assignSPToD()
    ARITHMETIC_COMMANDS = ['add', 'sub', 'neg', 'eq', 'gt', 'lt', 'and', 'or', 'not']
    if line in ['add', 'sub', 'neg', 'eq', 'lt', 'gt', 'and', 'or']:
      self.decrementSP()

    if line == 'add':
      self.writeAdd()
    elif line == 'sub':
      self.writeSub()
    elif line == 'neg':
      self.writeNeg()
    elif line == 'eq':
      self.writeEq()
    elif line == 'lt':
      self.writeLt()
    elif line == 'gt':
      self.writeGt()
    elif line == 'and':
      self.writeAnd()
    elif line == 'or':
      self.writeOr()
    elif line == 'not':
      self.writeNot()
    self.incrementSP()

  def writeAdd(self):
    self.lines.extend(['// add D to SP', '@SP', 'A=M', 'M=D+M'])

  def writeSub(self):
    self.lines.extend(['// subtract D from SP', '@SP', 'A=M', 'M=M-D'])

  # write negate -y
  def writeNeg(self):
    self.lines.extend(['// subtract D from 0 to negate', '@0', 'D=A-D', '@SP', 'M=M+1', 'A=M', 'M=D'])

  def writeEq(self):
    # subtract M from D and set to D
    self.lines.extend(['// eq D to SP', '@SP', 'A=M', 'D=M-D' ])
    # D=M-D - if D is zero, they are equal, jump to IS_TRUE
    self.lines.extend([f'@IS_TRUE_{self.labelCount}', 'D;JEQ'])
    # otherwise it's false, set SP to 0
    self.lines.extend(['@SP', 'A=M', 'M=0', f'@IS_FALSE_{self.labelCount}', '0;JMP'])
    # it is true, set SP to -1
    self.lines.extend([f'(IS_TRUE_{self.labelCount})', '@SP', 'A=M', 'M=-1'])
    # is false - continues
    self.lines.extend([f'(IS_FALSE_{self.labelCount})'])
    self.labelCount += 1

  def writeLt(self):
    # assuming that D is already loaded with value 1
    # subtract M from D and set to D
    self.lines.extend(['// SP minus D', '@SP', 'A=M', 'D=M-D' ])
    # JGE -> jump if answer (D) is >= 0 jump
    # todo: bug here
    self.lines.extend([f'@IS_FALSE_{self.labelCount}', 'D;JGE'])
    # otherwise it is true that SP is less than D - then continue
    self.lines.extend(['@SP', 'A=M', 'M=-1', f'@IS_TRUE_{self.labelCount}', '0;JMP'])
    # write if answer is false
    self.lines.extend([f'(IS_FALSE_{self.labelCount})', '@SP', 'A=M', 'M=0'])
    # is false - continues
    self.lines.extend([f'(IS_TRUE_{self.labelCount})'])
    self.labelCount += 1

  def writeGt(self):
    # assuming that D is already loaded with value 1
    # subtract M from D and set to D
    self.lines.extend(['// SP minus D', '@SP', 'A=M', 'D=M-D' ])
    # jump if answer (D) is <= 0 (JLE)
    self.lines.extend([f'@IS_FALSE_{self.labelCount}', 'D;JLE'])
    # otherwise it is true that SP is less than D - then continue
    self.lines.extend(['@SP', 'A=M', 'M=-1', f'@IS_TRUE_{self.labelCount}', '0;JMP'])
    # write if answer is false
    self.lines.extend([f'(IS_FALSE_{self.labelCount})', '@SP', 'A=M', 'M=0'])
    # is false - continues
    self.lines.extend([f'(IS_TRUE_{self.labelCount})'])
    self.labelCount += 1

  def writeAnd(self):
    self.lines.extend(['// write D and SP', '@SP', 'A=M', 'M=D&M'])

  def writeOr(self):
    self.lines.extend(['// write D and SP', '@SP', 'A=M', 'M=D|M'])

  def writeNot(self):
    self.lines.extend(['// write not D', '@SP', 'A=M', 'M=!D'])
  
  def decrementSP(self):
    self.lines.extend(['// decrement SP', '@SP', 'M=M-1'])

  def assignDToSP(self):
    self.lines.extend(['// assign D to SP', '@SP', 'A=M', 'M=D'])

  def assignSPToD(self):
    self.lines.extend(['// assign SP to D', '@SP', 'A=M', 'D=M'])
  
  def incrementSP(self):
    self.lines.extend(['// increment SP', '@SP', 'M=M+1'])

  def getStackPointer(self):
    # this command gets the stack pointer and assigns it's value to A register
    # use this before using the stack pointer value
    self.lines.extend(['@SP', 'A=M'])
  
  def incrementStackPointer(self):
    self.lines.extend(['// increment stack pointer','@SP', 'M=M+1'])

  def writeLines(self):
    filePathArr = self.filePath.split('/')
    fileName = filePathArr[len(filePathArr) - 1].split('.')[0]
    destFileName = fileName + ".asm"
    destFilePath = '/'.join(filePathArr[0:-1]) + '/' + destFileName;
    file = open(destFilePath, 'w')
    file.writelines('\n'.join(self.lines))
    file.close()

  def addComment(self, line):
    self.lines.append('// ' + line)

  # def setFileName(self, fileName):
  # def writeInit(self):
  def writeLabel(self, label):
    lineArr = label.split(' ')
    if len(lineArr) != 2:
      Exception("Error: Incorrect number of parameters in label statement: ", label)
    labelValue = lineArr[1]
    self.lines.extend([f'({labelValue})'])

  def writeIfGoto(self, label):
    lineArr = label.split(' ')
    if len(lineArr) != 2:
      Exception("Error: Incorrect number of parameters in if-goto statement: ", label)
    labelValue = lineArr[1]
    self.decrementSP()
    self.lines.extend(['@SP', 'A=M', 'D=M', f'@{labelValue}', 'D;JNE'])

  def writeGoto(self, label):
    lineArr = label.split(' ')
    if len(lineArr) != 2:
      Exception("Error: Incorrect number of parameters in goto statement: ", label)
    labelValue = lineArr[1]
    self.lines.extend([f'@{labelValue}', '0;JMP'])

  def writeFunction(self, line):
    lineArr = line.split(' ')
    if len(lineArr) != 3:
      Exception("Error: Incorrect number of parameters in function statement: ", line)
    functionName = lineArr[1]
    argsNum = lineArr[2]
    # declare a label for function entry
    self.lines.extend([f'({functionName})'])
    # initialize local variables to zero
    count = int(argsNum)
    while count > 0:
      count -= 1
      self.lines.extend([f'push 0'])


  def writeCall(self, line):
    lineArr = line.split(' ')
    if len(lineArr) != 3 or len(lineArr) != 2:
      Exception("Error: Incorrect number of parameters in call statement: ", line)
    functionName = lineArr[1]
    argsNum = lineArr[2]
    # push returnlabel 
    returnAddress = f'(ret.{self.fileName}.{functionName})'
    # // todo: fix bug here - throws error for only 2 parameters
    self.lines.extend([f'{returnAddress}'])
    # self.lines.extend([f'(ret.{self.fileName}.{functionName})'])
    # push the LCL of the caller
    self.lines.extend([f'LCL'])
    # push the ARG of the caller
    self.lines.extend([f'ARG'])
    # push the THIS of the caller
    self.lines.extend([f'THIS'])
    # push the THAT of the caller
    self.lines.extend([f'THAT'])
    # reposition ARG
    # ARG = SP - 5 - nArgs
    self.lines.extend(['@SP', 'D=A-5', '@ARG', 'M=D'])
    # reposition LCL
    # LCL = SP
    self.lines.extend(['@SP', 'D=M', '@LCL', 'M=D'])
    # transfer control to the called function
    self.writeGoto(f'goto {functionName}')
    # declare a label for the return address
    # (returnAddress)
    self.lines.extend([f'({returnAddress})'])

  def writeReturn(self):
    # endFrame is a temporary variable, the LCL value
    # endFrame = LCL
    self.lines.extend(['@LCL', 'D=A', '@endFrame', 'A=D'])
    # get the return address
    # retAddr = *(endFrame - 5)
    self.lines.extend('@endFrame', 'D=A', 'D=D-5', '@retAddr', 'M=D')
    # *ARG = pop()
    # repositions the return value for the caller
    self.decrementSP()
    self.lines.extend(['@SP', 'D=M', '@ARG', 'A=D'])
    self.decrementSP()
    # restore THAT of the caller
    # That = *(endFrame - 1)
    self.lines.extend(['@endFrame', 'D=M-1', '@THAT', ''])

class Parser:
  filePath = ''
  commands = []
  comIndex = 0
  ARITHMETIC_COMMANDS = ['add', 'sub', 'neg', 'eq', 'gt', 'lt', 'and', 'or', 'not']

  def __init__(self, filePath):
    self.filePath = filePath
    self.parseFile()

  # removes all comments and white space
  # adds lines to commands list 
  def parseFile(self):
    file = open(self.filePath, 'r')
    content = file.readlines()
    for line in content:
      print('line: ', line)
      if line == '' or line == '\n':
        print('found blank line:', line)
        continue
      if '//' in line:
        command = []
        # write lines where there is an in line comment, e.g. add 5 // some comment 
        for c in line:
          if c == '/':
            break
          command.append(c)
        if len(command) > 0:
          self.commands.append(''.join(command))
        continue
      self.commands.append(line.replace('\n', ''))
    print('all commands:', self.commands)

  def hasMoreCommands(self):
    return self.comIndex < len(self.commands)

  def commandType(self):
    line = self.commands[self.comIndex]
    if re.match(r'^push ', line):
      return CommandTypes.C_PUSH
    if re.match(r'^pop ', line):
      return CommandTypes.C_POP
    if line[0:4] in self.ARITHMETIC_COMMANDS or line[0:3] in self.ARITHMETIC_COMMANDS:
      return CommandTypes.C_ARITHMETIC
    # write goto, if-goto, label, call, function and return
    if re.match(r'^if-goto ', line):
      return CommandTypes.C_IF_GOTO
    if re.match(r'^goto ', line):
      return CommandTypes.C_GOTO
    if re.match(r'^label ', line):
      return CommandTypes.C_LABEL
    if re.match(r'^call ', line):
      return CommandTypes.C_CALL
    if re.match(r'^function ', line):
      return CommandTypes.C_FUNCTION
    if re.match(r'^return ', line):
      return CommandTypes.C_RETURN

  def getCommand(self):
    return self.commands[self.comIndex]
  
  def advance(self):
    if self.hasMoreCommands():
      self.comIndex += 1
  
class Main:
  parser = None

  def __init__(self, filePath):
    self.translate(filePath)

  def translate(self, filePath):
    if os.path.isfile(filePath):
      if filePath.endswith('.vm'):
        print('Translating %s '%(filePath))
        self.translateFile(filePath)
      else:
        print('%s is not a .vm file'%(filePath))
    elif os.path.isdir(filePath):
      for f in os.listdir(filePath):
        fileInDir = join(filePath, f)
        self.translate(fileInDir)
    else:
      print("Please provide a VM file or directory as a parameter")
      print("Provided parameter: ", filePath)

  def translateFile(self, file):
    self.parser = Parser(file)
    self.writer = CodeWriter(file)
    while self.parser.hasMoreCommands():
      comType = self.parser.commandType()
      com = self.parser.getCommand().strip()
      self.writer.addComment(com)
      if comType == CommandTypes.C_PUSH:
        self.writer.writePushLine(com)
      elif comType == CommandTypes.C_ARITHMETIC:
        self.writer.writeArithmeticLine(com)
      elif comType == CommandTypes.C_POP:
        self.writer.writePopLine(com)
      elif comType == CommandTypes.C_LABEL:
        self.writer.writeLabel(com)
      elif comType == CommandTypes.C_GOTO:
        self.writer.writeGoto(com)
      elif comType == CommandTypes.C_IF_GOTO:
        self.writer.writeIfGoto(com)
      elif comType == CommandTypes.C_FUNCTION:
        self.writer.writeFunction(com)
      elif comType == CommandTypes.C_CALL:
        self.writer.writeCall(com)
      self.parser.advance()
    self.writer.writeLines()
 
def main():
  print("sys.argv: ", sys.argv, len(sys.argv) != 2)
  if (len(sys.argv) != 2):
    print("Please provide a VM file or directory as a parameter")
    print("Parameters: ", sys.argv)
    return
  else:
    Main(sys.argv[1])

if __name__ == "__main__":
  main()