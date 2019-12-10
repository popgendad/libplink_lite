CC         := gcc
VERSION    := $(shell cat VERSION)
CFLAGS     := -Wall -O2 -D VERSION=$(VERSION)
PREFIX_DIR := /usr
H_DIR      := $(PREFIX_DIR)/include/
L_DIR      := $(shell if [ -f "/etc/redhat-release" ]; then echo "/usr/lib64/"; elif [ -f "/etc/debian_version" ]; then echo "/usr/lib/"; fi)
SRCS       := $(wildcard src/*.c)
SDIR       := build-static
DDIR       := build-dynamic
DOBJS      := $(SRCS:src/%.c=$(DDIR)/%.o)
SOBJS      := $(SRCS:src/%.c=$(SDIR)/%.o)

all: libplink_lite.so libplink_lite.a

static: libplink_lite.a

shared: libplink_lite.so

libplink_lite.a: $(SOBJS)
	ar rcs $@ $^

libplink_lite.so: CFLAGS+=-fPIC

libplink_lite.so: $(DOBJS)
	gcc -shared -o $@ $^

$(DDIR)/%.o:src/%.c | $(DDIR)
	$(CC) $(CFLAGS) -o $@ -c $<

$(SDIR)/%.o:src/%.c | $(SDIR)
	$(CC) $(CFLAGS) -o $@ -c $<

$(SDIR) $(DDIR):
	@mkdir $@

install:
	cp libplink_lite.so $(L_DIR)
	cp src/plink_lite.h $(H_DIR)

clean:
	rm -rf $(DDIR) $(SDIR) libplink_lite.a libplink_lite.so
