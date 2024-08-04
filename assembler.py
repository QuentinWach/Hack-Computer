import re
import sys

class Assembler:
    def __init__(self):
        self.symbol_table = {
            'SP': 0, 'LCL': 1, 'ARG': 2, 'THIS': 3, 'THAT': 4,
            'R0': 0, 'R1': 1, 'R2': 2, 'R3': 3, 'R4': 4, 'R5': 5, 'R6': 6, 'R7': 7,
            'R8': 8, 'R9': 9, 'R10': 10, 'R11': 11, 'R12': 12, 'R13': 13, 'R14': 14, 'R15': 15,
            'SCREEN': 16384, 'KBD': 24576
        }
        self.next_variable_address = 16
        self.comp_table = {
            '0': '0101010', '1': '0111111', '-1': '0111010', 'D': '0001100',
            'A': '0110000', '!D': '0001101', '!A': '0110001', '-D': '0001111',
            '-A': '0110011', 'D+1': '0011111', 'A+1': '0110111', 'D-1': '0001110',
            'A-1': '0110010', 'D+A': '0000010', 'D-A': '0010011', 'A-D': '0000111',
            'D&A': '0000000', 'D|A': '0010101',
            'M': '1110000', '!M': '1110001', '-M': '1110011', 'M+1': '1110111',
            'M-1': '1110010', 'D+M': '1000010', 'D-M': '1010011', 'M-D': '1000111',
            'D&M': '1000000', 'D|M': '1010101'
        }
        self.dest_table = {
            '': '000', 'M': '001', 'D': '010', 'MD': '011',
            'A': '100', 'AM': '101', 'AD': '110', 'AMD': '111'
        }
        self.jump_table = {
            '': '000', 'JGT': '001', 'JEQ': '010', 'JGE': '011',
            'JLT': '100', 'JNE': '101', 'JLE': '110', 'JMP': '111'
        }

    def remove_comments_and_whitespace(self, line):
        line = re.sub(r'//.*$', '', line)  # Remove comments
        line = line.strip()  # Remove leading/trailing whitespace
        return line

    def first_pass(self, assembly_code):
        address = 0
        for line in assembly_code:
            line = self.remove_comments_and_whitespace(line)
            if not line:
                continue
            if line.startswith('(') and line.endswith(')'):
                symbol = line[1:-1]
                self.symbol_table[symbol] = address
            else:
                address += 1

    def get_address(self, symbol):
        if symbol.isdigit():
            return int(symbol)
        if symbol not in self.symbol_table:
            self.symbol_table[symbol] = self.next_variable_address
            self.next_variable_address += 1
        return self.symbol_table[symbol]

    def assemble_a_instruction(self, instruction):
        address = self.get_address(instruction[1:])
        return format(address, '016b')

    def assemble_c_instruction(self, instruction):
        dest, comp_jump = instruction.split('=') if '=' in instruction else ('', instruction)
        comp, jump = comp_jump.split(';') if ';' in comp_jump else (comp_jump, '')
        
        comp_bits = self.comp_table[comp]
        dest_bits = self.dest_table[dest]
        jump_bits = self.jump_table[jump]

        return f'111{comp_bits}{dest_bits}{jump_bits}'

    def second_pass(self, assembly_code):
        binary_code = []
        for line in assembly_code:
            line = self.remove_comments_and_whitespace(line)
            if not line or line.startswith('('):
                continue
            if line.startswith('@'):
                binary_code.append(self.assemble_a_instruction(line))
            else:
                binary_code.append(self.assemble_c_instruction(line))
        return binary_code

    def assemble(self, filename):
        with open(filename, 'r') as file:
            assembly_code = file.readlines()

        self.first_pass(assembly_code)
        binary_code = self.second_pass(assembly_code)

        output_filename = filename.replace('.asm', '.hack')
        with open(output_filename, 'w') as file:
            for instruction in binary_code:
                file.write(f'{instruction}\n')

        print(f'Assembly complete. Output written to {output_filename}')

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Usage: python assembler.py <input_file.asm>")
        sys.exit(1)

    input_file = sys.argv[1]
    assembler = Assembler()
    assembler.assemble(input_file)