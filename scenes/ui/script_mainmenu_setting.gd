extends Control
signal setting_back_signal

var slider_bgm :HSlider= null
var slider_sfx :HSlider= null

@onready var bgm_object :AudioStreamPlayer= get_tree().root.find_child("bgm", true, false)
@onready var sfx_object :AudioStreamPlayer= get_tree().root.find_child("sfx", true, false)

@onready var label_language_value :Label = get_tree().current_scene.find_child("label_language_value", true, false)

var delta_stack :float = 0

var temp_language = ""
var temp_fps = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	slider_bgm = find_child("slider_bgm", true, false)
	slider_sfx = find_child("slider_sfx", true, false)
	
	slider_bgm.value = GlobalEnvironment._bgm_volume
	slider_sfx.value = GlobalEnvironment._sfx_volume
	
	#update label language and fps
	label_language_value.text = GlobalEnvironment.language_dictionary.get(GlobalEnvironment._current_lang)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if delta_stack <= 0.5:
		delta_stack += delta
	else:
		GlobalEnvironment._bgm_volume = slider_bgm.value
		GlobalEnvironment._sfx_volume = slider_sfx.value
		updateTheVolume()
		delta_stack = 0
	#print("delta: "+str(delta))
	#print("delta stacks: "+str(delta_stack))
	
	#if DebugVars.enable_print_debug:
		#print("bgm: "+str(slider_bgm.value)+", sfx: "+str(slider_sfx.value))
func updateTheVolume():
	bgm_object.volume_db = slider_bgm.value
	sfx_object.volume_db = slider_sfx.value
	

func _on_back_btn_button_up() -> void:
	setting_back_signal.emit()

func languageHandler(string_cmd:String):
	match string_cmd.to_lower():
		"next":
			var bla = GlobalEnvironment.language_dictionary.get(GlobalEnvironment._current_lang)
			print("bla: "+str(GlobalEnvironment.language_dictionary.keys().find(GlobalEnvironment._current_lang)))
		"prev":
			pass

func _on_language_panel_next_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_released():
			GlobalSfxEngine.playSfx("default")
			languageHandler("next")


func _on_language_panel_prev_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_released():
			GlobalSfxEngine.playSfx("default")
			languageHandler("prev")
