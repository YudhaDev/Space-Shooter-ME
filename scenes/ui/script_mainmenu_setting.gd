extends Control
signal setting_back_signal

var slider_bgm :HSlider= null
var slider_sfx :HSlider= null

@onready var bgm_object :AudioStreamPlayer= get_tree().root.find_child("bgm", true, false)
@onready var sfx_object :AudioStreamPlayer= get_tree().root.find_child("sfx", true, false)

@onready var label_language_value :Label = get_tree().current_scene.find_child("label_language_value", true, false)
@onready var label_fps_value :Label = get_tree().current_scene.find_child("label_fps_value", true, false)

var delta_stack :float = 0

@onready var temp_language = GlobalEnvironment._current_lang
@onready var temp_fps = GlobalEnvironment._current_fps

signal doneSavingSetting
signal doneLoadingSaving

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	slider_bgm = find_child("slider_bgm", true, false)
	slider_sfx = find_child("slider_sfx", true, false)
	
	slider_bgm.value = GlobalEnvironment._bgm_volume
	slider_sfx.value = GlobalEnvironment._sfx_volume
	
	#update label language and fps
	label_language_value.text = GlobalEnvironment.language_dictionary.get(GlobalEnvironment._current_lang)
	label_fps_value.text = str(GlobalEnvironment.fps_dictionary.get(GlobalEnvironment._current_fps))
	connect("visibility_changed", refreshUi)
	loadSettingLocally()
	
	
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

func saveSettingLocally():
	#get yang mau disimpan
	var setting_to_be_saved :Dictionary = {
		"_sfx_volume" : GlobalEnvironment._sfx_volume,
		"_bgm_volume" : GlobalEnvironment._bgm_volume,
		"_current_lang" : GlobalEnvironment._current_lang,
		"_current_fps" : GlobalEnvironment._current_fps
	}
	
	if DebugVars.enable_print_debug:
		print("Saving setting")
	var setting_save_file := FileAccess.open("user://setting_save.save", FileAccess.WRITE)
	var json_string = JSON.stringify(setting_to_be_saved)
	setting_save_file.store_line(json_string)
	doneSavingSetting.emit()

func loadSettingLocally():
	if not FileAccess.file_exists("user://setting_save.save"):
		printerr("No setting saves")
		return
	var setting_save_file := FileAccess.open("user://setting_save.save", FileAccess.READ)
	while setting_save_file.get_position() < setting_save_file.get_length():
		var json_string  = setting_save_file.get_line()
		var json := JSON.new()
		
		var parsed_string := json.parse(json_string)
		if not parsed_string == OK:
			printerr("error parsing json in load setting.")
			continue
		var setting_dictionary :Dictionary= json.get_data()
		
		GlobalEnvironment._sfx_volume = setting_dictionary.get("_sfx_volume")
		GlobalEnvironment._bgm_volume = setting_dictionary.get("_bgm_volume")
		GlobalEnvironment._current_lang = setting_dictionary.get("_current_lang")
		GlobalEnvironment._current_fps = setting_dictionary.get("_current_fps")
	refreshUi()
	doneLoadingSaving.emit()

func _on_back_btn_button_up() -> void:
	setting_back_signal.emit()
	
func _on_apply_btn_button_up() -> void:
	GlobalEnvironment._current_lang = temp_language
	GlobalEnvironment._current_fps = temp_fps
	GlobalEnvironment._bgm_volume = slider_bgm.value
	GlobalEnvironment._sfx_volume = slider_sfx.value
	saveSettingLocally()

func languageHandler(string_cmd:String):
	var current_index = GlobalEnvironment.language_dictionary.keys().find(temp_language)
	var size = GlobalEnvironment.language_dictionary.keys().size()
	match string_cmd.to_lower():
		"next":
			if current_index >= size-1:
				current_index = 0
			else:
				current_index +=1

		"prev":
			if current_index <= 0:
				current_index = size-1
			else: 
				current_index -= 1
	#update the ui
	label_language_value.text = GlobalEnvironment.language_dictionary.get(GlobalEnvironment.language_dictionary.keys()[current_index])
	temp_language = GlobalEnvironment.language_dictionary.keys()[current_index]

func fpsHandler(string_cmd:String):
	var current_index = GlobalEnvironment.fps_dictionary.keys().find(temp_fps)
	var size = GlobalEnvironment.fps_dictionary.keys().size()
	match string_cmd.to_lower():
		"next":
			if current_index >= size-1:
				current_index = 0
			else:
				current_index +=1
		"prev":
			if current_index <= 0:
				current_index = size-1
			else: 
				current_index -= 1
	#update the ui
	label_fps_value.text = str(GlobalEnvironment.fps_dictionary.get(GlobalEnvironment.fps_dictionary.keys()[current_index]))
	temp_fps = GlobalEnvironment.fps_dictionary.keys()[current_index]

func refreshUi():
	label_language_value.text = GlobalEnvironment.language_dictionary.get(GlobalEnvironment._current_lang)
	label_fps_value.text = str(GlobalEnvironment.fps_dictionary.get(GlobalEnvironment._current_fps))
	slider_bgm.value = GlobalEnvironment._bgm_volume
	slider_sfx.value = GlobalEnvironment._sfx_volume

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


func _on_fps_panel_next_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_released():
			GlobalSfxEngine.playSfx("default")
			fpsHandler("next")


func _on_fps_panel_prev_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_released():
			GlobalSfxEngine.playSfx("default")
			fpsHandler("prev")
