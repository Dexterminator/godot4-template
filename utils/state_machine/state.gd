extends Node

signal transition(next_state_name)
var state_machine
@onready var o = owner


func enter(_data):
	pass


func exit():
	pass


func physics_process(_delta):
	pass


func process(_delta):
	pass


func transition_to(state_name, data = {}):
	state_machine.transition_to(state_name, data)
