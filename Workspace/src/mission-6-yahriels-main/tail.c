/* 
AerE 361 Mission 6
Exercise 3
Tail Program
YOUR NAME HERE
*/

/*
Includes
--------------------------------------
*/

#include<stdio.h>
#include<stdlib.h>
#include<string.h>

/*This program prompts the user for file name, tries to open it, and prints the last three lines to screen*/

/*begin main function*/
int main(int argc, char *argv[]){
//----------------------------------------------------------------
// Below here define your variables
// ---------------------------------------------------------------
	

//----------------------------------------------------------------
// Do not change anything below.
// ---------------------------------------------------------------
	char *a = argv[2];
	if ( argc > 1){
		strcpy(filename,argv[1]);
		lines = atoi(a);
	}
	else{
  	printf("Please let me know the filename: ");
  	fgets(filename,100,stdin);
  	length = strlen(filename);
		printf("How many lines do you wish to view: ");
		scanf("%d",&lines);

	}
//----------------------------------------------------------------
// Insert your code here
// ---------------------------------------------------------------

  /*open file*/
  

  /*check if file opened correctly*/
  

  // Need to start from the end of the file, maybe rewind?
  
  
  return 0;
}

