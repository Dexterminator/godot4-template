extends Node

const JUMP = "jump"
const LEFT = "left"
const RIGHT = "right"


func _pad_input_event(device_index, button_index):
	var event = InputEventJoypadButton.new()
	event.set_button_index(button_index)
	event.device = device_index
	return event


func _pad_input_event_axis(device_index, axis, axis_value):
	var event = InputEventJoypadMotion.new()
	event.set_axis(axis)
	event.set_axis_value(axis_value)
	event.device = device_index
	return event


func _key_input_event(key):
	var event = InputEventKey.new()
	event.keycode = key
	return event


func _add_key_event(action_name, key):
	InputMap.action_add_event(action_name, _key_input_event(key))


func _add_pad_event(action_name, device, button):
	InputMap.action_add_event(action_name, _pad_input_event(device, button))


func _add_event(action_name, key, button):
	_add_key_event(action_name, key)
	_add_pad_event(action_name, 0, button)


func _ready():
	for action in [LEFT, RIGHT, JUMP]:
		InputMap.add_action(action)

	_add_event(RIGHT, KEY_D, JOY_BUTTON_DPAD_RIGHT)
	_add_event(LEFT, KEY_A, JOY_BUTTON_DPAD_RIGHT)
	_add_event(JUMP, KEY_SPACE, JOY_BUTTON_A)
