extends "res://entities/player/player_state.gd"

var ts_started: float


func enter(_data: Dictionary) -> void:
	ts_started = Delta.now
	o.blink_count += 1
	(o.sprite.material as ShaderMaterial).set_shader_parameter("flash_strength", 1)
	Events.blink_count_updated.emit(o.blink_count)


func physics_process(_delta: float) -> void:
	if Delta.exceeded(ts_started, 0.2):
		transition_to("default")


func exit() -> void:
	(o.sprite.material as ShaderMaterial).set_shader_parameter("flash_strength", 0)
	Utils.slowdown(1)
