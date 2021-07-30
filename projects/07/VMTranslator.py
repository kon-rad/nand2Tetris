import sys
import os
import re
from os import listdir
from os.path import isfile, join

# todos:
# 1. identify what kind of command it is
# 2. handle push from different memory 
# 3. handle pop to different memory 
# 4. handle arithmetic
# 5. handle equality

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


class CodeWriter:
  filePath = ''
  lines = []

  def __init__(self, filePath):
    self.filePath = filePath
    self.initVariables()

  def initVariables(self):
    initVar = ['// init SP stack pointer variable', '@0', 'D=M', '@sp', 'M=D']
    self.lines.extend(initVar)

  def addNewLine(self, line):
    self.lines.append(line)

  def getStackPointer(self):
    # this command gets the stack pointer and assigns it's value to A register
    # use this before using the stack pointer value
    self.lines.extend(['@sp', 'A=M'])
  
  def incrementStackPointer(self):
    self.lines.extend(['// increment stack pointer','@sp', 'M=M+1'])

  def writeLines(self, lines):
    filePathArr = self.filePath.split('/')
    fileName = filePathArr[len(filePathArr) - 1].split('.')[0]
    destFileName = fileName + ".asm"
    destFilePath = filePathArr[0, -1] + '/' + destFileName;
    file = open(destFilePath, 'w')
    file.writelines(lines)
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
    return self.comIndex < len(self.commands) - 1

  def commandType(self):
    line = self.commands[self.comIndex]
    if re.match(r'^push ', line):
      return CommandTypes.C_PUSH
    if re.match(r'^pop ', line):
      return CommandTypes.C_POP
    if line[0, 4] in self.ARITHMETIC_COMMANDS or line[0, 3] in self.ARITHMETIC_COMMANDS:
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
        self.writer.addNewLine(com)
      self.parser.advance()

 
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