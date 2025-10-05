# For what

This sandbox presents examples of how to use Cython.

Cython is a tool for create C code from Python code. Why to do that and not simply write full Python?

Because sometimes there are snippets of code in a program that could be optimized if written in C. Therefore we write them in C, compile as `.so` and import to Python as libs.

That is what Cython does: instead of write those C libs directly in C, we write the code in Python and Cython translate it to C and compile to `.so`.

# How to

## Set up

Creates a virtual environment and install dependencies to this sandbox.

```bash
make up
```

## Build

We call build the process of translate Python code into C and compile it to `.so`. 

There are five ways to build with Cython [1](https://cython.readthedocs.io/en/latest/src/quickstart/build.html#building-a-cython-module-using-setuptools), three contemplated here.

### Build with setuptools

Builds using setuptools (recommended).

```bash
make build
```

### Build with cythonize

Builds using cythonize. Pratically equal to setuptools with one file.

```bash
make build-cythonize
```

### Build manually

Builds manually, exposing the process behind the scenes:
- `.py`/`.pyx` -> `.c` -> .`o` -> `.so`

```bash
make build-manual
```

or

```bash
make translate # from .py/pyx to .c
make compile # to object file (.o)
make export # to shared object (.so, aka dynamic lib)
```

What happens is fundamentally:

1. Cython translates `.py` to `.c`, containing not only what we wrote, but also ABI code (complementary code to make `.c` code compatible with Python modules)
2. GCC compiles `.c` to `.o`/binary (requires *Python.h* path for that, since the ABI code in `.c` uses it)
3. GCC generates a `.so`/lib from `.o` and it could be imported as a Python module as any other `.py` file


## Import to Python

To import the generated `greetings.so` to Python code, we simple do:

```python
from greetings import greetings
```

## Run

If the build succeeded, any the following ways to run will work gracefully.

### *main.py*

```bash
make run
```

### Python session
```bash
python3 # start Python session
from greetings import greetings
greetings("World")
```

## Cleaning

Removes generated files.

```bash
make clean
```
