#ifndef MYLIB_H
#define MYLIB_H
#include <stdio.h>
#include <stdlib.h>

typedef struct _Person {
  int age;
  char* name;
  void (*greet)(struct _Person*, struct _Person*);
} Person;

void ext_greet_each_other(Person*, int);

#endif  // MYLIB_H

