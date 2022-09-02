# SPDX-License-Identifier: MIT

CFLAGS 		:= -I./include -I../libcrt/include -O3 -nostdinc -nostdlib
CFLAGS		+= -m64 -march=x86-64 -mno-sse2
CFLAGS		+= -fno-stack-protector
CFLAGS		+= -ffreestanding
CC := gcc
PREFIX := /usr/local/

OBJS		+= $(addprefix src/, \
			log.o \
			log_data.o \
			__math_divzero.o \
			__math_invalid.o \
			__math_uflow.o \
			__math_oflow.o \
			__math_xflow.o \
			exp_data.o \
			pow.o \
			pow_data.o \
			fabs.o \
		    )

all: libm.a

install: all
	cp libm.a $(PREFIX)

libm.a: $(OBJS)
	ar rcs $@ $(OBJS)

%.o : %.c
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	@rm -f libm.a
	@rm -f src/*.o
