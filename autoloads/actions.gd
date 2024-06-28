extends Node

const JUMP := "jump"
const LEFT := "left"
const RIGHT := "right"
const ACTION := "action"


func _pad_input_event(device_index: int, button_index: int) -> InputEventJoypadButton:
	var event := InputEventJoypadButton.new()
	event.set_button_index(button_index)
	event.device = device_index
	return event


func _pad_input_event_axis(device_index: int, axis: int, axis_value: int) -> InputEventJoypadMotion:
	var event := InputEventJoypadMotion.new()
	event.set_axis(axis)
	event.set_axis_value(axis_value)
	event.device = device_index
	return event


func _key_input_event(key: Key) -> InputEventKey:
	var event := InputEventKey.new()
	event.keycode = key
	return event


func _add_key_event(action_name: String, key: Key) -> void:
	InputMap.action_add_event(action_name, _key_input_event(key))


func _add_pad_event(action_name: String, device: int, button: JoyButton) -> void:
	InputMap.action_add_event(action_name, _pad_input_event(device, button))


func _add_event(action_name: String, key: Key, button: JoyButton) -> void:
	_add_key_event(action_name, key)
	_add_pad_event(action_name, 0, button)


func _ready() -> void:
	for action: String in [LEFT, RIGHT, JUMP, ACTION]:
		InputMap.add_action(action)

	_add_event(RIGHT, KEY_D, JOY_BUTTON_DPAD_RIGHT)
	_add_event(LEFT, KEY_A, JOY_BUTTON_DPAD_RIGHT)
	_add_event(JUMP, KEY_SPACE, JOY_BUTTON_A)
	_add_event(ACTION, KEY_J, JOY_BUTTON_X)
	_add_key_event("ui_up", KEY_W)
	_add_key_event("ui_down", KEY_S)
	_add_key_event("ui_left", KEY_A)
	_add_key_event("ui_right", KEY_D)
