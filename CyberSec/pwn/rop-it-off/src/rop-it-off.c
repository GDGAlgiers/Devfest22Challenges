#include <stdlib.h>
#include <stdio.h>
#include <signal.h>

void disable_buffering() {
    setbuf(stdin, NULL);
    setbuf(stdout, NULL);
    setbuf(stderr, NULL);
}

int main(void) {
    char buf[32];

    disable_buffering();

    puts("This time you'll have to do more than just send more characters to get the flag :)");
    printf("Enter your input: ");
    gets(buf);

    return EXIT_SUCCESS;
}
