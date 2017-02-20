LEX = $(wildcard *.lex)
SRC = $(LEX:.lex=.c)
EXE = $(SRC:.c=)

# .PRECIOUS: %.c

all: $(EXE)

% : %.c
	gcc $^ -o $@ -ll

%.c : %.lex
	lex -o $@ $^

clean:
	$(RM) $(EXE) $(SRC)
