extends CanvasLayer

var time_scale := 1.0
@onready var fps_label: Label = $MarginContainer/FpsLabel
@onready var menu: PanelContainer = $DebugMenu
@onready
var fps_checkbox: CheckBox = $DebugMenu/MarginContainer/VBoxContainer/HBoxContainer/FpsCheckbox


func _ready() -> void:
	if not OS.is_debug_build():
		visible = false

	fps_label.visible = false
	menu.visible = false
	fps_checkbox.toggled.connect(func(toggled_on: bool) -> void: fps_label.visible = toggled_on)


func _process(_delta: float) -> void:
	if OS.is_debug_build() and time_scale < 1:
		Engine.time_scale = time_scale


func _input(_event: InputEvent) -> void:
	if not OS.is_debug_build():
		return

	if fps_label.visible:
		fps_label.text = "FPS: %s" % Engine.get_frames_per_second()

	if not Input.is_key_pressed(KEY_ALT):
		return

	if Input.is_key_pressed(KEY_9):
		menu.visible = true

	if Input.is_key_pressed(KEY_0):
		menu.visible = false

	if Input.is_key_pressed(KEY_2):
		if time_scale < 1:
			time_scale = 1
			Engine.time_scale = 1
		else:
			time_scale = 0.3
