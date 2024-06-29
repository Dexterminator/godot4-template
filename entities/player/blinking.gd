extends "res://entities/player/player_state.gd"

var ts_started: float


func enter(_data: Dictionary) -> void:
	ts_started = Delta.now
	var tween := create_tween()
	tween.tween_property(o, "modulate:a", 0, 0.2)
	tween.tween_property(o, "modulate:a", 1, 0.2)
	o.blink_count += 1
	Events.blink_count_updated.emit(o.blink_count)


func physics_process(_delta: float) -> void:
	if Delta.exceeded(ts_started, 1):
		transition_to("default")


func exit() -> void:
	Slowdown.start(1)
