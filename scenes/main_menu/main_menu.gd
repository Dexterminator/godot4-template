extends Node2D

@onready var start_game_button: Button = $CenterContainer/VBoxContainer/StartGameButton
@onready var exit_game_button: Button = $CenterContainer/VBoxContainer/ExitGameButton


func _quit() -> void:
	await get_tree().create_timer(0.1).timeout
	get_tree().quit()


func _ready() -> void:
	start_game_button.grab_focus()
	start_game_button.pressed.connect(func() -> void: print("pressed!"))
	exit_game_button.pressed.connect(_quit)
