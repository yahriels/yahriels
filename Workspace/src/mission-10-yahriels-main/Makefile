# AerE 361
# Lab 8 Makefile
# YOUR NAME HERE
# export LD_LIBRARY_PATH=$(pwd)/bin/shared:${LD_LIBRARY_PATH}
IDIR=./include
CC=gcc
LIBS=-lm
CFLAGS=-I$(IDIR) -Wall -std=c11
DEBUG=-DDEBUG
ODIR=bin
SRC=src
LIBDIR=lib
FILESRC:=numerical_test.c
FILEEXE:=numerical_test.out

all: run_numerical_test

# You should have four targets below. I have started them, you need to finish them.

numerical_test.o:

numerical.o:

compile_numeric: numerical_test.o

run_numerical_test: compile_numeric

# This target
numerical_lib: numerical.out



clean:
	@echo "Cleaning up all generated files"
	@find . -type f -name '*.o' -delete
	@echo "Cleaning up executable files"
	@find . -type f -name '*.out' -delete
	@echo "Done cleaning"

test_ex1:
	bash tests/test_ex1.sh

test_ex2:
	bash tests/test_ex2.sh

test_ex4:
	bash tests/test_ex4.sh

test_ex5:
	bash tests/test_ex5.sh

test_all:
	bash tests/test_ex1.sh
	bash tests/test_ex2.sh
	bash tests/test_ex4.sh
	bash tests/test_ex5.sh
