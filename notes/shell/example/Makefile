OBJS = fib hello hypo sum

all: $(OBJS)

fib: fib.hs
	ghc fib.hs

hello: hello.hs
	ghc hello.hs

hypo: hypo.hs
	ghc hypo.hs

sum: sum.hs
	ghc sum.hs

clean:
	$(RM) *.hi *.o $(OBJS)
