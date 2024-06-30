alias godot4="/Applications/Godot4.app/Contents/MacOS/Godot"


rm -rf release
mkdir release
godot4 --export-release "Windows Desktop" $(pwd)/release/game.exe
godot4 --export-release "macOS" $(pwd)/release/game.dmg
godot4 --export-release "Linux/X11" $(pwd)/release/game.x86_64
