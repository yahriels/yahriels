#ifndef integration_h
#define integration_h

#include<stdlib.h>
#include<stdio.h>
#include<math.h>

struct integral {
  double (*integrand) (double);
  double low;
  double high;
};

double midpoint(struct integral);
double simpson_13(struct integral);
double simpson_38(struct integral);
double gauss_quad(struct integral,int n);

#endif


