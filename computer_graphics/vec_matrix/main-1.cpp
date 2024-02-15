//============================================================
// file: main.cpp
//============================================================
#include <iostream>
#include <cstring>
#include <initializer_list>
#include <cassert>
#include "quaternion_T.h"

void test_quaternions() {
    printf("\n====================  TESTING QUATERNIONS  ========================");
    quaternion<double>::run_tests();
    printf("...test_matrices_and_vectors assertions passed");
    printf("====================  FINISHED testing quaternions  ========================");
}

int main(int argc, const char * argv[]) {
//  test_vectors();
//  test_matrices();
//  test_matrices_and_vectors();
  test_quaternions();
  printf("... program completed...\n");
  return 0;
}
