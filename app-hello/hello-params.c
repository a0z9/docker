#include<stdio.h>

int main(int argc, char *argv[]){

printf("Hello! Hi! How do you do!!\n");	
/*printf("Params: ");*/

while(argc--) printf("+param %d: %s\n", argc, argv[argc]);


return 0;
}


