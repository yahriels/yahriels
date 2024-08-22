/* 
AerE 361 Mission 6
Exercise 4
Factorial program
YOUR NAME HERE
*/

/*
Includes
For this, you need to include the stdio, stdlib, math and string
INSERT YOUR INCLUDES BELOW
--------------------------------------
*/


//This is our function prototype. 
double factorial(int n);

int main(int argc, char *argv[]){
//----------------------------------------------------------------
// Below here define your variables
// ---------------------------------------------------------------

//----------------------------------------------------------------
// Do not change anything below.
// ---------------------------------------------------------------
	char *a = argv[1];
	char *b = argv[2];
	if ( argc > 1){
		x = atof(a);
		err = atof(b);

	}
	else{
		printf("Please enter a value for x: ");
		scanf("%lf", &x);
		
		
		if(x <= 0) {
			printf("Needs to be a positive number. \n");
			return -1;
		}
		
		printf("Please enter the allowable error for the function: ");
		scanf("%lf", &err);
		
		if(err <= 0) {
		printf("There needs to be an allowable error. \n");
		return -1;
	}

	}
//----------------------------------------------------------------
// Insert your code here
// ---------------------------------------------------------------
	
	return 0;	
}

//Insert your factorial function here
double factorial(int n) {
	
	return fact;
}

