
#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include <sys/time.h>
#include <stdlib.h>

extern double manager();  // assembly module that will direct calls to other functions
                          // that will fill an array and add its contents


int main(int argc, char *argv[])
{
  printf("Welcome to Arrays of Integers \n Brought to you by Antonio Gonzalez\n");

  double answer = control();  // the control module will return the sum of the array contents
  printf("The main has received this number %.10lf and will keep it.\n", answer);
  printf("Thank you for using High Speed Array Software.\n"
          "A zero will be returned to the operating system.\n"
          "Have a good day!\n");
}