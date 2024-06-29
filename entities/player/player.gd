class_name Player
extends CharacterBody2D

const SPEED = 500.0
const JUMP_VELOCITY = -400.0
var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")
var blink_count := 0

@onready var state_machine: StateMachine = $StateMachine


func _ready() -> void:
	state_machine.initialize("default")
