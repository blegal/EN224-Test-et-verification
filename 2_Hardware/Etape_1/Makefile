CC=gcc
LDFLAGS=-lm
EXEC=main
SRC=./src/main.c

OBJ= $(SRC:.c=.o)

CFLAGS=-O2 -Wall

all: $(EXEC)

main: $(OBJ)
	$(CC) $(CFLAGS) -o ./bin/$@ $^ $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $< $(CFLAGS)

.PHONY: clean mrproper

clean: $(OBJ)
	find . -name *.o -delete

mrproper: clean
	rm $(EXEC)
