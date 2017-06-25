#!/usr/bin/env make

CC = gcc

CFLAGS += -Wall -Wextra

SRCS := $(wildcard *.c)
OBJS := $(SRCS:.c=.o)
TARGET = kalyna-reference

defalut: $(TARGET)

all:	$(TARGET) test

$(TARGET): $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $(OBJS)

test: $(TARGET)
	./$(TARGET)

clean:
	rm -f $(OBJS) $(TARGET)

kalyna.o:	kalyna.c kalyna.h tables.h transformations.h

tables.o:	tables.c kalyna.h tables.h

main.o:		main.c kalyna.h transformations.h

%.o : %.c 
	$(CC) $(CFLAGS) -c $<

#
