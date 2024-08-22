#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdlib.h>
#include <math.h>

int main()
{
  long double a,b,c,d,root1,root2;
  char e;
 
  printf("Enter the value for a: ");
  if(scanf("%Lf%c",&a,&e) != 2 || e!= '\n')
    {
      printf("This is not a valid input\n");
      return 1;
    }
  else
    {
      printf("This is a valid input\n");
    }

  printf("Enter the value for b: ");
  if(scanf("%Lf%c",&b,&e) != 2 || e!= '\n')
    {
      printf("This is not a valid input\n");
      return 2;
    }
  else
    {
      printf("This is a valid input\n");
    }
 
  printf("Enter the value for c: ");
  if(scanf("%Lf%c",&c,&e) != 2 || e!= '\n')
    {
      printf("This is not a valid input\n");
      return 3;
    }
  else
    {
      printf("This is a valid input\n");
    }

  long double ans;
  if(a == 0)
    {
      ans = (-1*c)/b;
      printf("%Lf\n",ans);
      return 4;
    }
 
  d = b*b-4 *a *c;

  if (d<0)
    {
      printf("%.3Lf%+.3Lfi",-b/(2*a),sqrt(-d)/(2*a));
      printf(",%.3Lf%+.3Lfi\n",-b/(2*a),sqrt(-d)/(2*a));
      return 0;
    }
  else if(d==0)
    {
      root1 = -b/(2*a);
      root2 = root1;
      printf("%.3Lf", root1);
      printf(", %.3Lf\n", root2);
      return 0;
    }
  else
    {
      root1 = ( -b + sqrt(d))/(2*a);
      root2 = ( -b - sqrt(d))/(2*a);
      printf("%.3Lf, %.3Lf\n", root1, root2);
      return 0;
    }
  return 0;
}

