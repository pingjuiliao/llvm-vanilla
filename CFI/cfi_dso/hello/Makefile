LLVM_BIN=../../../llvm-project/build/bin
CC=$(LLVM_BIN)/clang
CXX=$(LLVM_BIN)/clang++

#CFLAGS=-O1 -fno-inline -fsanitize=cfi-icall -fsanitize-cfi-cross-dso \
#			 -fsantizie-cfi-canonical-jump-tables
CFLAGS=--target=x86_64-linux-gnu -fvisibility=hidden -fsanitize=cfi \
			 -fsanitize=cfi -fsanitize-cfi-cross-dso -flto -fno-sanitize-ignorelist
LLFLAGS=$(CFLAGS) -emit-llvm -S

targets := hello_cfi.exe hello_cfi.ll

all: $(targets)
%_cfi.exe: %.c
	$(CC) $(CFLAGS) -o $@ $<
%_cfi.ll: %.c
	$(CC) $(LLFLAGS) -o $@ $<
clean:
	rm $(wildcard *.ll) $(wildcard *.exe)
