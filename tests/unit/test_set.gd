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


func test_intersection() -> void:
	var s1 := Set.new()
	var s2 := Set.new()
	s1.add_all([1, 2, 3])
	s2.add_all([2, 3, 4, 5])
	var res := s1.intersection(s2)
	var items := res.items()
	items.sort()
	assert_eq(items, [2, 3])


func test_intersection_returns_empty_set_when_no_items_in_common() -> void:
	var s1 := Set.new()
	var s2 := Set.new()
	s1.add_all([1, 2, 3, 4])
	s2.add_all([5, 6, 7])
	var res := s1.intersection(s2)
	assert_eq(res.size(), 0)


func test_union() -> void:
	var s1 := Set.new()
	var s2 := Set.new()
	s1.add_all([1, 2, 3, 4, 5])
	s2.add_all([5, 6, 7])
	var res := s1.union(s2)
	var items := res.items()
	items.sort()
	assert_eq(res.size(), 7)
	assert_eq(items, [1, 2, 3, 4, 5, 6, 7])


func test_is_subset() -> void:
	var s1 := Set.new()
	var s2 := Set.new()
	var s3 := Set.new()
	s1.add_all([1, 2])
	s2.add_all([1, 2, 3])
	s3.add_all([1, 2, 3, 4])
	assert_true(s1.is_subset(s2))
	assert_true(s2.is_subset(s3))
	assert_false(s2.is_subset(s1))
	assert_false(s3.is_subset(s2))


func test_is_super_set() -> void:
	var s1 := Set.new()
	var s2 := Set.new()
	var s3 := Set.new()
	s1.add_all([1, 2])
	s2.add_all([1, 2, 3])
	s3.add_all([1, 2, 3, 4])
	assert_true(s2.is_super_set(s1))
	assert_true(s3.is_super_set(s2))
	assert_false(s1.is_super_set(s2))
	assert_false(s2.is_super_set(s3))


func test_difference() -> void:
	var s1 := Set.new()
	var s2 := Set.new()
	s1.add_all([1, 2, 3])
	s2.add_all([2])
	var res := s1.difference(s2)
	var items := res.items()
	items.sort()
	assert_eq(items, [1, 3])
