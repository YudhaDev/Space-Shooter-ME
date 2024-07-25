extends Node
var currentTest = 0

var main_ui_selected = ""

@onready var ui_gallery : Control = $another_hud/MainmenuGallery
@onready var ui_setting : Control = $another_hud/Mainmenu_setting

func _ready():
	TranslationServer.set_locale("en")
	ui_gallery.connect("gallery_back_signal", gallery_back_signal)
	ui_setting.connect("setting_back_signal", setting_back_signal)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func gallery_back_signal():
	ui_gallery.visible = false
	ui_setting.visible = false
	pass

func setting_back_signal():
	ui_gallery.visible = false
	ui_setting.visible = false
	pass

func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_level_scene.tscn")
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_released() && event.button_index == MOUSE_BUTTON_LEFT:
			mainmenuUiHandler()

func mainmenuUiHandler():
	
	match main_ui_selected:
				"gallery":
					#show gallery
					ui_gallery.visible = true
					ui_setting.visible = false
				"setting":
					#show setting
					ui_gallery.visible = false
					ui_setting.visible = true
				"quit":
					#show quit
					get_tree().quit()

func _on_test_pressed() -> void:
	if currentTest == 0 :
		currentTest = 1
		TranslationServer.set_locale("id")
	else:
		currentTest = 0
		TranslationServer.set_locale("en")


func _on_gallery_btn_mouse_entered() -> void:
	main_ui_selected = "gallery"


func _on_gallery_btn_mouse_exited() -> void:
	main_ui_selected = ""


func _on_setting_btn_mouse_entered() -> void:
	main_ui_selected = "setting"


func _on_setting_btn_mouse_exited() -> void:
	main_ui_selected = ""


func _on_quit_btn_mouse_entered() -> void:
	main_ui_selected = "quit"


func _on_quit_btn_mouse_exited() -> void:
	main_ui_selected = ""
