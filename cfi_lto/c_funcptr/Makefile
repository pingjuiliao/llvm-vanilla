LLVM_BIN=../../llvm-project/build/bin
CC=$(LLVM_BIN)/clang
CXX=$(LLVM_BIN)/clang++

CFLAGS=-m64
CFIFLAGS=$(CFLAGS) -fvisibility=hidden -flto -fsanitize=cfi -fno-sanitize-ignorelist

tests := greet_cfi.exe greet_cfi.ll
tests += greet_vuln.exe greet_vuln.ll

all: $(tests)
%_vuln.ll: %.c
	$(CC) -S -emit-llvm $(CFLAGS) -o $@ $<
%_vuln.exe: %.c
	$(CC) $(CFLAGS) -o $@ $<
%_cfi.ll: %.c
	$(CC) -S -emit-llvm $(CFIFLAGS) -o $@ $<
%_cfi.exe: %.c
	$(CC) $(CFIFLAGS) -o $@ $<
clean:
	rm $(wildcard *.exe) $(wildcard *.ll)
