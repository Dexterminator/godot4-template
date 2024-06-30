class_name Set

var _dict: Dictionary


func _init() -> void:
	_dict = {}


func add(x: Variant) -> void:
	_dict[x] = x


func add_all(coll: Variant) -> void:
	for x: Variant in coll:
		_dict[x] = x


func has(x: Variant) -> bool:
	return x in _dict


func size() -> int:
	return len(_dict)


func items() -> Array:
	return _dict.keys()
