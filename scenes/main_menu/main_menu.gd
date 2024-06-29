extends Node2D

@onready var start_game_button: Button = $CenterContainer/VBoxContainer/StartGameButton
@onready var exit_game_button: Button = $CenterContainer/VBoxContainer/ExitGameButton


func _quit() -> void:
	await get_tree().create_timer(0.1).timeout
	get_tree().quit()


func _start_game() -> void:
	SceneManager.change_scene(SceneManager.TestScene)


func _ready() -> void:
	SceneManager.current_scene = self
	start_game_button.grab_focus()
	start_game_button.pressed.connect(_start_game)
	exit_game_button.pressed.connect(_quit)
