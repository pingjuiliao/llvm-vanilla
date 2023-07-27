#ifndef MYLIB_H
#define MYLIB_H
#include <stdio.h>
#include <stdlib.h>

typedef struct _Person {
  int age;
  char* name;
  void (*greet)(struct _Person*, struct _Person*);
} Person;

void pop_shell(void);

void pop_shell_voidp(void*, void*);

void pop_shell_advanced(Person*, Person*);

#endif  // MYLIB_H

