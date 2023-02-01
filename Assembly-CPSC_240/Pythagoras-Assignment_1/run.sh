#!/bin/bash

#Author: Antonio Gonzalez
#Program Name: Pythagoras 

rm *.o
rm *.lis
rm *.out

echo "This is program pythagoras"
echo "Compiling C++ modules"
g++ -c -Wall -no-pie -m64 -std=c++17 -o driver.o driver.cpp

echo "Assembling modules"
nasm -f elf64 -l pythagoras.lis -o pythagoras.o pythagoras.asm

echo "Linking modules"
g++ -m64  -no-pie -o pyth.out pythagoras.o driver.o -std=c++17

echo "Running program"
./pyth.out

echo "Bash script file closing"

rm *o 
rm *.lis
rm *.out