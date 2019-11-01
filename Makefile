CC=gcc
CFLAGS=-Wall -g -fpic
PREFIX_DIR=/usr
H_DIR=$(PREFIX_DIR)/include/
L_DIR=$(shell if [ -f "/etc/redhat-release" ]; then echo "/usr/lib64/"; elif [ -f "/etc/debian_version" ]; then echo "/usr/lib/"; fi)
SRCS=$(wildcard *.c)
OBJS=$(patsubst %.c, %.o, $(SRCS))

all: libplink_lite.so

libplink_lite.so: $(OBJS)
	gcc -shared -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $<

install:
	cp libplink_lite.so ${L_DIR}
	cp plink_lite.h ${H_DIR}

clean:
	rm -f $(OBJS) libplink_lite.so
