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

echo "Assemble input_array.asm"
nasm -f elf64 -l input_array.lis -o input_array.o input_array.asm

echo "Assemble magnitude.asm"
nasm -f elf64 -l magnitude.lis -o magnitude.o magnitude.asm

echo "Assemble append.asm"
nasm -f elf64 -l append.lis -o append.o append.asm

echo "compile display_array.c using gcc compiler standard 2017"
gcc -c -Wall -m64 -no-pie -o display_array.o display_array.c -std=c17

echo "compile main.c using gcc compiler standard 2017"
gcc -c -Wall -m64 -no-pie -o main.o main.c -std=c17

echo "Link object files using the gcc Linker standard 2017"
g++ -m64 -no-pie -o arrays.out manager.o input_array.o magnitude.o append.o display_array.o main.o -std=c17

echo "Run the Arrays Program:\n"
./arrays.out

echo "\nScript file has terminated."

#Clean up after program is run
rm *.o
rm *.out
rm *.lis