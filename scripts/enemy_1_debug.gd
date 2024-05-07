extends CharacterBody2D

var base_speed:float = 1
var max_speed:float = 200
var rng_speed:int = 0
var base_health = 40
var health_modifier = 1
var health_calculated = 0 
var base_penetration_negate = 1
var rng_direction_x:float = 0

@export var object_to_go:Node2D
@export var navigation_agent :NavigationAgent2D
var navigation_agent_path_desired_distance = 4.0
var navigation_agent_target_desired_distance = 4.0

signal on_killed()

func _ready():
	health_calculated = base_health * health_modifier
	navigation_agent.path_desired_distance = navigation_agent_path_desired_distance
	navigation_agent.target_desired_distance = navigation_agent_target_desired_distance
	call_deferred("actor_setup")

func actor_setup():
	await get_tree().physics_frame
	print(str(object_to_go))
	set_movement_target(object_to_go)
	#print("masuk actor setup")

func set_movement_target(object):
	navigation_agent.target_position = object.position

func _physics_process(delta):
	#print(navigation_agent.is_navigation_finished())
	if navigation_agent.is_navigation_finished():
		return
	var current_agent_position : Vector2 = global_position
	var next_path_position : Vector2 = navigation_agent.get_next_path_position()

	var new_velocity : Vector2 = next_path_position - current_agent_position
	new_velocity = new_velocity.normalized()
	new_velocity = new_velocity * base_speed

	velocity = new_velocity
	move_and_slide()

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
