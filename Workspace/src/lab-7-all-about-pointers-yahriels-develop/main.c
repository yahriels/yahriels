#include <stdlib.h>
#include <stdio.h>
#include <math.h>

double integrand (double x){
  // Your test fucntion goes here
  return sin(x);
}
// Forword declaration of function prototypes here
double midpoint (double (*integrand) (double), double a, double b);
double simpson_13 (double (*integrand) (double), double a, double b);
double simpson_38 (double (*integrand) (double), double a, double b);
double gauss_quad (double (*integrand) (double), double a, double b, int c);

int main(void) {
  double ans;
  double a = 5.5;
  double b = 2.3;
  int c = 10;
  ans = midpoint (integrand, a, b);
  printf("Midpoint integration: %g\n", ans);
  ans = simpson_13(integrand, a, b);
  printf("Simpson's 1/3 Rule: %g\n", ans);
  ans = simpson_38(integrand, a, b);
  printf("Simpson's 3/8 Rule: %g\n", ans);
  ans = gauss_quad (integrand, a, b, c);
  printf("Gauss Quad: %g\n", ans);

  return 0;
}




