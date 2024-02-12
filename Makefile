SHELL = /bin/sh

CFLAGS = -std=c99 -Wall -Wextra -pedantic -fPIC -g
CFLAGS_LIBB = -nostdlib -c 					\
	-Wno-incompatible-library-redeclaration \
	-Wno-builtin-declaration-mismatch       \
	-ffreestanding

COMPILER_FILES = $(shell find src/compiler -name '*.c')
LIBB_FILES = $(shell find src/libb -name '*.c')

LIBB_BIN = libb.a
BLANG_EXEC = blang

BINDIR = ${SYSROOT}/bin
LIBDIR = ${SYSROOT}/lib64

.PHONY: all
all: ${BLANG_EXEC} ${LIBB_BIN}

.PHONY: install
install: all
	install ${LIBB_BIN} ${LIBDIR}/${LIBB_BIN}
	install -m 557 ${BLANG_EXEC} ${BINDIR}/${BLANG_EXEC}

${BLANG_EXEC}:
	${CC} ${CFLAGS} ${COMPILER_FILES} -o $@

.PHONY: libb
libb: libb.a
${LIBB_BIN}: libb.o
	ar ruv $@ $<
	ranlib $@

libb.o:
	${CC} ${CFLAGS} ${CFLAGS_LIBB} ${LIBB_FILES} -o $@

.PHONY: clean
clean:
	rm -rf *.o *.a *.out ${BCAUSE_EXEC}
