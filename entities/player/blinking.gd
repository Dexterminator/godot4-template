extends "res://entities/player/player_state.gd"

var ts_started: float


func enter(_data: Dictionary) -> void:
	ts_started = Delta.now
	var tween := create_tween()
	tween.tween_property(o, "modulate:a", 0, 0.5)
	tween.tween_property(o, "modulate:a", 1, 0.5)


func physics_process(_delta: float) -> void:
	Events.shake.emit(0.9)
	if Delta.exceeded(ts_started, 1):
		transition_to("default")
