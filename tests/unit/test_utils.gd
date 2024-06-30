extends GutTest


func test_select_keys() -> void:
	var result := Utils.select_keys({"foo": 1, "bar": 2, "quux": 3}, ["foo", "quux"])
	assert_eq(result, {"foo": 1, "quux": 3})


func test_format_number() -> void:
	var inputs: Array[int] = [1, 10, 100, 1000, 10000, 100000, 1000000]
	var expected: Array[String] = ["1", "10", "100", "1,000", "10,000", "100,000", "1,000,000"]

	assert_eq(len(inputs), len(expected))
	for i in len(inputs):
		var res := Utils.format_number(inputs[i])
		assert_eq(res, expected[i])


func test_format_time() -> void:
	var res := Utils.format_time(87654321)
	assert_eq(res, "24:20:54.32")
