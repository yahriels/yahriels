#include "integration.h"

double integrand2(double x) {
  return sin(x);
}

int main(void) {
  double ans;

  struct integral integral;

  integral.low=5.5;
  integral.high=2.3;
  integral.integrand=integrand2;
  int c = 10;

  ans = midpoint(integral);
  printf("Midpoint integration: %g\n",ans);

  ans = simpson_13(integral);
  printf("Simpson's 1/3: %g\n",ans);

  ans=simpson_38(integral);
  printf("Simpson's 3/8: %g\n",ans);

  ans=gauss_quad(integral,c);
  printf("Gauss Quad: %g\n",ans);

  return 0;
}
