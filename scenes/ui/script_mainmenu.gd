extends Node
var currentTest = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	TranslationServer.set_locale("en")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_level_scene.tscn")
	pass # Replace with function body.


func _on_test_pressed() -> void:
	if currentTest == 0 :
		currentTest = 1
		TranslationServer.set_locale("id")
	else:
		currentTest = 0
		TranslationServer.set_locale("en")
