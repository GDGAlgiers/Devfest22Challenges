CC=gcc
CFLAGS=-fno-stack-protector -no-pie -Wl,-z,relro,-z,now,-z,noexecstack
SOURCE=src/rop-it-off.c
OUTFILE=challenge/rop-it-off

build: $(SOURCE)
	$(CC) $(CFLAGS) -D BuiltWithMake -o $(OUTFILE) $(SOURCE)
	chmod +x $(OUTFILE)
