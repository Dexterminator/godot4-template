extends Node
const BUFFER_WINDOW: int = 150
const JOY_DEADZONE: float = 0.2

var keyboard_timestamps: Dictionary
var joypad_timestamps: Dictionary


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_PAUSABLE
	keyboard_timestamps = {}
	joypad_timestamps = {}


func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		var key_event: InputEventKey = event
		if !key_event.pressed or key_event.is_echo():
			return

		var scancode := key_event.keycode
		keyboard_timestamps[scancode] = Time.get_ticks_msec()
	elif event is InputEventJoypadButton:
		var joy_event: InputEventJoypadButton = event
		if !joy_event.pressed or joy_event.is_echo():
			return

		var button_index: int = joy_event.button_index
		joypad_timestamps[button_index] = Time.get_ticks_msec()
	elif event is InputEventJoypadMotion:
		var motion_event: InputEventJoypadMotion = event
		if abs(motion_event.axis_value) < JOY_DEADZONE:
			return

		var axis_code: String = str(motion_event.axis) + "_" + str(sign(motion_event.axis_value))
		joypad_timestamps[axis_code] = Time.get_ticks_msec()


func is_action_buffer_pressed(action: String) -> bool:
	for event in InputMap.action_get_events(action):
		if event is InputEventKey:
			var key_event: InputEventKey = event
			var scancode: int = key_event.keycode
			if keyboard_timestamps.has(scancode):
				if Time.get_ticks_msec() - keyboard_timestamps[scancode] <= BUFFER_WINDOW:
					_invalidate_action(action)

					return true
		elif event is InputEventJoypadButton:
			var joy_event: InputEventJoypadButton = event
			var button_index: int = joy_event.button_index
			if joypad_timestamps.has(button_index):
				var delta: float = Time.get_ticks_msec() - joypad_timestamps[button_index]
				if delta <= BUFFER_WINDOW:
					_invalidate_action(action)
					return true
		elif event is InputEventJoypadMotion:
			var motion_event: InputEventJoypadMotion = event
			if abs(motion_event.axis_value) < JOY_DEADZONE:
				return false
			var axis_code: String = (
				str(motion_event.axis) + "_" + str(sign(motion_event.axis_value))
			)
			if joypad_timestamps.has(axis_code):
				var delta: float = Time.get_ticks_msec() - joypad_timestamps[axis_code]
				if delta <= BUFFER_WINDOW:
					_invalidate_action(action)
					return true

	return false


func _invalidate_action(action: String) -> void:
	for event in InputMap.action_get_events(action):
		if event is InputEventKey:
			var key_event: InputEventKey = event
			var scancode: int = key_event.keycode
			if keyboard_timestamps.has(scancode):
				keyboard_timestamps[scancode] = 0
		elif event is InputEventJoypadButton:
			var joy_event: InputEventJoypadButton = event
			var button_index: int = joy_event.button_index
			if joypad_timestamps.has(button_index):
				joypad_timestamps[button_index] = 0
		elif event is InputEventJoypadMotion:
			var joy_event: InputEventJoypadMotion = event
			var axis_code: String = str(joy_event.axis) + "_" + str(sign(joy_event.axis_value))
			if joypad_timestamps.has(axis_code):
				joypad_timestamps[axis_code] = 0
