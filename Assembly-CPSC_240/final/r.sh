#!/bin/bash

#Author: Antonio Gonzalez
#Program Name: final

rm *.o
rm *.lis
rm *.out

echo "This is final program"
echo "Compiling C++ modules"
g++ -c -Wall -no-pie -m64 -std=c++17 -o driver.o driver.cpp

echo "Assembling modules"
nasm -f elf64 -l display.lis -o display.o display.asm

echo "Linking modules"
g++ -m64  -no-pie -o final.out display.o driver.o -std=c++17

echo "Running program"
./final.out

echo "Bash script file closing"

rm *o 
rm *.lis
rm *.out