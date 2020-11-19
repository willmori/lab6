#include "DecodeCode.h"
#include <string>
#include <iostream>
#include <sstream>


int binaryToDecimal(int n);

mipsinstruction decode(int value)
{
	mipsinstruction instr;

	std::string instruction = std::to_string(value);

	stringstream temp_funct(instruction.substr(0, 6));
	int functBinary = 0;
	temp_funct >> functBinary;
	int functDecimal = binaryToDecimal(functBinary);

	stringstream temp_immediate(instruction.substr(1, 16));
	int immediateBinary = 0;
	temp_immediate >> immediateBinary;
	int immediateDecimal = binaryToDecimal(immediateBinary);
	if ()

	stringstream temp_rd(instruction.substr(11, 5));
	int rdBinary = 0;
	temp_rd >> rdBinary;
	int rdDecimal = binaryToDecimal(rdBinary);

	stringstream temp_rt(instruction.substr(16, 5));
	int rtBinary = 0;
	temp_rt >> rtBinary;
	int rtDecimal = binaryToDecimal(rtBinary);

	stringstream temp_rs(instruction.substr(21, 5));
	int rsBinary = 0;
	temp_rs >> rsBinary;
	int rsDecimal = binaryToDecimal(rsBinary);

	stringstream temp_opcode(instruction.substr(26, 6));
	int opcodeBinary = 0;
	temp_opcode >> opcodeBinary;
	int opcodeDecimal = binaryToDecimal(opcodeBinary);

	// TODO: fill in the fields
	instr.funct = 
	instr.immediate = -10;
	instr.rd = 0;
	instr.rt = 5;
	instr.rs = 3;
	instr.opcode = 25;

	return instr;
}


int binaryToDecimal(int n) {
	int num = n;
	int dec_value = 0;

	int base = 1;

	int temp = num;

	while (temp == true) {
		int last_digit = temp % 10;
		temp = temp/10;
		dec_value += last_digit * base;
		base = base * 2;
	}

	return dec_value;
}