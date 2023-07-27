LLVM_BIN=../../llvm-project/build/bin
CC=$(LLVM_BIN)/clang
CXX=$(LLVM_BIN)/clang++

CFLAGS=-m64
CFIFLAGS=$(CFLAGS) -fvisibility=default -flto -fsanitize=cfi -fno-sanitize-ignorelist
HIDDEN_CFLAGS=$(CFLAGS) -fvisibility=hidden -flto -fsanitize=cfi -fno-sanitize-ignorelist

tests := hello_cfi.exe hello_cfi.ll
tests += hello_vuln.exe hello_vuln.ll

all: $(tests)
%_vuln.ll: %.c
	$(CC) -S -emit-llvm $(CFLAGS) -o $@ $<
%_vuln.exe: %.c
	$(CC) $(CFLAGS) -o $@ $<
%_cfi.ll: %.c
	$(CC) -S -emit-llvm $(CFIFLAGS) -o $@ $<
%_cfi.exe: %.c
	$(CC) $(CFIFLAGS) -o $@ $<
hidden: hello.c
	$(CC) $(HIDDEN_CFLAGS) -S -emit-llvm -o hidden_cfi.ll $< 
clean:
	rm $(wildcard *.exe) $(wildcard *.ll)
