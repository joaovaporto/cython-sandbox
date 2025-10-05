filename = 'greetings'

up:
	python3 -m venv .venv
	. .venv/bin/activate && pip install -r requirements.txt

build:
	python3 setup.py build_ext --inplace

build-cythonize:
	cythonize -i $(filename).py

translate:
	cython $(filename).py -o $(filename).c 

compile:
	gcc -fPIC -I/usr/include/python3.12 -c $(filename).c -o $(filename).o

export:
	gcc -shared $(filename).o -o $(filename).so

build-manual: translate compile export

run:
	python3 main.py "World"

clean:
	rm -rf build/ *.c *.o *.so *~
