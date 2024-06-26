extends "res://utils/state_machine/state.gd"

var ts_started


func enter(_data):
	ts_started = Delta.now


func physics_process(delta):
	if Input.is_action_just_pressed(Actions.ACTION):
		transition_to("blinking")
		return

	if not o.is_on_floor():
		o.velocity.y += o.gravity * delta

	if Input.is_action_just_pressed(Actions.JUMP) and o.is_on_floor():
		o.velocity.y = o.JUMP_VELOCITY

	var direction = Input.get_axis(Actions.LEFT, Actions.RIGHT)
	if direction:
		o.velocity.x = direction * o.SPEED
	else:
		o.velocity.x = move_toward(o.velocity.x, 0, o.SPEED)

	o.move_and_slide()
