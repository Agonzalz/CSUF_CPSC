//****************************************************************************************************************************
//Program name: "Pythagoras".  This program takes in the user input of two sides of a right triangle in float and calculates 
//the hypotenuse. Copyright (C) 2023 Antonio Gonzalez.                                                                       *
//                                                                                                                           *
//This file is part of the software program "Pythagoras".                                                                    *
//Pythagoras is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License    *
//version 3 as published by the Free Software Foundation.                                                                    *
//Pythagoras is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied           *
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
//  Date of last update: 2023 Feb 4
//  Files in this program: driver.cpp, pythagoras.asm, run.sh
//  Status: Finished.
//
//Purpose
//  Calculate the hypotenuse of a right trinagle in x86
//
//This file
//   File name: driver.cpp
//   Language: C++
//   Max page width: 132 columns
//   Compile: g++ -c -Wall -no-pie -m64 -std=c++17 -o driver.o driver.cpp
//   Link: g++ -m64  -no-pie -o pyth.out pythagoras.o driver.o -std=c++17
//
//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
//
//
//===== Begin code area ===========================================================================================================


#include <iostream>
#include <cstdio>
#include <iomanip>

extern "C" double pythagoras();

int main(int argc, char *argv[]){

    std::cout << "Welcome to Pythagoras Math Lab programmed by Antonio Gonzalez\n"
              <<"Please contact me at antoniog@csu.fullerton.edu if you need assistance\n" << std::endl;
    
    double hypotenuse = pythagoras();

    std::cout << "The main file received this number: " << std::setprecision(12) << hypotenuse
              << ", and will keep it for now.\n"
              << "We hoped you enjoyed your right angles. Have a good day. A zero will be sent to your operating system.\n";

    return 0;
}
            