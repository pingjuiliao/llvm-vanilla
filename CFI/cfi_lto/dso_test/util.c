#include "util.h"
#include <stdio.h>
#include <time.h>

void my_timeit(void (*fptr)(int), int num) {
  clock_t start, end;
  start = clock();
  (*fptr)(num);
  end = clock();
  printf("total time: %ld\n", end - start);
}
