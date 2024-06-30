.PHONY: install-gdtools fmt lint tes

install-gdtools:
	python -m pip install gdtoolkit

fmt:
	gdformat $$(find . -name '*.gd' -not -path "./addons/*")

lint:
	gdlint $$(find . -name '*.gd' -not -path "./addons/*")

test:
	/Applications/Godot4.app/Contents/MacOS/Godot -d -s --path "$$PWD" addons/gut/gut_cmdln.gd

release: lint test
	./release.sh
