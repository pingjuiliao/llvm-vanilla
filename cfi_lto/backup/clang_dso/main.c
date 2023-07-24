#include <stdio.h>
#include <stdlib.h>

extern void my_timeit(void (*)(int), int);

void pop_shell(void) {
  system("/bin/sh");
  exit(-1);
}

void pop_shell_int(int x) {
  system("/bin/sh");
  exit(x);
}

void show_msg(int i) {
  printf("You have inserted %d\n", i);
}


int main(int argc, char** argv) {
  void (*fptr)(int);

  fptr = show_msg;

  (*fptr)(8);

  my_timeit(fptr, 32);
  return 0;
}
