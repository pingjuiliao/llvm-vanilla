#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>

#include "mylib.h"

void pop_shell(void) {
  system("/bin/sh");
  exit(-1);
}

void pop_shell_voidp(void* a, void* b) {
  pop_shell();
}

void pop_shell_advanced(Person* target, Person* myself) {
  pop_shell();
}
