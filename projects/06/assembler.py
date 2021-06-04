
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
    'M+A': ['0','0','0','0','1','0'],
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

  def get_comp(self, comp, cinst):
        if comp in self.computeFields:
          cinst = cinst[0:4] + self.computeFields[comp] + cinst[10:]
        return cinst

  def assemble(self, name):
    lines = self.read_file(name)
    count = 0
    assembled = []
    ml = 0
    print(lines)
    # 012 3  4 5  6  7  8  9  10 11 12 13 14 15
    # 111 a c1 c2 c3 c4 c5 c6 d1 d2 d3 j1 j2 j3
    for line in lines:
      if len(line) <= 1 or line[0] == '/':
        continue
      line = line.strip('\n')
      count += 1
      print('line: ', line[len(line) - 1])
      compProcessed = False
      ainst = ['0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0']
      cinst = ['1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0']
      if line[0] == '@':
        ml = '{0:016b}'.format(int(line[1:]))
        assembled.append(ml + '\n')
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
        print('cinst: ', cinst, cinstArr)
      if line.find(';') != -1:
        jumpArr = line.split(";")
        jump = jumpArr[1]
        if jump and jump in self.jumpMnemonic:
          cinst = cinst[0:12] + self.jumpMnemonic[jump]
        if not compProcessed:
          dest = jumpArr[0]
      assembled.append(''.join(cinst) + '\n')
    self.write_lines(assembled, "Add.hack")

asmb = Assembler()

asmb.assemble("./add/Add.asm")

