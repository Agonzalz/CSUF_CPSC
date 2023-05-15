//****************************************************************************************************************************
//Program name: "Sleep Time".  Makes outputs some things with a delay.
//Copyright (C) 2023 Micah Baumann.                                                                                          *
//                                                                                                                           *
//This file is part of the software program "Sleep Time".                                                                   *
//Random Products is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License   *
//version 3 as published by the Free Software Foundation.                                                                    *
//Random Products is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied          *
//warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
//A copy of the GNU General Public License v3 is available here:  <https:;www.gnu.org/licenses/>.                            *
//****************************************************************************************************************************

//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
//
//Author information
//  Author name: Micah Baumann
//  Author email: mbaumann@csu.fullerton.edu
//
//Program information
//  Program name: Sleep Time
//  Programming languages: One module in C++ and one module in X86
//  Date program began: 2023 May 5
//  Date of last update: 2023 May 5
//  Files in this program: main.cpp, birthday.asm
//  Status: Finished.
//
//Purpose
//  Does come calculations with with the cpu clock.
//
//This file
//   File name: driver.cpp
//   Language: C++
//   Max page width: 132 columns
//   Compile: g++ -c -m64 -Wall -std=c++20 -no-pie -o main.o main.cpp
//   Link: g++ -m64 -std=c++20 -no-pie -o final-sleep-time.out main.o birthday.o
//   Optimal print specification: 132 columns width, 7 points, monospace, 8½x11 paper
//
//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
//
//
//===== Begin code area ===========================================================================================================

#include <iostream>
#include <unistd.h>

using namespace std;

extern "C" long int birthday();

int main()
{
    cout << "Welcome to Daylight Sleeping Time brought to you by Micah Baumann.\n\n";
    
    long int tics = birthday();

    cout << "The main received this number  " << tics << " and will keep it.\n\n"
    << "A zero will be sent to the Operating System.  Bye.\n\n";
    
    return 0;
}