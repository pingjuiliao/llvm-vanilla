#include <stdio.h>


void internal_caller(int (*f)(const char*), char* s) {
  f(s);
}

int main(int argc, char** argv) {
  internal_caller(puts, "hello world");
  return 0;
}
