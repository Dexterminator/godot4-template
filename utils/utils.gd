class_name Utils
extends Node2D


static func lerp_smooth(from, to, delta, half_life):
	return to + (from - to) * pow(2, -delta / half_life)


static func lerp_smooth_vec(from, to, delta, half_life):
	return Vector2(
		lerp_smooth(from.x, to.x, delta, half_life), lerp_smooth(from.y, to.y, delta, half_life)
	)


static func select_keys(dict, keys):
	var res = {}
	for key in keys:
		if key in dict:
			res[key] = dict[key]
	return res


static func format_number(n):
	n = str(n)
	var size = n.length()
	var s = ""

	for i in range(size):
		if (size - i) % 3 == 0 and i > 0:
			s = str(s, ",", n[i])
		else:
			s = str(s, n[i])

	return s
