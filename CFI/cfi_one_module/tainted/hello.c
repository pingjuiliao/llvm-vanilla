#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

typedef struct _Printable {
  char buf[0x10];
  int (*fptr)(const char*);
} Printable;

void setup(Printable*);
void hijack(Printable*);

//
void pop_shell(void);
int pop_shell_with_msg(const char*);
int error_msg(const char* msg);
int flag_msg(const char* msg);

int
main(int argc, char** argv) {
  Printable ptb;
  // initialize ptb
  setup(&ptb);
  
  hijack(&ptb);

  (*ptb.fptr)(ptb.buf);

  return 0;
}

void setup(Printable *ptb) {
  strcpy((char *)&ptb->buf, "hello\n");
  ptb->fptr = puts;
}

void hijack(Printable *ptb) {
  void* tmp[3];
  void* fptr = NULL;
  // user can input addresses to hijack
  printf("origin type sig: (int)(const char*)\n");
  printf("puts      (int)(const char*): %p\n", puts);
  printf("pop_shell (void)(void)      : %p\n", pop_shell);
  printf("pop_shell (int)(const char*): %p\n", pop_shell_with_msg);
  printf("error_msg (int)(const char*): %p\n", error_msg);
  printf("flag_msg  (int)(const char*): %p\n", flag_msg);

  printf("Please input the hjjack address: ");
  scanf("%lX", (uint64_t*) &fptr);
  
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

// dummy functions
// Theses functions are added to see if they are in the callsite trampoline list

int error_msg(const char* msg) {
  if (!msg) {
    return -1;
  }
  fprintf(stderr, "[ERROR] ");
  fputs(msg, stderr);
  return 0;
}

int flag_msg(const char* msg) {
  printf("[FLAG] ");
  puts(msg);
  return 0;
}

