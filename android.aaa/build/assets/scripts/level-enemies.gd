extends Node2D

@export var object_to_go: Node2D
@export var movement_speed: float = 200.0

var navigation_agent_path_desired_distance = 4
var navigation_agent_target_desired_distance = 4
var navigation_agents = []

func _ready():
	navigation_agents = $".".get_children()
	call_deferred("actor_setup")
	
func actor_setup():
	await get_tree().physics_frame
	
	set_movement_target(object_to_go)

func set_movement_target(object_to_go):
	if navigation_agents.size() > 0:
		((navigation_agents[0] as CharacterBody2D).get_children()[2] as NavigationAgent2D).target_position = object_to_go.global_position

func _physics_process(delta):
	#if navigation_agents[0].get_child(2).is_navigation_finished():
		#return
	pass
	
	
