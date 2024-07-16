extends Node

@onready var global_env = get_node("/root/GlobalEnvironment") 

var level_instance : Node
# Called when the node enters the scene tree for the first time.
func _ready():
	load_level(str(global_env._current_level))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func load_level(level: String):
	unload_level()
	var level_path = "res://scenes/neolevel%.tscn" % level
	var level_resource = load(level_path)
	if level_instance:
		level_instance = level_resource.instantiate()
		$Main2D.add_child(level_instance)

func unload_level():
	if level_instance!= null:
		level_instance.queue_free()
	level_instance = null
	
