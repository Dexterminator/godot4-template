# Godot 4 template

A basic project template featuring utilities like:
- A state machine implementation
- Actions autoload for input actions in code (nice for adding actions for multiple players in a for loop etc)
- Screen shake
- Slowdown (usable for hit stop, slomo etc)
- Delta autoload for tracking in-game time
- Debug overlay and options (alt+9 to show, alt+0 to hide)
- Scene manager (very simple, but can serve as a starting point)
- Event bus
- Input buffer
- Example of using Polygon2D for level prototyping (by setting its collision automatically in a script)
- Set data structure
- Unit testing using [GUT](https://gut.readthedocs.io/en/latest/index.html)
- Makefile featuring linting and formatting using [GDScript Toolkit
](https://github.com/Scony/godot-gdscript-toolkit)
- Example release script

If using the `test` make target or `release.sh` script, make sure to edit the path to Godot to the path or alias you are using on your system. If everything is set up correctly (by also running `make install-gdtools`), running `make release` will run the linter and tests, and if those succeed build the game for Windows, Mac and Linux.

This template is meant to serve as a minimal starting point, just delete anything that isn't useful in your project and replace assets/fonts/themes as you see fit!
