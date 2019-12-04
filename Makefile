CC=gcc
CFLAGS=-Wall -O2 -fpic
SRCS=$(wildcard *.c)
OBJS=$(patsubst %.c, %.o, $(SRCS))

all: libplink_lite.so

libplink_lite.so: $(OBJS)
	gcc -shared -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $<

install:
	cp libplink_lite.so /usr/lib64/
	cp plink_lite.h /usr/include/

clean:
	rm -f $(OBJS) libplink_lite.so
