/*
AerE 361 Mission 10
Exercise 1
YOUR NAME HERE

* Compute the factorial number for a given integer
*/
 
#include<stdio.h>

long factorial(int n);

int main()
{
    int n = 0;
    printf ("Please input a integer:\n");
    scanf ("%d", n);
    long val=factorial(n);
    printf ("%ld\n", val);
    return 0;
}

long factorial(int n)
{
    long result = 1;
    while(n--)
    {
        result *= n;
    }
    return result;
}
