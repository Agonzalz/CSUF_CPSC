#!/bin/bash

#Program: hamonic sum
#Author: Antonio Gonzalez
#Email: antoniog@csu.fullerton.edu
#Course and Section: CPSC240-3
#Date: Mar 22, 2023

#Purpose: script file to run the program files together.
#Clear any previously compiled outputs
rm *.o
rm *.out
rm *.lis

echo "Assemble manager.asm"
nasm -f elf64 -l manager.lis -o manager.o manager.asm

echo "Assemble input_array.asm"
nasm -f elf64 -l input_array.lis -o input_array.o input_array.asm

echo "compile display_array.c using gcc compiler standard 2017"
gcc -c -Wall -m64 -no-pie -o display_array.o display_array.c -std=c17

echo "compile main.c using gcc compiler standard 2017"
gcc -c -Wall -m64 -no-pie -o main.o main.c -std=c17

echo "Link object files using the gcc Linker standard 2017"
gcc -m64 -no-pie -o harmonic.out manager.o input_array.o display_array.o main.o -std=c17

echo "Run the Arrays Program:\n"
./harmonic.out

echo "\nScript file has terminated."

#Clean up after program is run
rm *.o
rm *.out
rm *.lis