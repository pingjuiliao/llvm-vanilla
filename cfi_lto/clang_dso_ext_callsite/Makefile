CC=clang
CXX=clang++

CFLAGS=-m64 -fPIC
LTOFLAGS=$(CFLAGS) -fvisibility=hidden -flto -fsanitize=cfi 
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
	rm $(wildcard *.o) $(wildcard *.exe) $(wildcard *.ll) $(wildcard *.so)
