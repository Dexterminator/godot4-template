class_name StateMachine
extends Node

signal state_changed(current_state: String)

var current_state: State = null
var current_state_name := ""
var states_map := {}


func _ready() -> void:
	set_physics_process(false)


func initialize(start_state_name: String, data := {}) -> void:
	for state: State in get_children():
		state.state_machine = self
		states_map[state.name] = state
	current_state_name = start_state_name
	current_state = states_map[start_state_name]
	current_state.enter(data)
	set_physics_process(true)


func _physics_process(delta: float) -> void:
	current_state.physics_process(delta)


func _process(delta: float) -> void:
	current_state.process(delta)


func transition_to(state_name: String, data := {}) -> void:
	var previous_state_name := current_state_name
	current_state.exit()
	current_state = states_map[state_name]
	current_state_name = state_name
	current_state.enter(data)
	emit_signal("state_changed", previous_state_name, state_name)
