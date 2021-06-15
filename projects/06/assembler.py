import numbers

class Assembler:

  def read_file(self, name):
    file = open(name, 'r')
    return file.readlines()

  def write_lines(self ,lines, name):
    file = open(name, 'w')
    file.writelines(lines)
    file.close()

  computeFields = {
    '0': ['1','0','1','0','1','0'],
    '1': ['1','1','1','1','1','1'],
    '-1': ['1','1','1','0','1','0'],
    'D': ['0','0','1','1','0','0'],
    'A': ['1','1','0','0','0','0'],
    'M': ['1','1','0','0','0','0'],
    '!D': ['0','0','1','1','0','1'],
    '!A': ['1','1','0','0','0','1'],
    '!M': ['1','1','0','0','0','1'],
    '-D': ['0','0','1','1','1','1'],
    '-A': ['1','1','0','0','1','1'],
    '-M': ['1','1','0','0','1','1'],
    'D+1': ['0','1','1','1','1','1'],
    'A+1': ['1','1','0','1','1','1'],
    'M+1': ['1','1','0','1','1','1'],
    'D-1': ['0','0','1','1','1','0'],
    'A-1': ['1','1','0','0','1','0'],
    'M-1': ['1','1','0','0','1','0'],
    'D+A': ['0','0','0','0','1','0'],
    'D+M': ['0','0','0','0','1','0'],
    'D-A': ['0','1','0','0','1','1'],
    'D-M': ['0','1','0','0','1','1'],
    'A-D': ['0','0','0','1','1','1'],
    'M-D': ['0','0','0','1','1','1'],
    'D&A': ['0','0','0','0','0','0'],
    'D&M': ['0','0','0','0','0','0'],
    'D|A': ['0','1','0','1','0','1'],
    'D|M': ['0','1','0','1','0','1'],
  }
  jumpMnemonic = {
    'JGT': ['0','0','1'],
    'JEQ': ['0','1','0'],
    'JGE': ['0','1','1'],
    'JLT': ['1','0','0'],
    'JNE': ['1','0','1'],
    'JLE': ['1','1','0'],
    'JMP': ['1','1','1'],
  }
  predefined = {
    'SP': '0000000000000000',
    'LCL': '0000000000000001',
    'ARG': '0000000000000010',
    'THIS': '0000000000000011',
    'THAT': '0000000000000100',
    'SCREEN': '0100000000000000',
    'KBD': '0110000000000000',
  }
  sym_dict = {}
  var_count = 16

  def get_comp(self, comp, cinst):
        if comp in self.computeFields:
          cinst = cinst[0:4] + self.computeFields[comp] + cinst[10:]
        return cinst

  def ignore_line(self, line):
      if len(line) <= 1 or line[0] == '/':
        return True
      return False

  def get_ainst(self, lineVal):
      if lineVal in self.sym_dict:
        aVal = self.sym_dict[lineVal]
        ainst = '{0:016b}'.format(int(aVal))
        return ainst
      if lineVal in self.predefined:
        return self.predefined[lineVal]
      if lineVal[0] == 'R':
        ramNum = int(lineVal[1:])
        if isinstance(ramNum, numbers.Number):
          ainst = '{0:016b}'.format(int(ramNum))
          return ainst
      if lineVal.isnumeric():
        ainstNum = int(lineVal)
        ainst = '{0:016b}'.format(int(lineVal))
        return ainst
      self.sym_dict[lineVal] = self.var_count
      ainst = '{0:016b}'.format(self.var_count)
      self.var_count += 1
      return ainst

  def assemble(self, name):
    nameArr = name.split("/")
    fileNameWithExtension = nameArr[len(nameArr) - 1]
    destFileName = fileNameWithExtension.split(".")[0] + ".hack"
    lines = self.read_file(name)
    count = 0
    assembled = []
    # 012 3  4 5  6  7  8  9  10 11 12 13 14 15
    # 111 a c1 c2 c3 c4 c5 c6 d1 d2 d3 j1 j2 j3

    # first pass - get all labels
    for line in lines:
      line = line.strip()
      if self.ignore_line(line):
        continue;
      if line[0] == '(':
        symbol = line[1:-1]
        self.sym_dict[symbol] = count
        continue
      count += 1

    # second pass
    count = 0
    for line in lines:
      line = line.strip()
      if self.ignore_line(line):
        continue
      line = line.strip('\n')
      line = line.replace(' ', '')
      if line[0] == '(':
        continue
      parsedLineArr = []
      for c in line:
        if c == '/':
          break
        parsedLineArr.append(c)
      line = ''.join(parsedLineArr)
      count += 1
      compProcessed = False
      cinst = ['1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0']
      if line[0] == '@':
        ainst = self.get_ainst(line[1:])
        assembled.append(ainst + '\n')
        continue
      if line.find('=') != -1:
        cinstArr = line.split("=")
        dest = cinstArr[0]
        if 'D' in dest:
          cinst[11] = '1'
        if 'A' in dest:
          cinst[10] = '1'
        if 'M' in dest:
          cinst[12] = '1'
        comp = cinstArr[1]
        compProcessed = True
        cinst = self.get_comp(comp, cinst)
        if 'M' in comp:
          cinst[3] = '1'
      if line.find(';') != -1:
        jumpArr = line.split(";")
        jump = jumpArr[1]
        if jump and jump in self.jumpMnemonic:
          cinst = cinst[0:13] + self.jumpMnemonic[jump]
        if not compProcessed:
          comp = jumpArr[0]
          cinst = self.get_comp(comp, cinst)
      assembled.append(''.join(cinst) + '\n')
    self.write_lines(assembled, destFileName)

asmb = Assembler()

# asmb.assemble("./add/Add.asm")
# asmb.assemble("./max/Max.asm")
# asmb.assemble("./pong/PongL.asm")
# asmb.assemble("./pong/Pong.asm")
asmb.assemble("./rect/Rect.asm")

