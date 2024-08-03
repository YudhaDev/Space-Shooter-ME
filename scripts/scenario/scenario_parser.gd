extends Node

#var scenario_dialog_engine = preload("res://scenes/ui/script_dialogue_scene.gd").new()
var dialog_scene = null

var index_now = 0
var threadParser :Thread = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print(str(GlobalEnvironment._main_level_scene))
	#dialog_scene = GlobalEnvironment._main_level_scene.find_child("dialog", true, false).get_script()
	if threadParser == null:
		threadParser = Thread.new()
	printerr(str(GlobalEnvironment._main_level_scene))
	var dialog_scene_script = GlobalEnvironment._main_level_scene.find_child("dialog", true, false).get_script()
	dialog_scene = dialog_scene_script.new()
	dialog_scene.connect("job_done", job_done)
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func job_done():
	pass

func parse(array : Array):
	if threadParser == null:
		threadParser = Thread.new()
		
	if GlobalEnvironment._main_level_scene != null and dialog_scene == null:
		var dialog_scene_script = GlobalEnvironment._main_level_scene.find_child("dialog", true, false).get_script()
		dialog_scene = dialog_scene_script.new()
	else:
		printerr("main level scene is null")
	for arr in array:
		var format = arr[0].split(":")
		var value = arr[1]
		#print(str(GlobalEnvironment._main_level_scene.find_child("dialog", true, false).get_script()))
		#var a = dialog_scene.new()
		#a.fadeIn()
		match format[2]:
			"fade_in":
				threadParser.start(dialog_scene.fadeIn)
				#dialog_scene.fadeIn()
			"fade_out":
				dialog_scene.fadeOut()
			"narration":
				dialog_scene.middleFormat()
			"background":
				#set background
				pass
			"x":
				#do nothing
				pass
			"":
				#do nothing
				pass
	pass

func _exit_tree() -> void:
	threadParser.wait_to_finish()
