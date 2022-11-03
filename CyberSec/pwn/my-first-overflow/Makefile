CC=gcc
CFLAGS=-fno-stack-protector
SOURCE=src/my-first-overflow.c
OUTFILE=challenge/my-first-overflow

build: $(SOURCE)
	$(CC) $(CFLAGS) -D BuiltWithMake -o $(OUTFILE) $(SOURCE)
	chmod +x $(OUTFILE)
