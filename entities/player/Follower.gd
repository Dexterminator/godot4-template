extends Sprite2D

var current_position = global_position


func _process(delta):
	current_position = Utils.lerp_smooth_vec(
		current_position, owner.global_position + Vector2.LEFT * 100, delta, 0.5
	)
	global_position = current_position
