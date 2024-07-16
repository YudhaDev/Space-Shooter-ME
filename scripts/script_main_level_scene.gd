extends Node

@onready var global_env = get_node("/root/GlobalEnvironment") 
var level1 = preload("res://scenes/neolevel1.tscn")
signal showVendingBuff

var level_instance : Node
# Called when the node enters the scene tree for the first time.
func _ready():
	load_level(str(global_env._current_level))

	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	interactHandling(event)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func load_level(level: String):
	unload_level()
	var level_path = "res://scenes/neolevel"+level+".tscn"
	print("level path:" +level_path)
	var level_resource := load(level_path)
	if level_instance == null:
		level_instance = level_resource.instantiate()
		$Main2D.add_child(level_instance)
		print("level loaded"+str(level_instance))
	
func unload_level():
	if level_instance!= null:
		level_instance.queue_free()
	level_instance = null

func interactHandling(event : InputEvent) -> void:
	if global_env.isPlayerInBonfire:
		if event.is_pressed() && Input.is_action_pressed("interact"):
			#heal the player
			pass
	elif global_env.isPlayerInVending:
		if event.is_pressed() && Input.is_action_pressed("interact"):
			#show vending buff
			showVendingBuff.emit()
			pass
			
