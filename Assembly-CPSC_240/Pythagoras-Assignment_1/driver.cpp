//****************************************************************************************************************************
//Program name: "Pythagoras".  This program takes in the user input of two sides of a right triangle in float and calculates 
//the hypotenuse. Copyright (C) 2023 Antonio Gonzalez.                                                                       *
//                                                                                                                           *
//This file is part of the software program "Pythagoras".                                                                     *
//Pythagoras is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License     *
//version 3 as published by the Free Software Foundation.                                                                    *
//Pythagoras is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied            *
//warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
//A copy of the GNU General Public License v3 is available here:  <https:;www.gnu.org/licenses/>.                            *
//****************************************************************************************************************************

//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
//
//Author information
//  Author name: Antonio Gonzalez
//  Author email: antoniog@csu.fullerton.edu
//
//Program information
//  Program name: Pythagoras
//  Programming languages: One modules in C++ and one module in X86
//  Date program began: 2023 Jan 23
//  Date of last update: 2023 Feb 3
//  Files in this program: driver.cpp, pythagoras.asm
//  Status: Finished.
//
//Purpose
//  Calculate the hypotenuse of a right trinagle in x86
//
//This file
//   File name: driver.cpp
//   Language: C++
//   Max page width: 132 columns
//   Compile: gcc -c -Wall -m64 -no-pie -o manage-floats.o manage-floats.c -std=c17
//   Link: gcc -m64 -no-pie -o three-numbers.out manage-floats.o float-input-output.o -std=c17
//   Optimal print specification: 132 columns width, 7 points, monospace, 8½x11 paper
//
//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
//
//
//===== Begin code area ===========================================================================================================

#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include <sys/time.h>
#include <stdlib.h>
#include <iostream>

extern "C" double pythagoras();

int main(int argc, char *argv[]){

    std::cout << "Welcome to Pythagoras Math Lab programmed by Antonio Gonzalez\n"
              <<"Please contact me at antoniog@csu.fullerton.edu if you need assistance" << std::endl;
    
    double hypotenuse = pythagoras();

    std::cout << "The main file received this number: " << hypotenuse<< ", and will keep it for now.\n"
              << "We hoped you enjoyed your right angles. Have a good day. A zero will be sent to your operating system.\n";
}
            