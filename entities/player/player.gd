extends CharacterBody2D

const SPEED = 500.0
const JUMP_VELOCITY = -400.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var state_machine = $StateMachine


func _ready():
	state_machine.initialize("default")
