#!/bin/bash

#Author: Samuel Vo
#Program name:  Square Root Benchmark Program

rm *.o
rm *.lis
rm *.out

echo "This is program <Square Root Benchmark Program>"

echo "Compile the C module main.c"
gcc -c -Wall -no-pie -m64 -std=c2x -o main.o main.c

echo "Assemble the module manager.asm"
nasm -f elf64 -l manager.lis -o manager.o manager.asm 

echo "Assemble the module getradicand.asm"
nasm -f elf64 -l getradicand.lis -o getradicand.o getradicand.asm 

echo "Link the six object files already created"
g++ -m64 -no-pie -o freq.out manager.o main.o getradicand.o -std=c2x

echo "Run the program Square Root Benchmark Program"
./freq.out

echo "The bash script file is now closing."

rm *.o
rm *.lis
rm *.out