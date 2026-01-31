extends Sprite2D

@export var move_speed: float = 220.0
@export var float_amplitude: float = 35.0
@export var float_frequency: float = 3.0

var velocity: Vector2 = Vector2(1, 1).normalized()
var time_passed: float = 0.0

func _ready():
	position = Vector2(150, 150)

func _process(delta):
	time_passed += delta
	
	position += velocity * move_speed * delta
	
	position.y += sin(time_passed * float_frequency) * float_amplitude * delta
	
	var screen_size := get_viewport_rect().size
	
	if position.x <= 0 or position.x >= screen_size.x:
		velocity.x *= -1
	if position.y <= 0 or position.y >= screen_size.y:
		velocity.y *= -1
