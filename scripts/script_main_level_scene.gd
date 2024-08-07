extends Node

#@onready var global_env = get_node("/root/GlobalEnvironment") 
var level1 = preload("res://scenes/neolevel1.tscn")
var level_instance : Node
var mutex :Mutex= null

signal mainLevelScriptReady

func _enter_tree() -> void:
	printerr("enter tree main level")

	#print(str(get_tree().current_scene))
	
func _ready():
	printerr("ready main level")
	GlobalEnvironment._main_level_scene = get_tree().current_scene
	load_level(str(GlobalEnvironment._current_level))
	mainLevelScriptReady.emit()
	#mutex = Mutex.new()
	#var thread = Thread.new()
	#print("before thread: "+str(GlobalEnvironment._main_level_scene))
	#var main_scene = GlobalEnvironment._main_level_scene
	#thread.start(testThread.bind(main_scene))

func testThread(env):
	while true:
		mutex.lock()
		print("inside thread: "+str(env))
		print("================================")
		mutex.unlock()
		OS.delay_msec(1000)

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
	if GlobalEnvironment.isPlayerInBonfire:
		if event.is_pressed() && Input.is_action_pressed("interact"):
			#heal the player
			pass
	elif GlobalEnvironment.isPlayerInVending:
		if event.is_pressed() && Input.is_action_pressed("interact"):
			#show vending buff
			pass
			
