CC 	=	gcc
CFLAGS 	=	
OBJ 	= 	$(patsubst %.c,%.o,$(wildcard *.c))
INCLUDE	=	-Iinclude -Ibglib

all: main

main: $(OBJ)

%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDE) -c $<



.PHONY clean:

clean:
	rm *.o
	


