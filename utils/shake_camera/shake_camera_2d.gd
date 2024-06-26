extends Camera2D

const NOISE_SPEED = 10

@export var decay: float = 0.5
@export var amplitude: float = 15.0
var trauma = 0.0
var trauma_power = 3
var _noise_y = 0

@onready var noise = FastNoiseLite.new()


func _ready():
	randomize()
	noise.seed = randi()
	noise.noise_type = FastNoiseLite.TYPE_PERLIN
	Events.shake.connect(_add_trauma)


func _physics_process(delta):
	if trauma:
		trauma = max(trauma - decay * delta, 0)
		_noise_y += NOISE_SPEED
		_shake()


func _add_trauma(amount: float):
	trauma = min(trauma + amount, 1.0)


func _shake():
	var amount = pow(trauma, trauma_power)
	offset.x = amplitude * amount * noise.get_noise_2d(noise.seed, _noise_y)
	offset.y = amplitude * amount * noise.get_noise_2d(noise.seed * 2, _noise_y)
