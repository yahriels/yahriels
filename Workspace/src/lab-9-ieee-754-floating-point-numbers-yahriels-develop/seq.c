#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdlib.h>
#include <math.h>

int main(int argc, char* argv[])
{
  if(argc == 2)
    {
      double x[21];
      x[1] = (double)11/2;
      x[2] = (double)61/11;
      printf("%f\n",x[1]);
      printf("%f\n",x[2]);
      for(int i = 2; i<20;i++)
{
 x[i+1] = 111 - (1130-(3000/x[i-1]))/x[i];
 printf("%f\n",x[i]);
}
    }
  else
    {
      double x[12];
      x[1] = (double)11/2;
      x[2] = (double)61/11;
      printf("%f\n",x[1]);
      for(int i = 2; i<=10; i++)
{
 x[i+1] = 111 - (1130-(3000/x[i-1]))/x[i];
 printf("%f\n",x[i]);
}
    }
  return 0;
}
