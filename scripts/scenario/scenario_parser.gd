extends Node

#var scenario_dialog_engine = preload("res://scenes/ui/script_dialogue_scene.gd").new()
#var dialog_scene = null
var dialog_scene_script = null

var index_now = 0
var index_total = 0

var threadParser :Thread = null
var mutexParser : Mutex = null

signal doSomething(string_command)

func _init() -> void:
	#print("masuk init scenario parser")
	#printerr("ini dari parser"+str(GlobalEnvironment._main_level_scene))
	#dialog_scene_script = GlobalEnvironment._hud_element.find_child("dialog", true, false).get_script().new()
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	printerr("masuk ready scenario parser")
	#dialog_scene = dialog_scene_script.new()
	#dialog_scene.connect("job_done", job_done)
	#dialog_scene_script = GlobalEnvironment._hud_element.find_child("dialog", true, false).get_script().new()
	#print(str(dialog_scene_script.connect("fade_finished", animation_finished)))
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func siapkanScriptIni():
	dialog_scene_script = GlobalEnvironment._hud_element.find_child("dialog", true, false)
	dialog_scene_script.connect("fade_finished", animation_finished)

func animation_finished():
	printerr("animasi sudah selesai cuy")

func job_done():
	pass

func parse(array : Array):
	if dialog_scene_script == null:
		siapkanScriptIni()
		
	if threadParser == null:
		threadParser = Thread.new()

	for arr in array:
		var format = arr[0].split(":")
		var value = arr[1]
		#print(str(GlobalEnvironment._main_level_scene.find_child("dialog", true, false).get_script()))
		#var a = dialog_scene.new()
		#a.fadeIn()
		match format[2]:
			"fade_in":
				doSomething.emit("fadeIn")
				#dialog_scene_script.fadeIn()
				#print("sebelum thread" + str(GlobalEnvironment._main_level_scene))
				#call_deferred("sayHello")
				#threadParser.start(
					#sayHello
				#)
				#threadParser.start(dialog_scene.fadeIn)
				#dialog_scene.fadeIn()
			"fade_out":
				dialog_scene_script.fadeOut()
			"narration":
				dialog_scene_script.middleFormat()
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
	
func sayHello():
	while true:
		print("hello from thread"+str(GlobalEnvironment._main_level_scene))
		OS.delay_msec(250)

func _exit_tree() -> void:
	threadParser.wait_to_finish()
