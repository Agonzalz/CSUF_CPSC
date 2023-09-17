//****************************************************************************************************************************
//Program name: "Array Magnitude".                                                                                           *
// This program will allow a user to input float numbers in two arrays of size 50, and display the contents and maggnitude of*
// both arrays. It will also append both arrays into one, display the contents and calculate the new magnitude.              *
// Copyright (C) 2023 Antonio Gonzalez.                                                                                      *
//                                                                                                                           *
//This file is part of the software program "Array Magnitude".                                                               *
//This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
//version 3 as published by the Free Software Foundation.                                                                    *
//This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         *
//warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
//A copy of the GNU General Public License v3 is available here:  <https:;www.gnu.org/licenses/>.                            *
//****************************************************************************************************************************




//========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
//
//Author information
//  Author name: Antonio Gonzalez
//  Author email: antoniog@csu.fullerton.edu
//
//Program information
//  Program name: Array Magnitude
//  Programming languages: x86, C, bash
//  Date program began: 2023 February 14
//  Date of last update: 2023 February 21
//  Date of reorganization of comments: 2023 February 21
//  Files in this program: manager.asm, main.c, display_array.cc, magnitude.asm, input_array.asm, append.asm, run.sh
//  Status: Finished
//  References Consulted: Johnson SI, x86-64 Assembly Language Programming by Ed Jorgensen
//
//This file
//   File name: display_array.c
//   Language: C
//   Max page width: 132 columns
//   Assemble: gcc -c -Wall -m64 -no-pie -o display_array.o display_array.c -std=c17
//   Link: g++ -m64 -no-pie -o arrays.out manager.o input_array.o magnitude.o append.o display_array.o main.o -std=c17
//   Purpose: This wil be called by manager module to display the array that is passed through this module.
//=======================================================================================================

#include <stdio.h>

extern void display_array(double arr[], int arr_size);

void display_array(double arr[], int arr_size){
    for (int i = 0; i < arr_size; i++)
    {
        printf("%.5lf ", arr[i]);
    }
    printf("\n");
}