/* 
AerE 361 Mission 6
Exercise 5
YOUR NAME HERE
*/

/*
Includes
For this, include stdio, stdlib, string, stdbool, math and ctype
--------------------------------------
*/


/*
Function Prototypes
Declare your function protypes here. You should have a 
brute_force, gauss_adder, a ComputeSeriesValue, ComputeFactorial, and a print_menu
-------------------------------------
*/
//Declare Brute force adder function that returns a unsigned long and takes in an unsigned long


// Declare Gauss Adder that returns an unsigned long and takes in an unsigned long


// Print the user menu that returns void and takes in nothing (void)

//Declare ComputeSeriesValue that returns a double and takes in two values, x as a double and n as an integer

//Declare ComputeFactorial that takes in an integer number and returns an integer


/*
Main Function
--------------------------------------
*/

int main(int argc, char *argv[]){
//----------------------------------------------------------------
// Below here define your variables
// ---------------------------------------------------------------
	

//----------------------------------------------------------------
// Do not change anything below.
// reply,value1,value2
// ---------------------------------------------------------------
	char *a = argv[1];
	if ( argc > 1){
		reply = atoi(a);
		if (reply == 4){
			x = atol(argv[2]);
			y = atof(argv[3]);
		}
		else {
			x = atol(argv[2]);
		}
		state = false;
	}
//----------------------------------------------------------------
// Insert your code here
// ---------------------------------------------------------------


  return 0;
}

/*
Functions
--------------------------------------
*/

//Print the user menu
void print_menu(void){
	
}

// Brute Force Adder
unsigned long brute_force(unsigned long n){
	

	return result;
}

// Gauss Adder
unsigned long gauss_adder(unsigned long n){
	
}

//Compute Factorial
int ComputeFactorial(int number) {
  
  return fact;
}

//Compute Series

double ComputeSeriesValue(double a, int b) {
  
  return seriesValue;
}