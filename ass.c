#include <stdio.h>
#include <stdlib.h>


int main(int argc, char *argv[]){

    int n=0;
    printf("\033[43;30m\n");
    for(n=0;n<argc;n++)printf("%s\n",argv[n]);
    return 0;
}