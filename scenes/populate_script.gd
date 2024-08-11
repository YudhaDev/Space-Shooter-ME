extends Node2D

func _enter_tree() -> void:
	#printerr("init populating data")
	GlobalEnvironment._hud_element = get_tree().current_scene.get_child(3)
	GlobalEnvironment._audio_element = get_tree().current_scene.get_child(4)
	GlobalEnvironment._main_camera = get_tree().current_scene.find_child("player", true, false).find_child("Camera2D", true, false)
	GlobalEnvironment._main_level_scene = get_tree().current_scene
	GlobalEnvironment._dialog_scene = GlobalEnvironment._hud_element.find_child("dialog", true, false)
	#printerr("done populating data")

func _ready() -> void:

	pass
