#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct _Printable {
  char buf[0x10];
  int (*fptr)(const char*);
} Printable;

void setup(Printable*);
void hijack(Printable*, void*);

//
void pop_shell(void);
int pop_shell_with_msg(const char*);

int
main(int argc, char** argv) {
  Printable ptb;
  // initialize ptb
  setup(&ptb);
  
  hijack(&ptb, (void *) pop_shell);

  (*ptb.fptr)(ptb.buf);

  return 0;
}

void setup(Printable *ptb) {
  strcpy((char *)&ptb->buf, "hello\n");
  ptb->fptr = puts;
}

void hijack(Printable *ptb, void* fptr) {
  void* tmp[3];
  tmp[2] = fptr;
  strcpy((char *)&tmp, "hacked!!!!!");
  
  memcpy(ptb, (void *) &tmp, sizeof(Printable));
}

/* targets */
void pop_shell(void) {
  system("/bin/sh");
}

int pop_shell_with_msg(const char* msg) {
  pop_shell();
  return puts(msg);
}
