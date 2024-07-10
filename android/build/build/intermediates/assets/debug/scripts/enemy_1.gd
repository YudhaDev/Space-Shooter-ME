extends CharacterBody2D

var base_health: float = 40
var base_speed:float = 1
var max_speed:float = 5
var rng_speed:int = 0

var rng_direction_x:float = 0

func _ready():
	var rng = RandomNumberGenerator.new()
	#ambil besar layar width
	var width = get_viewport().get_visible_rect().size[0]
	var randX = rng.randi_range(0, width)
	var randY = 0
	position = Vector2(randX, randY)
	rng_speed = rng.randf_range(base_speed, max_speed)
	rng_direction_x = rng.randf_range(-1,1)
	
func _process(_delta):
	position += Vector2(rng_direction_x,1) * rng_speed
	move_and_slide()

func getHit(damage:float):
	base_health -= damage
	if base_health <= 0.0 :
		queue_free()

func _on_area_2d_body_entered(body):
	#body.get_parent().rotate(90)
	#print(body)
	pass
