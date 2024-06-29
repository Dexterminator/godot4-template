extends "res://entities/player/player_state.gd"

@warning_ignore("untyped_declaration")
var ts_started


func enter(_data: Dictionary) -> void:
	ts_started = Delta.now


func physics_process(delta: float) -> void:
	if Input.is_action_just_pressed(Actions.ACTION):
		transition_to("blinking")
		return

	if not o.is_on_floor():
		o.velocity.y += o.gravity * delta

	if o.is_on_floor() and InputBuffer.is_action_buffer_pressed(Actions.JUMP):
		o.velocity.y = o.JUMP_VELOCITY

	var direction := Input.get_axis(Actions.LEFT, Actions.RIGHT)
	if direction:
		o.velocity.x = direction * o.SPEED
	else:
		o.velocity.x = move_toward(o.velocity.x, 0, o.SPEED)

	o.move_and_slide()
