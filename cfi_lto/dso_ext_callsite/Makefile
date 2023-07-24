LLVM_BIN=../../llvm-project/build/bin
CC=$(LLVM_BIN)/clang
CXX=$(LLVM_BIN)/clang++

CFLAGS=-m64 -fPIC
LTOFLAGS=$(CFLAGS) -fvisibility=hidden -flto -fsanitize=cfi -fno-sanitize-ignorelist
DSOFLAGS=$(LTOFLAGS) -fsanitize-cfi-cross-dso

all: greet.exe
greet.exe: greet.ll libmylib.so
	$(CC) $(DSOFLAGS) -L. -lmylib -o $@ $<
greet.ll: greet.c
	$(CC) $(DSOFLAGS) -S -emit-llvm -o $@ $<
libmylib.so: mylib.ll
	$(CC) $(DSOFLAGS) -shared -lc -o $@ $<
mylib.ll: mylib.c
	$(CC) $(DSOFLAGS) -S -emit-llvm -o $@ $<
clean:
	rm $(wildcard *.o) $(wildcard *.exe) $(wildcard *.ll)
