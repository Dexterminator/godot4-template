extends Camera2D

@export var decay := 0.5  #How quickly shaking will stop [0,1].
@export var max_offset := Vector2(100, 75)  #Maximum displacement in pixels.
@export var max_roll := 0.1  #Maximum rotation in radians (use sparingly).
@export var noise: FastNoiseLite  #The source of random values.

var noise_y := 0  #Value used to move through the noise

var trauma := 0.0  #Current shake strength
var trauma_pwr := 3  #Trauma exponent. Use [2,3]


func _ready() -> void:
	randomize()
	noise = FastNoiseLite.new()
	noise.noise_type = FastNoiseLite.TYPE_SIMPLEX
	noise.seed = randi()
	Events.shake.connect(_add_trauma)


func _add_trauma(amount: float, max_amount: float) -> void:
	var new_trauma: float = min(trauma + amount, max_amount)
	if new_trauma > trauma:
		trauma = min(trauma + amount, 1.0)


func _process(delta: float) -> void:
	if trauma:
		trauma = max(trauma - decay * delta, 0)
		_shake()
	#optional
	# elif offset.x != 0 or offset.y != 0 or rotation != 0:
	# 	lerp(offset.x, 0.0, 1)
	# 	lerp(offset.y, 0.0, 1)
	# 	lerp(rotation, 0.0, 1)


func _shake() -> void:
	var amt: float = pow(trauma, trauma_pwr) * 5
	noise_y += 1
	rotation = max_roll * amt * noise.get_noise_2d(0, noise_y)
	offset.x = max_offset.x * amt * noise.get_noise_2d(1000, noise_y)
	offset.y = max_offset.y * amt * noise.get_noise_2d(2000, noise_y)
