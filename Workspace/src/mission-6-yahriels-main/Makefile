# AerE 361
# Mission 6 Makefile
# Professor Nelson
# Fall 2022

# The following are used to compile each exercise
number_gen:
	gcc number_gen.c -o number_gen.out

head:
	gcc head.c -o head.out

tail:
	gcc tail.c -o tail.out

mac_exp:
	gcc mac_exp.c -o exp.out -lm

361_calc:
	gcc 361_calc.c -o 361_calc.out -lm

# This is the clean action to remove compiled executables
clean:
	rm *.out

# These are the various test scripts
test_number_gen: number_gen
	bash tests/test_number_gen.sh

test_head: head
	bash tests/test_head.sh

test_tail: tail
	bash tests/test_tail.sh

test_mac_exp: mac_exp
	bash tests/test_mac_exp.sh

test_361_calc: 361_calc
	bash tests/test_361_calc.sh

# This will compile and test all exercises in one commnand
test: number_gen head tail mac_exp 361_calc
	bash tests/test_number_gen.sh
	bash tests/test_head.sh
	bash tests/test_tail.sh
	bash tests/test_mac_exp.sh
	bash tests/test_361_calc.sh
