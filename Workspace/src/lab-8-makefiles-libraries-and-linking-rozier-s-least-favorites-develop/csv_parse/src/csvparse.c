#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include "csv.h"

int check(const char input[]) {
  if(isdigit(input[0]) > 0 || input[0] == '-' || input[0] == '.') {
  }
  else {
    return 0;
  }
  int i;
  for(i = 1; i<strlen(input) - 1; i++) {
    if(isdigit(input[i]) == 0 && input[i] != '.') {
      return 0;
    }
  }
  int count = 0;
  i=0;
  for(i = 0; i<strlen(input) - 1; i++) {
    if(input[i] == '.') {
      count++;
    }
  }
  if(count != 1) {
    return 0;
  }
  return 1;
}

int main(int argc, char *argv[]) {

  FILE * pfile;
  pfile = fopen(argv[1],"r");
  if(pfile == NULL) {
    return 1;
  }
    CsvParser *csvparser = CsvParser_new(argv[1],",",0);
    if(csvparser == NULL) {
      return 2;
    }
    CsvRow *row;
    const CsvRow *header = CsvParser_getHeader(csvparser);
    const char **headerFields = CsvParser_getFields(header);
    const int firstrsize = CsvParser_getNumFields(header);

    int rcount = 0;
    
    while ((row = CsvParser_getRow(csvparser))) {
      int rsize = CsvParser_getNumFields(row);
      if(rsize != firstrsize) {
	return 3;
        }
      rcount++;
      CsvParser_destroy_row(row);
    }
    CsvParser_destroy(csvparser);

    double ** matrix;
    matrix = malloc(sizeof(double *) * rcount);
    int i;
    for(i = 0; i < rcount; i++) {
      matrix[i] = malloc(sizeof(double) * rcount);
    }
    size_t stringlength = 0;
    int maxstringlength = 0;
    int j = 0;
    CsvParser * csvParser2 = CsvParser_new(argv[1],",",0);
    CsvRow *row2;
    i = 0;
    while(row2 = CsvParser_getRow(csvParser2)) {
      const char **fields = CsvParser_getFields(row2);
      for(i = 0; i < CsvParser_getNumFields(row2); i++) {
	if(check(fields[i]) == 0) {
	  return 4;
	}
	stringlength = strlen(fields[i]);
	if(stringlength > maxstringlength) {
	  maxstringlength = stringlength;
	}
	matrix[j][i] = (double) *fields[i];
      }
      j++;
      CsvParser_destroy_row(row2);
    }
    CsvParser_destroy(csvParser2);

    FILE * ofile;
    ofile = fopen("ans.out","w");
    int width = maxstringlength + 1;
    i = 0;
    int k;
    for(i = 0; i < rcount; i++) {
      for(k = 0; k < maxstringlength; k++) {
	fprintf(pfile, "%*lf",width,matrix[i][k]);
	printf("%*lf",width,matrix[i][k]);
      }
      fprintf(ofile,"\n");
      printf("\n");
    }
    fclose(pfile);
    fclose(ofile);
    free(matrix);
    return 0;
}
  
  
