src = $(wildcard *.hs)
bin = $(src:%.hs=%)
hi  = $(src:%.hs=%.hi)
obj = $(src:%.hs=%.o)

all : $(bin)

% : %.hs
	ghc $@

clean:
	rm -f $(bin) $(hi) $(obj)
