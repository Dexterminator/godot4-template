extends CanvasLayer

var time_scale := 1.0
var ts_timer_started := -1
@onready var fps_label: Label = $MarginContainer/VBoxContainer/FpsLabel
@onready var timer_label: Label = $MarginContainer/VBoxContainer/TimerLabel
@onready var menu: PanelContainer = $DebugMenu
@onready
var fps_checkbox: CheckBox = $DebugMenu/MarginContainer/VBoxContainer/HBoxContainer/FpsCheckbox
@onready
var timer_checkbox: CheckBox = $DebugMenu/MarginContainer/VBoxContainer/HBoxContainer2/TimerCheckbox


func _toggle_timer(toggled_on: bool) -> void:
	if toggled_on:
		timer_label.visible = true
		ts_timer_started = Time.get_ticks_msec()
		menu.visible = false
	else:
		timer_label.visible = false


func _ready() -> void:
	if not OS.is_debug_build():
		visible = false

	fps_label.visible = false
	timer_label.visible = false
	menu.visible = false
	fps_checkbox.toggled.connect(func(toggled_on: bool) -> void: fps_label.visible = toggled_on)
	timer_checkbox.toggled.connect(_toggle_timer)


func _process(_delta: float) -> void:
	if OS.is_debug_build() and time_scale < 1:
		Engine.time_scale = time_scale
	if timer_label.visible:
		var time_elapsed := Time.get_ticks_msec() - ts_timer_started
		timer_label.text = Utils.format_time(time_elapsed)

	if fps_label.visible:
		fps_label.text = "FPS: %s" % Engine.get_frames_per_second()


func _input(_event: InputEvent) -> void:
	if not OS.is_debug_build():
		return

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

	if Input.is_key_pressed(KEY_3):
		get_tree().reload_current_scene()
