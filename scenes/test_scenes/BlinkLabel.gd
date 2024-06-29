extends Label


func _ready() -> void:
	Events.blink_count_updated.connect(func(count: int) -> void: text = "Blinks : %s" % count)
