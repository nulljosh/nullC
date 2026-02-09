CC = gcc
CFLAGS = -Wall -Wextra -std=c99 -Isrc
SRC = src/main.c src/lexer.c
TARGET = nullc

all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) -o $@ $^

clean:
	rm -f $(TARGET)

test: $(TARGET)
	./$(TARGET) examples/hello.c

.PHONY: all clean test
