#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include <sys/time.h>
#include <stdlib.h>

extern double manager();  // assembly module that will direct calls to other functions
                          // that will fill an array and add its contents


int main(int argc, char *argv[])
{

  double nanoseconds = manager();  // manager returns the magnitude of the appended arrays
  printf("The Main function has received %.5lf and will keep it for future reference.\n", nanoseconds);
  printf("Main will return a zero to the opearating system. Bye.\n");
}