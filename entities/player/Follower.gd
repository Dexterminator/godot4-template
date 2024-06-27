extends Sprite2D

var current_position := global_position
@onready var o: Player = owner


func _process(delta: float) -> void:
	current_position = Utils.lerp_smooth_vec(
		current_position, o.global_position + Vector2.LEFT * 100, delta, 0.5
	)
	global_position = current_position
