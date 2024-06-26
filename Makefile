install-gdtools:
	python -m pip install gdtoolkit

fmt:
	gdformat $$(find . -name '*.gd')

lint:
	gdlint $$(find . -name '*.gd')
