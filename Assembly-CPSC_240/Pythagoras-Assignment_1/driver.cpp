

#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include <sys/time.h>
#include <stdlib.h>
#include <iostream>

extern "C" double pythagoras();

int main(int argc, char *argv[]){

    std::cout << "Welcome to Pythagoras Math Lab programmed by Antonio Gonzalez\n"
              <<"Please contact me at email if you need assistance" << std::endl;
    
    double hypotenuse = pythagoras();

    std::cout << "The main file received this number:" << hypotenuse<< ", and will keep it for now.\n"
              << "We hoped you enjoyed your right angles. Have a good day. A zero will be sent to your operating system.\n";
}
            