extends Node

const END_VALUE = 1
var time_start: float
var duration_ms: float
var start_value: float


func _ready() -> void:
	Engine.time_scale = 1
	set_process(false)


func start(duration: float, strength: float) -> void:
	time_start = Time.get_ticks_msec()
	duration_ms = duration * 1000
	start_value = 1 - strength
	Engine.time_scale = start_value
	set_process(true)


func _circ_ease_in(t: float, b: float, c: float, d: float) -> float:
	t /= d
	return -c * (sqrt(1 - t * t) - 1) + b


func _process(_delta: float) -> void:
	var current_time := Time.get_ticks_msec() - time_start
	var value := _circ_ease_in(current_time, start_value, END_VALUE, duration_ms)
	if current_time >= duration_ms:
		set_process(false)
		value = END_VALUE
	Engine.time_scale = value
