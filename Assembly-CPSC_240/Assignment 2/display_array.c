

#include <iostream>

extern "C" void Display(double arr[], int arr_size)

void Display(double arr[], int arr_size){
    for (int i = 0; i < arr_size, i++)
    {
        printf("%.10lf\n", arr[i]);
    }
}