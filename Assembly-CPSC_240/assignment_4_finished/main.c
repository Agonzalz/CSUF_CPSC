//****************************************************************************************************************************
//Program name:"Square Root Benchmark Program". This program takes the square root of the radicand value and does a benchmark test *
//during the process to look for the one time of a square root computation in tics, and the nanoseconds conversion. It will ask *
//for user to input the max clock speed of their device, and it displays information like CPU name of the device.            *                       
//Copyright (C) 2023 Samuel Vo.                                                                                              *
//                                                                                                                           *
//This file is part of the software program "Square Root Benchmark Program".                                                  *
//Square Root Benchmark Program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public *
//License version 3 as published by the Free Software Foundation.                                                            *
//Square Root Benchmark Program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the *
//implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more      *
//details. A copy of the GNU General Public License v3 is available here:  <https:;www.gnu.org/licenses/>.                   *
//****************************************************************************************************************************
//========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
//
//Author information
//  Author name: Samuel Vo
//  Author email: samvo@csu.fullerton.edu
//  Section: 240-07
//
//Program information
//  Program name: Square Root Benchmark Program
//  Programming languages: One modules in C and two modules in X86
//  Date program began: 2023-Apr-10
//  Date of last update: 2023-Apr-15
//  Date comments upgraded: 2023-Mar-12
//  Files in this program: main.c, manager.asm, r.sh, getradicand.asm
//  Status: Finished. Alot of testing different for max clock speeds to make sure it runs and gives a reasonable output. 
//  References consulted: Professor Holliday's lecture, Johnson Tong (SI Session)
//  Future upgrade possible: none
//
//Purpose
//  The purpose of this module is to manage the other modules in the program, and call them to get information or print out
//  important information about the program. In this case we use it for making calculations for the square root of a radicand 
//  after getting the radicand from the getradicand module through user input. Then the program gets the tics before and after 
//  running the square root function. The information is used to run a benchmark test on the square root function. 
//
//This file
//  File name: main.c
//  Language: C
//  Max page width: 132 columns  [132 column width may not be strictly adhered to.]
//  Compile this file: gcc -c -Wall -no-pie -m64 -std=c2x -o main.o main.c
//  Link this program: g++ -m64 -no-pie -o frequency.out main.o manager.o getradicand.o -std=c2x 

//=================Begin code area ===============================================================================


#include <stdlib.h>
#include <stdio.h>

extern double square_root();

int main()
{
    double answer;
    answer = square_root();
    printf("The main function has received this number %.5lf and will keep it for future reference. \n", answer);
    printf("\n");
    printf("The main function will return a zero to the operating system.");
    printf("\n");
    printf("\n");
}