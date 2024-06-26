class_name Utils
extends Node2D


static func lerp_smooth(from, to, delta, half_life):
	return to + (from - to) * pow(2, -delta / half_life)


static func lerp_smooth_vec(from, to, delta, half_life):
	return Vector2(
		lerp_smooth(from.x, to.x, delta, half_life), lerp_smooth(from.y, to.y, delta, half_life)
	)
