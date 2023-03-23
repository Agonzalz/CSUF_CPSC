//Program: hamonic sum
//Author: Antonio Gonzalez
//Email: antoniog@csu.fullerton.edu
//Course and Section: CPSC240-3
//Date: Mar 22, 2023

#include <stdio.h>

extern void display_array(double arr[], int arr_size);

void display_array(double arr[], int arr_size){
    for (int i = 0; i < arr_size; i++)
    {
        printf("%.5lf ", arr[i]);
    }
    printf("\n");
}