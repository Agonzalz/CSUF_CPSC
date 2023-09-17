#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include <sys/time.h>
#include <stdlib.h>

extern double findName();  // assembly module that will direct calls to other functions
                          // that will fill an array and add its contents


int main(int argc, char *argv[])
{

  printf("Welcome to Random Products, LLC.This software is maintained by Alfred Findelstein");

  double answer = findName();  // manager returns the magnitude of the appended arrays
  printf("Main received %.10lf and will keep it for future use.\n", answer);
  printf("Main will return a 0 to the opearating system. Bye.\n");
}