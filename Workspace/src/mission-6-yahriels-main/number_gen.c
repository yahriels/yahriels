/* 
AerE 361 Mission 6
Exercise 1
Number Generator
YOUR NAME HERE
*/

/*
Includes
--------------------------------------
*/

#include<stdio.h>
#include<string.h>

int main(int argc, char *argv[]){
//----------------------------------------------------------------
// Below here define your variables
// ---------------------------------------------------------------
	

//----------------------------------------------------------------
// Do not change anything below.
// ---------------------------------------------------------------
	
	if ( argc > 1){
		strcpy(filename,argv[1]);
	}
	else{
		printf("Please let me know the filename: ");
  	fgets(filename,100,stdin);
  	len = strlen(filename);
  	filename[len-1] = 0;

	}
//----------------------------------------------------------------
// Insert your code here
// ---------------------------------------------------------------
  
 
  return 0;
}
