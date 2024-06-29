extends CanvasLayer

const TestScene = preload("res://scenes/test_scenes/test.tscn")
const FADE_DURATION = 0.2

var fade_out_tween: Tween
var fade_in_tween: Tween
var color_rect: ColorRect
var current_scene: Node


func _ready() -> void:
	color_rect = ColorRect.new()
	add_child(color_rect)
	color_rect.size = get_viewport().get_visible_rect().size
	color_rect.color = Color.BLACK
	color_rect.modulate.a = 0


func _fade(value: float) -> Tween:
	var tween := create_tween()
	tween.tween_property(color_rect, "modulate:a", value, FADE_DURATION)
	return tween


func _unload_current() -> void:
	var root := get_tree().get_root()
	root.remove_child(current_scene)
	current_scene.queue_free()


func _load_new(new_scene: PackedScene) -> void:
	var root := get_tree().get_root()
	current_scene = new_scene.instantiate()
	root.add_child(current_scene)


func _disable_current() -> void:
	current_scene.set_physics_process(false)
	current_scene.set_process(false)


func change_scene(new_scene: PackedScene) -> void:
	assert(current_scene)
	_disable_current()
	await _fade(1).finished
	_unload_current()
	_load_new(new_scene)
	_fade(0)
