#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <string.h>

int main() {
    pid_t id;
    pid_t child_id;

    //parent and child fork starts here
    id = fork();
    //error handling
    if (id < 0) {
		fprintf(stderr, "Fork Failed");
		exit(-1);
    }
    if (id > 0) {
        fprintf(stderr, "This is parent process %d \n", getpid());
    } else {
        fprintf(stderr, "This is child process %d \n", getpid());
        
        //child and grandchild fork starts here
        child_id = fork();
        //error handling
        if (child_id < 0) {
		    fprintf(stderr, "Fork Failed");
		    exit(-1);
         }
        if (child_id == 0) {
            fprintf(stderr, "This is grandchild process %d \n", getpid());
            fprintf(stderr, "grandchild will open firefox\n");
            execlp("firefox","firefox", NULL);
        }
    }
    fprintf(stderr, "process %d is waiting\n", getpid());
    wait(NULL);
    return 0;
}