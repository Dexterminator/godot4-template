extends GutTest


func test_set() -> void:
	var s := Set.new()
	s.add(1)
	s.add(1)
	s.add(2)
	s.add(3)
	s.add_all([1, 4, 5])
	var items := s.items()
	items.sort()
	var expected := [1, 2, 3, 4, 5]
	assert_eq(items, expected)
	for x: int in expected:
		assert_true(s.has(x))
	assert_false(s.has(6))
	assert_eq(s.size(), 5)
