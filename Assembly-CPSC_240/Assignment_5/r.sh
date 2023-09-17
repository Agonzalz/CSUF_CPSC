#!/bin/bash

#Author: Samuel Vo
#Program name: Sine Function Benchmark Program

rm *.o
rm *.lis
rm *.out

echo "This is program <Sine Function Benchmark Program>"

echo "Compile the C module driver.c"
gcc -c -Wall -no-pie -m64 -std=c2x -o driver.o driver.c

echo "Compile the C++ module isfloat.cpp"
g++ -c -Wall -no-pie -m64 -std=c++2a -o isfloat.o isfloat.cpp

echo "Assemble the module manager.asm"
nasm -f elf64 -l manager.lis -o manager.o manager.asm 

echo "Link the three object files already created"
g++ -m64 -no-pie -o sine.out manager.o driver.o isfloat.o -std=c2x

echo "Run the program Sine Function Benchmark Program"
./sine.out

echo "The bash script file is now closing."

rm *.o
rm *.lis
rm *.out