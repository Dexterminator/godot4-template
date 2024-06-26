extends "res://utils/state_machine/state.gd"

var ts_started


func enter(_data):
	ts_started = Delta.now
	var tween = create_tween()
	tween.tween_property(o, "modulate:a", 0, 0.5)
	tween.tween_property(o, "modulate:a", 1, 0.5)


func physics_process(_delta):
	Events.shake.emit(0.9)
	if Delta.exceeded(ts_started, 1):
		transition_to("default")
