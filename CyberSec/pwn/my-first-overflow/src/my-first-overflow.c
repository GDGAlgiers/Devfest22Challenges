#include <stdlib.h>
#include <stdio.h>
#include <signal.h>

void win() {
    system("cat flag.txt");
    exit(1337);
}

void disable_buffering() {
    setbuf(stdin, NULL);
    setbuf(stdout, NULL);
    setbuf(stderr, NULL);
}

int main(void) {
    char buf[32];

    disable_buffering();
    signal(SIGSEGV, win);

    puts("My buffer can only hold 32 characters, I really wonder what would happen if you sent more than that...");
    printf("Enter your input: ");
    gets(buf);

    return EXIT_SUCCESS;
}
