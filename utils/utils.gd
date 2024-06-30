class_name Utils
extends Node2D


static func lerp_smooth(from: float, to: float, delta: float, half_life: float) -> float:
	return to + (from - to) * pow(2, -delta / half_life)


static func lerp_smooth_vec(from: Vector2, to: Vector2, delta: float, half_life: float) -> Vector2:
	return Vector2(
		lerp_smooth(from.x, to.x, delta, half_life), lerp_smooth(from.y, to.y, delta, half_life)
	)


static func select_keys(dict: Dictionary, keys: Array) -> Dictionary:
	var res := {}
	for key: Variant in keys:
		if key in dict:
			res[key] = dict[key]
	return res


static func format_number(n: int) -> String:
	var n_str := str(n)
	var size := n_str.length()
	var s := ""

	for i in range(size):
		if (size - i) % 3 == 0 and i > 0:
			s = str(s, ",", n_str[i])
		else:
			s = str(s, n_str[i])

	return s


static func spawn(factory: PackedScene, parent: Node2D, pos: Vector2) -> Node2D:
	var node: Node2D = factory.instantiate()
	node.global_position = pos
	parent.add_child(node)
	return node


static func wait_timer(parent: Node2D, wait_time: float) -> Timer:
	var timer := Timer.new()
	parent.add_child(timer)
	timer.wait_time = wait_time
	timer.one_shot = true
	timer.timeout.connect(timer.queue_free)
	timer.start()
	return timer


static func shake(amount: float, max_amount: float) -> void:
	Events.shake.emit(amount, max_amount)


static func slowdown(duration := 0.4, strength := 0.9) -> void:
	Slowdown.start(duration, strength)


static func format_time(time_msec: int) -> String:
	var total_seconds := time_msec / 1000.0
	var seconds: float = fmod(total_seconds, 60.0)
	var minutes: int = int(total_seconds / 60.0) % 60
	var hours: int = int(total_seconds / 3600.0)
	var time_string: String = "%02d:%02d:%05.2f" % [hours, minutes, seconds]
	return time_string
