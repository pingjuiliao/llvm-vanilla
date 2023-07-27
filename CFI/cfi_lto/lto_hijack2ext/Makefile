LLVM_BIN=../../llvm-project/build/bin
CC=$(LLVM_BIN)/clang
CXX=$(LLVM_BIN)/clang++

CFLAGS=-m64
LTOFLAGS=-fvisibility=hidden -flto -fsanitize=cfi $(CFLAGS) -fno-sanitize-ignorelist

all: greet.exe
greet.exe: greet.o mylib.o
	$(CC) $(LTOFLAGS) -o $@ $^
greet.o: greet.c
	$(CC) $(LTOFLAGS) -c -o $@ $< 
mylib.o: mylib.c
	$(CC) $(LTOFLAGS) -c -o $@ $<
clean:
	rm $(wildcard *.o) $(wildcard *.exe)
