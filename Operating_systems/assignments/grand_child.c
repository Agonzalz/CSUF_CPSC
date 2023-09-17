#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <string.h>

int main() {
    pid_t id;
    pid_t child_id;

    id = fork();
    if (id < 0) {
		fprintf(stderr, "Fork Failed");
		exit(-1);
    }
    if (id == 0) {
        fprintf(stderr, "This is child process %d \n", getpid());
        child_id = fork();
        if (child_id < 0) {
		    fprintf(stderr, "Fork Failed");
		    exit(-1);
         }
        if (child_id == 0) {
            execlp("/snap/bin/firefox","firefox", NULL);
        } else {
            printf("child is waiting\n"); 
            wait(NULL);
        }
    } else {
        fprintf(stderr, "This is parent process %d \n", getpid());
        printf("parent is waiting\n");
        wait (NULL);
    }
    return 0;
}