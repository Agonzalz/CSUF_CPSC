#!/bin/bash

# Program: Sleep Time
# Author: Micah Baumann

# Clear any previously compiled outputs
rm *.lis
rm *.o
rm *.out

echo "Assemble birthday.asm"
nasm -f elf64 -l birthday.lis -o birthday.o birthday.asm

echo "compile main.cpp using g++ compiler standard 2020"
g++ -c -m64 -Wall -std=c++2a -no-pie -o main.o main.cpp

echo "Link object files using the g++ Linker standard 2020"
g++ -m64 -std=c++2a -no-pie -o final-sleep-time.out main.o birthday.o

echo "Run the Sleep Time Program:"
./final-sleep-time.out

# For cleaner working directory, you can:
rm *.lis
rm *.o
rm *.out

echo "Script file terminated."