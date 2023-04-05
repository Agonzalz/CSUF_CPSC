#!/bin/bash

#Program: Array Magnitude
#Author: Antonio Gonzalez

#Purpose: script file to run the program files together.
#Clear any previously compiled outputs
rm *.o
rm *.out
rm *.lis

echo "Assemble manager.asm"
nasm -f elf64 -l manager.lis -o manager.o manager.asm

echo "compile main.c using gcc compiler standard 2017"
gcc -c -Wall -m64 -no-pie -o main.o main.c -std=c17

echo "Link object files using the gcc Linker standard 2017"
g++ -m64 -no-pie -o benchmark.out manager.o main.o -std=c17

echo "Run the Arrays Program:\n"
./benchmark.out

echo "\nScript file has terminated."

#Clean up after program is run
rm *.o
rm *.out
rm *.lis
