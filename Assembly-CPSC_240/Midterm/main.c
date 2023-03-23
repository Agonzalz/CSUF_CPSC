//Program: hamonic sum
//Author: Antonio Gonzalez
//Email: antoniog@csu.fullerton.edu
//Course and Section: CPSC240-3
//Date: Mar 22, 2023

#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include <sys/time.h>
#include <stdlib.h>

extern double manager(); 


int main(int argc, char *argv[])
{

  printf("Welcome to Arrays of Integers.\n Brought to you by Antonio Gonzalez");

  double answer = manager();
  printf("Main received %.5lf and will keep it for a while.\n", answer);
  printf("Main will return 0 to the opearating system. Bye.\n");
  return 0;
}