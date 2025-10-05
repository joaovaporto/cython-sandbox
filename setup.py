from setuptools import setup
from Cython.Build import cythonize

setup(
    name='Greetings',
    ext_modules=cythonize("greetings.py"),
)
