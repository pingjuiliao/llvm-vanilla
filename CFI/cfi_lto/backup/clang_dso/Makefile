CC=clang
CXX=clang++
CFLAGS=-m64 -fPIC
LTOFLAGS=-fvisibility=hidden -flto -fsanitize=cfi $(CFLAGS) -fsanitize-cfi-cross-dso
#DSOFLAGS=-fsanitize-cfi-cross-dso

LD_LIBUTIL=-L. -lutil -Wl,-rpath,.


all: main.exe
main.exe: main.o libutil.so
	$(CC) $(LTOFLAGS) $(LD_LIBUTIL) -o $@ $<
libutil.so: util.o
	$(CC) $(LTOFLAGS) -lc -shared -o $@ $<
util.o: util.c
	$(CC) $(CFLAGS) -c -o $@ $<
main.o: main.c
	$(CC) $(CFLAGS) -c -o $@ $<
clean:
	rm $(wildcard *.so) $(wildcard *.o) $(wildcard *.exe)
