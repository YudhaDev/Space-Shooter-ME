extends CharacterBody2D

var base_speed:float = 1
var max_speed:float = 5
var rng_speed:int = 0
var base_health = 40
var health_modifier = 1
var health_calculated = 0 
var base_penetration_negate = 1
var rng_direction_x:float = 0

signal on_killed()

func _ready():
	health_calculated = base_health * health_modifier
	pass
	
func _process(_delta):
	#position += Vector2(rng_direction_x,1) * rng_speed
	#move_and_slide()
	pass
func getHit(damage:float, projectile_penetration:int):
	#print("damage"+str(damage)+", penetration"+str(projectile_penetration))
	health_calculated -= damage
	#print(health_calculated)
	if health_calculated <= 0:
		destroy()
	
	return projectile_penetration - base_penetration_negate
	
func destroy():
	queue_free()

func _on_area_2d_body_entered(body):
	#body.get_parent().rotate(90)
	#print(body)
	pass
