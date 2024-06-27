extends Node

var time_scale := 1.0


func _process(_delta: float) -> void:
	if OS.is_debug_build() and time_scale < 1:
		Engine.time_scale = time_scale


func _input(_event: InputEvent) -> void:
	if not OS.is_debug_build():
		return

	if not Input.is_key_pressed(KEY_ALT):
		return

	if Input.is_key_pressed(KEY_2):
		if time_scale < 1:
			time_scale = 1
			Engine.time_scale = 1
		else:
			time_scale = 0.3
