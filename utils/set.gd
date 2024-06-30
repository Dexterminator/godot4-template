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


func intersection(other: Set) -> Set:
	var smaller: Set
	var larger: Set
	if len(items()) > len(other.items()):
		smaller = other
		larger = self
	else:
		smaller = self
		larger = other

	var res := Set.new()
	for x: Variant in smaller.items():
		if larger.has(x):
			res.add(x)

	return res


func union(other: Set) -> Set:
	var res := Set.new()
	res.add_all(items())
	res.add_all(other.items())
	return res


func difference(other: Set) -> Set:
	var res := Set.new()
	for x: Variant in items():
		if not other.has(x):
			res.add(x)
	return res


func is_subset(other: Set) -> bool:
	for x: Variant in items():
		if not other.has(x):
			return false
	return true


func is_super_set(other: Set) -> bool:
	return other.is_subset(self)
