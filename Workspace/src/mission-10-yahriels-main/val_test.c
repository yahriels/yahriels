/*
AerE 361 Mission 10
Exercise 2
YOUR NAME HERE
*/
#include <stdlib.h>

void f(void)
{
	int* x = malloc(10 * sizeof(int));
	x[10] = 0;

}

int main(void)
{
	f();
	return 0;
}
