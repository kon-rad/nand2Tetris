import sys
import os
import re
from os import listdir
from os.path import isfile, join

# todos:
# find out why lt command is failing

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

class MemorySegments:
  CONSTANT = 'constant'

class CodeWriter:
  filePath = ''
  lines = []
  labelCount = 0

  def __init__(self, filePath):
    self.filePath = filePath
    self.initVariables()

  def initVariables(self):
    initVar = ['// init sp stack pointer variable to value that is in RAM[0]', '@0', 'D=M', '@SP', 'M=D']
    self.lines.extend(initVar)

  def addNewLine(self, line):
    self.lines.append(line)

  def addPushLine(self, line):
    lineArray = line.split(' ')
    if len(lineArray) != 3:
      raise Exception("Push command has the wrong number of arguments: ", line)
    memorySegment = lineArray[1]
    pushVal = lineArray[2]
    if memorySegment == MemorySegments.CONSTANT:
      self.lines.extend([f"@{pushVal}", 'D=A'])
    self.assignDToSP()
    self.incrementSP()

  def addArithmeticLine(self, line):
    lineArray = line.split(' ')
    print("addArithmeticLine", line)
    self.decrementSPAndRemove()
    self.assignSPToD()
    self.decrementSPAndRemove()
    # ARITHMETIC_COMMANDS = ['add', 'sub', 'neg', 'eq', 'gt', 'lt', 'and', 'or', 'not']
    if line == 'add':
      self.handleAdd()
    if line == 'sub':
      self.handleSub()
    elif line == 'neq':
      self.handleNeg()
    elif line == 'eq':
      self.handleEq()
    elif line == 'lt':
      self.handleLt()
    elif line == 'gt':
      self.handleGt()
    elif line == 'and':
      self.handleAnd()
    elif line == 'or':
      self.handleOr()
    elif line == 'not':
      self.handleNot()
    self.incrementSP()

  def handleAdd(self):
    self.lines.extend(['// add D to SP', '@SP', 'A=M', 'M=D+M'])

  def handleSub(self):
    self.lines.extend(['// subtract D from SP', '@SP', 'A=M', 'M=M-D'])

  def handleNeg(self):
    # subtract D from SP and assign to D
    self.lines.extend(['// is SP not equal to D', '@SP', 'A=M', 'D=M-D'])
    # jump if D is not zero
    self.lines.extend([f'@IS_TRUE_{self.labelCount}', 'D;JNE'])
    # otherwise set it to false
    self.lines.extend(['M=0', f'@IS_FALSE_{self.labelCount}', '0:JMP'])
    # set as true
    self.lines.extend([f'(IS_TRUE_{self.labelCount}', 'M=-1', f'IS_FALSE_{self.labelCount}'])

  def handleEq(self):
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

  def handleLt(self):
    # assuming that D is already loaded with value 1
    # subtract M from D and set to D
    self.lines.extend(['// SP minus D', '@SP', 'A=M', 'D=M-D' ])
    # JGE -> jump if answer (D) is >= 0 jump
    # todo: bug here
    self.lines.extend([f'@IS_FALSE_{self.labelCount}', 'D;JGE'])
    # otherwise it is true that SP is less than D - then continue
    self.lines.extend(['@SP', 'A=M', 'M=-1', f'@IS_TRUE_{self.labelCount}', '0;JMP'])
    # handle if answer is false
    self.lines.extend([f'(IS_FALSE_{self.labelCount})', '@SP', 'A=M', 'M=0'])
    # is false - continues
    self.lines.extend([f'(IS_TRUE_{self.labelCount})'])
    self.labelCount += 1

  def handleGt(self):
    # assuming that D is already loaded with value 1
    # subtract M from D and set to D
    self.lines.extend(['// SP minus D', '@SP', 'A=M', 'D=M-D' ])
    # jump if answer (D) is <= 0 (JLE)
    self.lines.extend([f'@IS_FALSE_{self.labelCount}', 'D;JLE'])
    # otherwise it is true that SP is less than D - then continue
    self.lines.extend(['@SP', 'A=M', 'M=-1', f'@IS_TRUE_{self.labelCount}', '0;JMP'])
    # handle if answer is false
    self.lines.extend([f'(IS_FALSE_{self.labelCount})', '@SP', 'A=M', 'M=0'])
    # is false - continues
    self.lines.extend([f'(IS_TRUE_{self.labelCount})'])
    self.labelCount += 1

  def handleAnd(self):
    self.lines.extend(['// handle D and SP', '@SP', 'A=M', 'M=D&M'])

  def handleOr(self):
    self.lines.extend(['// handle D and SP', '@SP', 'A=M', 'M=D|M'])

  def handleNot(self):
    self.lines.extend(['// handle not D', '@SP', 'A=M', 'M=!D'])
  
  def decrementSPAndRemove(self):
    self.lines.extend(['// decrement SP and remove', '@SP', 'A=M', 'M=0', '@SP', 'M=M-1'])

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
        # handle lines where there is an in line comment, e.g. add 5 // some comment 
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

  def getCommand(self):
    return self.commands[self.comIndex]
  
  def advance(self):
    if self.hasMoreCommands():
      self.comIndex += 1

  def arg1(self):
    # return argument 1
    print('arg1')

  def arg2(self):
    # return argument 2
    print('arg2')
  
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
      com = self.parser.getCommand()
      self.writer.addComment(com)
      if comType == CommandTypes.C_PUSH:
        self.writer.addPushLine(com)
      elif comType == CommandTypes.C_ARITHMETIC:
        self.writer.addArithmeticLine(com)
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