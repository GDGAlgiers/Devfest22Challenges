#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void disable_buffering() {
    setbuf(stdin, NULL);
    setbuf(stdout, NULL);
    setbuf(stderr, NULL);
}

int main(void) {
    char buf[512] = { '\0' };

    disable_buffering();

    while (1) {
        printf("Anything useful to say? ");
        read(0, buf, 512);
        printf(buf);
    }

    return EXIT_SUCCESS;
}
