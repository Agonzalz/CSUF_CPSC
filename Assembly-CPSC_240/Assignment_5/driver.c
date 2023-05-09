//****************************************************************************************************************************
//Program name: "Sine Function Benchmark Program". This program demonstrates how a benchmark test is used for sine function *
//only accept floating point values, and a number of terms for the Taylor series. Then it calculates the sine of the user input. *
//It also calculates the sin function from the math library in C/C++. After all calculations are done the result and elapsed time *
//in tics are displayed to the user.                                                                                           *
//Copyright (C) 2023 Samuel Vo.                                                                                              *
//                                                                                                                           *
//This file is part of the software program "Sine Function Benchmark Program".                                                *
//"Sine Function Benchmark Program" is free software: you can redistribute it and/or modify it under the terms of the GNU General Public *
//License version 3 as published by the Free Software Foundation.                                                            *
//Sine Function Benchmark Program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the  *
//implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more      *
//details. A copy of the GNU General Public License v3 is available here:  <https:;www.gnu.org/licenses/>.                   *
//****************************************************************************************************************************

//========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
//
//Author information
// Author name: Samuel Vo
// Author email: samvo@csu.fullerton.edu
// Section: 240-7
//
//Program information
//  Program name: Sine Function Benchmark Program
//  Programming languages: One module in C, one module in X86 and one module in C++
//  Date program began: 2023-Apr-26
//  Date of last update: 2023-Apr-29
//  Date comments upgraded: 2023-Apr-28
//  Files in this program: manager.asm, isfloat.cpp, driver.c, r.sh
// Status: Finished. Alot of testing for invalid inputs, and different angle inputs to make sure the program worked properly 
//  and had consistent results. 
//  References consulted: Professor Holliday's lecture, Johnson Tong (SI Session)
//  Future upgrade possible: none
//
//Purpose
//  The purpose of this module is to welcome the user to the Sine Function Benchmark Test, then guides the user to the manager module.
//  After the manager module is completed, the elapse time in tics for the sine function benchmark test is returned to this driver module. 
// 
//
//This file
//  File name: driver.c
//  Language: C
//  Max page width: 132 columns  [132 column width may not be strictly adhered to.]
//  Compile this file: gcc -c -Wall -no-pie -m64 -std=c2x -o driver.o driver.c 
//  Link this program: g++ -m64 -no-pie -o sine.out manager.o driver.o isfloat.o -std=c2x


//=================Begin code area ===============================================================================




#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <math.h>


extern int sine();

int main()
{

    printf("Welcome to Asterix Software Development Corporation \n");
    printf("\n");

    int tics = sine();
    printf("Thank you for using this program. Have a great day. \n");
    printf("\n");
    printf("The driver program received this number %d. A zero will be returned to the OS. Bye. \n", tics);
    printf("\n");

}