#include <stdio.h>
#include <stdlib.h>
#include "mylib.h"

typedef struct Employee_ {
  int salary;
  char* name;
  int (*work)(struct *Employee_, int);
} Employee;


int work_hard(Employee* self, int time) {
  self->salary += time * 100;
}

int work_casual(Employee* self, int time) {
  self->salary += time * 30;
}

void jitrop(void) {
  printf("work_hard: %p\n", work_hard);
  printf("work_casual: %p\n", work_casual);
}

int
main(int argc, char** argv) {

  Employee* Alice = (Employee *) malloc(sizeof(Employee));
  Employee* Bob = (Employee *) malloc(sizeof(Employee));
  
  bzero(Alice, sizeof(Employee));
  bzero(Bob, sizeof(Employee));
 
  jitrop(); 



  return 0;
}
