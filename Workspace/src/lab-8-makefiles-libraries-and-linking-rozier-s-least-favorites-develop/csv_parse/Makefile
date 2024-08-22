SHELL = /bin/sh
DIRECTORY = "/home/vm-user/lab-8-makefiles-libraries-and-linking-rozier-s-least-favorites/csv_parse/lib"

all:
	gcc -Iinclude ./examples/usage_example.c -Llib -lcsv -o ./bin/usage_example
	gcc -Iinclude ./examples/usage_example_with_header.c -Llib -lcsv -o ./bin/usage_example_with_header
	gcc -Iinclude ./src/csvparse.c -Llib -lcsv -o ./bin/csvparse -Wl,-rpath,$(DIRECTORY)
clean:
	rm bin/csvparse
	rm bin/usage_example
	rm bin/usage_example_with_header

