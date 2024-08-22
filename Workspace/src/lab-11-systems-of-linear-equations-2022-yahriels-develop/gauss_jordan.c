#include <stdio.h>
#include <stdlib.h>

struct matrix
{
  int r;
  int c;
  double **matf;
};

int allocateMatrix (int row, int column, struct matrix *mw)
{
  mw->r = row;
  mw->c = column;
  int i = 0;

  mw->matf = malloc(sizeof(double *) * row);
  for(i = 0; i<row; ++i)
    {
      mw->matf[i] = malloc(sizeof(double) * column);
    }
  return 0;
}

int main(void) {
  int i,j,k,n;

  float c;
  double x[100];
  struct matrix mw;

  printf("\nHow many equations?: ");
  scanf("%d", &n);

  allocateMatrix(n,n+1,&mw);

  printf("\nEnter the elements in the augmented matrix row-wise:\n");
  for (i = 0; i < n; i++)
    {
      for (j = 0; j < (n+1); j++)
      {
	printf("Matrix[%d][%d]:", i+1, j+1);
	scanf("%lf", mw.matf[i] + j);
      }
    }

  
  for (j = 0; j < n; j++)
    {
      for (i = 0; i < n; i++)
	{
	  if (i != j)
	    {
	      c = mw.matf[i][j] / mw.matf[j][j];

	      for (k = 0; k < (n+1); k++)
		{
		  mw.matf[i][k] -= c*mw.matf[j][k];
		}
	    }
	}
    }

  printf("\nThe solution is:\n");
  for (i = 0; i < n; i++)
    {
      x[i] = mw.matf[i][n]/mw.matf[i][i];
      printf("\n x%d=%lf\n", i+1, x[i]);
    }
  return 0;
}
		  
