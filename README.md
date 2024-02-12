# Blang - B compiler for modern systems

**Blang** is a compiler for the **B** programming language, developed by *Ken Thompson* and *Dennis Ritchie* at *Bell Labs* in *1970*, later getting replaced by **C**. Blang is written in C99 and relies on a minimal set of dependencies, namely `libc` and the GNU binutils.

This repository also includes a `libb.a` implementation, B's standard library. It requires zero dependencies, not even libc.

Blang is implemented as a small single-pass compiler in ~2000 lines of pure C99 code. Therefore, it features small compile times with a very low memory footprint.

### Current Status

- [x] global variables
- [x] functions
- [x] `auto` & `extrn` variables
- [x] control flow statements
- [x] expressions
- [x] `libb.a` standard library
- [ ] optimization
- [ ] nicer error messages

### Compatibility

Due to Blang's simplicity, only **`gnu-linux-x86_64`**-systems are supported.

- If your system can run *GNU-`make`*, *GNU-`ld`* and *GNU-`as`*, BCause itself should be able to work.
- Because of the reliance on system-calls `libb.a` has to be implemented for each system separately.

> **Note**
> Feel free to submit pull requests to provide more OS support and fix bugs.

### Installation

To install BCause, first clone this repository:
```console
$ git clone https://github.com/nikhilesh-927/Blang
$ cd ./Blang
```

To install Blang on your computer globally, use:
```console
$ sudo apt make install
```
> **Warning**
> this requires root privileges and modifies system files

### Usage

To compile a B source file (`.b`), use:
```console
$ blang file1.b (your file in b language) -o output
```
To see the output on your console:
```console
$ ./output
```
To get help, type:
```console
$ blang --help
```

### Licensing
BCause is licensed under the MIT License. See `LICENSE` in this repository for further information.

### References

- [Bell Labs User's Reference to B](https://www.bell-labs.com/usr/dmr/www/kbman.pdf) by Ken Thompson (Jan. 7, 1972)

- Wikipedia entry: [B (programming language)](https://en.wikipedia.org/wiki/B_(programming_language))
