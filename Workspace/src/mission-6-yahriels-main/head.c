/*
AerE 361 Mission 6
Exercise 2
Head Program
YOUR NAME HERE
*/

/*
Includes
--------------------------------------
*/
/*Prompts user for file name, tries to open it and read and print first 3 lines*/
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

/*begin main function*/
int main(int argc, char *argv[]){

//----------------------------------------------------------------
// Below here define your variables
// ---------------------------------------------------------------
  

//----------------------------------------------------------------
// Do not change anything below.
// ---------------------------------------------------------------
  lines = atoi(argv[2]);
	if ( argc > 1){
		strcpy(filename,argv[1]);
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
  

  /*check file opened correctly*/
  

  /*if it did, retrieve and print first three lines to screen*/
  
  
  return 0;

}
