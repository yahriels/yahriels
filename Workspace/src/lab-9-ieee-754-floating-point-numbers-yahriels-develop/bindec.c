#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdlib.h>
#include <math.h>
#define MAX 1000

int main(int argc, char *argv[])
{
  const char* str1 = "-d";
  const char* str2 = "-b";
  const char* input = "Number[2];";

  if(strcmp(argv[1],str1) == 0)
    {
      char * p;

      long double fraDecimal,fraBinary,bFractional = 0.0, dFractional,fraFactor = 0.1;
      long int dIntegral, bIntegral = 0;
      long int intFactor = 1, remainder,temp,i;

      fraDecimal = strtold(argv[2], &p);

      dIntegral = fraDecimal;
      dFractional = fraDecimal - dIntegral;

      while(dIntegral!=0)
{
 remainder = dIntegral%2;
 bIntegral = bIntegral+remainder*intFactor;
 dIntegral = dIntegral/2;
 intFactor = intFactor*10;
}
      for(i = 1; i<=6;i++)
{
 dFractional = dFractional * 2;
 temp = dFractional;

 bFractional = bFractional + fraFactor* temp;
 if(temp == 1)
   {
     dFractional = dFractional - temp;
   }
 fraFactor = fraFactor/10;
}

      fraBinary = bIntegral + bFractional;
      printf("Binary value: %Lf\n", fraBinary);

      return 0;
    }

  if(strcmp(argv[1],str2) == 0)
    {
      long double fraDecimal = 0.0, dFractional = 0.0, fraFactor = 0.5;
      long int dIntegral = 0, bIntegral = 0, bFractional[MAX];
      long int intFactor = 1, remainder, i =0, flag = 0, k = 0;
      char fraBinary[MAX];
      strcpy(fraBinary, argv[2]);

      while(fraBinary[i])
{
 if(fraBinary[i] == '.')
   {
     flag = 1;
   }
 else if(flag == 0)
   {
     bIntegral = bIntegral*10 + (fraBinary[i] - 48);
   }
 else
   {
     bFractional[k++] = fraBinary[i] - 48;
   }
 i++;
}

      while(bIntegral != 0)
{
 remainder = bIntegral%10;
 dIntegral = dIntegral + remainder*intFactor;
 intFactor = intFactor*2;
 bIntegral = bIntegral/10;
}
      for(i = 0; i<k; i++)
{
 dFractional = dFractional + bFractional[i]*fraFactor;
 fraFactor = fraFactor/2;
}

      fraDecimal = dIntegral + dFractional;
      printf("Decimal Value: %Lf\n", fraDecimal);
    }
  return 0;
}

