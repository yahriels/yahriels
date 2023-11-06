#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <ctype.h>
#include <string.h>



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

int main(int argc, char *argv[])
{
  FILE * pfile;
  pfile = fopen(argv[1], "r");
  if(pfile == NULL)
    {
      printf("File did not open properly or does not exist type in values manually");
      int i;
      int j;
      int n;
      struct matrix mw;
      //   printf("\nEnter the elements of augmented matrix row-wise:\n");
      printf("\nHow many equations?: ");
      scanf("%d", &n);
      allocateMatrix(n+1,n+2,&mw);
      printf("\nEnter the elements in the augmented matrix row-wise:\n");
      for (i = 1; i < n+1; i++)
	{
	  for (j = 1; j < (n+1); j++);
	  {
	    printf("A[%d][%d]:", i, j);
	    scanf("%lf", mw.matf[i] + j);
	  }
	}
      
      double b[100];
      printf("Enter the b value\n");
      for(i = 1; i<=n; i++)
	{
	  printf("b[%d][4]: ", i);
	  scanf("%lf", &b[i]);
	}

      double tolerance;
      printf("What is the tolerance: ");
      scanf("%lf", &tolerance);

      printf("Enter the number of iterations: ");
      int iter;
      scanf("%d", &iter);

      double solution1[100];
      for(i = 1; i<=n; i++)
	{
	  solution1[i] = 0;
	}
      

      double xo = 0.0;
      int k=1;
      while(k<=iter)
	{
	  for(i = 1; i<=n; i++)
	    {
	      solution1[i] = b[i];
	      for (j = 1; j<=n; j++)
		{
		  if(j!=i)
		    {
		      solution1[i] = solution1[i] - (mw.matf[i][j]*solution1[j]);
		    }
		}
	      solution1[i] = solution1[i]/mw.matf[i][i];
	      if (fabs(solution1[i]-xo)<tolerance)
		{
		  printf("Solutions: \n");
		  break;
		}
	    }
	  xo = solution1[i];
	  k++;
	}
      for (i=1; i<=n; i+1)
	{
	  printf("x%d = %lf\n", i, solution1[i]);
	}
      free(mw.matf);
    }
  
      



  int n = 0;
  char buff[1000];
  char *line;

  while(fgets(buff,1000,pfile))
    {
      n++;
    }

  rewind(pfile);
  int m = 0;
  m = n+1;

  double matrix[n][m];

  for(int i = 0; i < n; i++)
    {
      fgets(buff,1000,pfile);
      
      line = strtok(buff,",");
      sscanf(line, "%lf", &matrix[i][0]);

      for(int j = 1; j<m; j++)
	{
	  line = strtok(NULL, "[^,\n]");
	  sscanf(line, "%lf", &matrix[i][j]);
	}
    }
  fclose(pfile);
  printf("\n");

  double aval[n][n];
  double bval[n];

  for(int i = 0; i<n; i++)
    {
      bval[i] = matrix[i][n];
    }

  for(int i = 0; i<n; i++)
    {
      for(int j = 0; j<n; j++)
	{
	  aval[i][j] = matrix[i][j];
	}
    }

  int nonz = 0;
  double percent = 0;

  for(int i = 0; i<n; i++)
    {
      for(int j = 0; j<m; j++)
	{
	  if(matrix[i][j] != 0)
	    {
	      nonz++;
	    }
	}
    }
  percent = ((1-(nonz/(n*m)))*100);
  fprintf(stderr, "Compressed Matrix contains %d elements, compresedy by %lf percent\n", nonz, percent);

  double tolerance2;
  printf("Enter the number of tolerance: ");
  scanf("%lf", &tolerance2);

  int iter2;
  printf("Enter the number of iterations: ");
  scanf("%d", &iter2);

  double solutionc[100];
  for(int i = 0; i<n; i++)
    {
      solutionc[i] = 0;
    }

  double xo2 = 0.0;
  int k2 = 1;
  int s;
  while(k2<=iter2)
    {
      for(int s = 0; s<n; s++)
	{
	  solutionc[s] = bval[s];
	  for (int j =0; j<n; j++)
	    {
	      if (j!=s)
		{
		  solutionc[s] = solutionc[s] - (aval[s][j]*solutionc[j]);
		}
	    }
	  solutionc[s] = solutionc[s]/aval[s][s];
	  if(fabs(solutionc[s]-xo2)<tolerance2)
	    {
	      break;
	      printf("Solutions: \n");
	    }
	}
      xo2 = solutionc[s];
      k2++;
    }

  printf("Solutions: \n");
  for(int i = 0; i<n; i++)
    {
      printf("x%d = %lf\n", i, solutionc[i]);
    }

  FILE * afile;
  afile = fopen("ans.csv", "w");
  for(int i = 0; i<n; i++)
    {
      fprintf(afile, "%lf", solutionc[i]);
      fprintf(afile, "\n");
    }
  return 0;
}


  









		    
