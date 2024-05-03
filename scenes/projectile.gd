extends Area2D

@export var projectile_speed := 480.0
var projectile_base_damage := 40
var projectile_base_penetration = 1 
var projectile_penetration_multiplier = 1
var calculated_penetration = 0


func setup(trans : Transform2D):
	transform = trans
	
func _ready():
	calculated_penetration = projectile_base_penetration * projectile_penetration_multiplier	

func _physics_process(delta):
	position += transform.x * projectile_speed * delta
		
func _on_body_entered(body):
	print(body)
	if body.is_in_group("enemy"):
		calculated_penetration = body.getHit(projectile_base_damage, calculated_penetration)
		print("musuh tertembak")
		print(calculated_penetration)
		if calculated_penetration == 0:
			queue_free()
			print(calculated_penetration)
			print("projectile hancur")
 
