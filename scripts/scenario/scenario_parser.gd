extends Node

#var scenario_dialog_engine = preload("res://scenes/ui/script_dialogue_scene.gd").new()
#var dialog_scene = null
var dialog_scene_script = null

var index_now = 0
var index_max = 0

var threadParser :Thread = null
var mutexParser : Mutex = null

var array_scenario : Array = []

signal doSomething(string_command)

func _init() -> void:
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func siapkanScriptIni():
	dialog_scene_script = GlobalEnvironment._hud_element.find_child("dialog", true, false)
	dialog_scene_script.connect("fade_finished", animation_finished)
	dialog_scene_script.connect("job_done", job_done)

func animation_finished():
	print("animasi selesai")
	nextIndex()

func job_done():
	print("job selesai")
	nextIndex()

func nextIndex():
	if (index_now + 1) < index_max:
		index_now +=1
		#do conversation
		printerr("next phase")
		parse(array_scenario)
	else:
		printerr("end phase")
		end()

func end():
	#todo list
	#hide semua dialog ui
	GlobalEnvironment._dialog_scene.find_child("dialog_formats", true, false).visible = false
	#resume level
	pass

func start(array : Array):
	index_now = 0
	index_max = array.size()
	array_scenario = array
	print("array max %" + str(index_max))
	parse(array_scenario)

func parse(array : Array):
	if dialog_scene_script == null:
		siapkanScriptIni()
		
	if threadParser == null:
		threadParser = Thread.new()
	var array_now = array[index_now]
	var format = array_now[0].split(":")
	var value = array_now[1]
	
	#match format[2]:
		#"fade_in":
			#doSomething.emit(format[2], value)
		#"fade_out":
			#dialog_scene_script.fadeOut()
		#"narration":
			#doSomething.emit(format[2], value)
		#"conversation":
			#doSomething.emit(format[2], value)
		#"background":
			##set background
			#doSomething.emit(for)
			#pass
		#"x":
			##do nothing
			#pass
		#"":
			##do nothing
			#pass
		#_:
			#pass
			
	doSomething.emit(format[2], value)
	
func sayHello():
	while true:
		print("hello from thread"+str(GlobalEnvironment._main_level_scene))
		OS.delay_msec(250)

func _exit_tree() -> void:
	threadParser.wait_to_finish()
