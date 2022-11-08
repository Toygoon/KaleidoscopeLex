CC=gcc
LIBS=-lfl
LEXFILE=src/kaleido.l

all: main
main: lex.yy.c
	$(CC) -o bin/kaleido bin/kaleido.c $(LIBS) 
	
lex.yy.c: $(LEXFILE)
	mkdir -p bin
	flex -o bin/kaleido.c $(LEXFILE) 
	
clean:
	rm -f *.o bin/main lex.yy.c
	