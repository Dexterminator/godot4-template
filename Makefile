.PHONY: install-gdtools fmt lint tes

install-gdtools:
	python -m pip install gdtoolkit

fmt:
	gdformat $$(find . -name '*.gd')

lint:
	gdlint $$(find . -name '*.gd')

test:
	/Applications/Godot4.app/Contents/MacOS/Godot -d -s --path "$$PWD" addons/gut/gut_cmdln.gd
