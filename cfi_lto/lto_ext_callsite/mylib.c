#include <stdio.h>
#include <stdlib.h>

#include "mylib.h"

void ext_greet_each_other(Person* ppl, int num_ppl) {
  if (num_ppl < 0) {
    fprintf(stderr, "[Error]: negative number of peoples %d\n", num_ppl);
    exit(-1);
  }
  for (int i = 0; i < num_ppl-1; ++i) {
    puts("\n======================");
    ppl[i].greet(&ppl[i+1], &ppl[i]);
    ppl[i+1].greet(&ppl[i], &ppl[i+1]);
  }
}

