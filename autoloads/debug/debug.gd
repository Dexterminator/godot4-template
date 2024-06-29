extends CanvasLayer

var time_scale := 1.0
@onready var fps_label: Label = $MarginContainer/FpsLabel


func _ready() -> void:
	visible = false


func _process(_delta: float) -> void:
	if OS.is_debug_build() and time_scale < 1:
		Engine.time_scale = time_scale


func _input(_event: InputEvent) -> void:
	if not OS.is_debug_build():
		return

	if visible:
		fps_label.text = "FPS: %s" % Engine.get_frames_per_second()

	if not Input.is_key_pressed(KEY_ALT):
		return

	if Input.is_key_pressed(KEY_9):
		visible = true

	if Input.is_key_pressed(KEY_0):
		visible = false

	if Input.is_key_pressed(KEY_2):
		if time_scale < 1:
			time_scale = 1
			Engine.time_scale = 1
		else:
			time_scale = 0.3
