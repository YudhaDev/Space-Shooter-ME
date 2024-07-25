extends CanvasLayer

@onready var level0 = $level0
@onready var level1 = $level1
@onready var level2 = $level2
@onready var global_dialog = get_node("/root/GlobalDialogScene")
@onready var arrLevel = [level0,level1,level2]
@onready var mainLevel = $"../Main2D"

var current_hud_level = 0
var ui_selected : String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mainLevel.connect("mainLevelScriptReady", mainLevelScriptReady)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func mainLevelScriptReady():
	print("masuk hud")
	arrLevel[0].visible = true
	global_dialog.connect("end_the_conversation", end_conversation)

func playerAroundVending(boolean:bool):
	print("oha:"+str(boolean))

func end_conversation():
	$level0/dialog.visible = false
	pass

func input_hadler() -> void:
	match ui_selected:
		"pause":
			#game pause
			get_tree().paused = true
			#show pause
			change_ui_level(1)
			#level 0 di hide
			#level 1 di show
			#pause menu di level 1 di show
			$level1/pause.visible = true
		"resume":
			#hide pause menu
			$level1/pause.visible = false
			#hide level1
			#show level0
			change_ui_level(0)
			#unpause the game
			get_tree().paused = false
		"close":
			#hide pause menu
			$level1/pause.visible = false
			#hide level1
			#show level0
			change_ui_level(0)
			#unpause the game
			get_tree().paused = false
		"skip":
			#skip entire dialog
			pass

func change_ui_level(level:int):
	current_hud_level = level
	for index in arrLevel.size():
		if index == level:
			arrLevel[level].visible = true
		else:
			arrLevel[index].visible = false
	pass

func openVendingUi():
	change_ui_level(1)
	$level1/vending_buff.visible = true
	

func _on_main_level_scene_show_vending_buff() -> void:
	change_ui_level(1)
	$level1/vending_buff.visible = true
	pass # Replace with function body.

func _on_hud_level_pressed_button(_ui_selected: String) -> void:
	ui_selected = _ui_selected
	input_hadler()

func _on_pause_pause_event_signal(pause_ui_selected: String) -> void:
	ui_selected = pause_ui_selected
	input_hadler()
	
