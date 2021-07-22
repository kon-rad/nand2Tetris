import sys
import os
import re
from os import listdir
from os.path import isfile, join

class Parser:
  filePath = ''
  commands = []
  comIndex = 0
  C_ARITHMETIC = 'C_ARITHMETIC'
  C_PUSH = 'C_PUSH'
  C_POP = 'C_POP'
  C_LABEL = 'C_LABEL'
  C_GOTO = 'C_GOTO'
  C_IF = 'C_IF'
  C_FUNCTION = 'C_FUNCTION'
  C_RETURN = 'C_RETURN'
  C_CALL = 'C_CALL'
  ARITHMETIC_COMMANDS = ['add', 'sub', 'neg']

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
      return self.C_PUSH
    if re.match(r'^pop ', line):
      return self.C_POP
    if line[0, 4] in self.ARITHMETIC_COMMANDS:
      return self.C_ARITHMETIC

  def writeLines(self ,lines, name):
    file = open(name, 'w')
    file.writelines(lines)
    file.close()



def main():
    print("args: ", sys.argv)
    if len(sys.argv) != 2:
      print("Provide the path to the file or directory to translate as a single argument")
      return
    
    argument = sys.argv[1]
    
    if os.path.isfile(argument):
      print("file")
      parser = Parser(argument)
    elif os.path.isdir(argument):
      print("its a dir")
      for f in listdir(argument):
        filePath = join(argument, f)
        if isfile(filePath):
          parser = Parser(filePath)

    else:
      print("Please enter a file or directory path as an argument")

if __name__ == "__main__":
    main()