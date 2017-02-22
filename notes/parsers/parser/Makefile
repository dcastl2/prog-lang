all: parser

parser: lexer.o parser.o
	$(CC) -Wall lexer.o parser.o -o parser	

.c.o:
	$(CC) -Wall -c $<


test: parser expr.in
	./parser

clean:
	$(RM) parser.o lexer.o parser
