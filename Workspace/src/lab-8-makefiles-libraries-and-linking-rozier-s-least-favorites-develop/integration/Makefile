GCCFLAGS = -lm -std=c99 -Wall -Werror

default: all;

all: main.o integration.o
	gcc main.o integration.o -o libintegration.so $(GCCFLAGS)

main.o: main.c integration.h
	gcc -shared -c main.c $(GCCFLAGS)

integration.o: integration.c integration.h
	gcc -shared -c integration.c $(GCCFLAGS)

clean:
	rm -f *.h.gch *.om
