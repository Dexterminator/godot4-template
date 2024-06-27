class_name State
extends Node

signal transition(next_state_name: String)
var state_machine: StateMachine


func enter(_data: Dictionary) -> void:
	pass


func exit() -> void:
	pass


func physics_process(_delta: float) -> void:
	pass


func process(_delta: float) -> void:
	pass


func transition_to(state_name: String, data := {}) -> void:
	state_machine.transition_to(state_name, data)
