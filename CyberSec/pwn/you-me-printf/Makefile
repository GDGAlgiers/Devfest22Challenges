CC=gcc
CFLAGS=-Wl,-z,relro,-z,now -fstack-protector
SOURCE=src/you-me-printf.c
OUTFILE=out/you-me-printf

build: $(SOURCE)
	$(CC) $(SOURCE) $(CFLAGS) -D BuiltWithMake -o $(OUTFILE) 
	chmod +x $(OUTFILE)
