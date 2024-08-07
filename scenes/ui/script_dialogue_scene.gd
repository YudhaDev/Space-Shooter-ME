extends Node
#@onready var node_global_dialog = get_node("/root/GlobalDialogScene")
var node_global_dialog = preload("res://scripts/global/GlobalDialogScene.gd").new()

var isTalking : bool = false
var temp :String = ""

#screen shake parameters
var base_shake_strenght: float = 30.0
var shake_fade: float = 5
var rng_shake = RandomNumberGenerator.new()
var current_shake_strength: float = 0.0

#var dialog_hud = null #dialog element di main_level_scene
var dialog_left_format :Control= null
var dialog_right_format :Control= null
var dialog_middle_format :Control= null

var dialog_format = "left"

signal job_done
signal fade_finished
# Called when the node enters the scene tree for the first time.

func _ready():
	printerr("masuk ready dealogue_scene")
	GlobalEnvironment._hud_element.find_child("dialog", true, false)
	#node_global_dialog.connect("animate_the_text", anim_text)
	dialog_left_format = GlobalEnvironment._main_level_scene.find_child("left_format", true, false)
	dialog_middle_format = GlobalEnvironment._main_level_scene.find_child("middle_format", true, false)
	dialog_right_format = GlobalEnvironment._main_level_scene.find_child("right_format", true, false)
	ScenarioParser.connect("doSomething", doSomething)
	printerr("done ready dealogue_scene")

func doSomething(string_command):
	printerr("string command: "+string_command)
	match string_command:
		"fadeIn":
			fadeIn()
		"fadeOut":
			fadeOut()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if find_child("left_dialog_text", true, false).item_rect_changed :
		resizePanelDialog()
		
	if current_shake_strength > 0:
		$".".position = shakeFx()
		current_shake_strength = lerpf(current_shake_strength,0,shake_fade)

func resizePanelDialog():
	var text :RichTextLabel = find_child("left_dialog_text", true, false)
	var panel :Panel = find_child("left_panel_dialog", true, false)
	var texty = text.size.y
	panel.size.y = texty + 30
	
func middleFormat():
	changeDisplayFormat("middle")
	if dialog_left_format != null:
		dialog_left_format.visible = false
		dialog_middle_format.visible = true
		dialog_right_format.visible = false
	else:
		printerr("isinya null")

func leftFormat():
	changeDisplayFormat("left")
	dialog_left_format.visible = true
	dialog_middle_format.visible = false
	dialog_right_format.visible = false

func rightFormat():
	changeDisplayFormat("right")
	dialog_left_format.visible = false
	dialog_middle_format.visible = false
	dialog_right_format.visible = true

func changeDisplayFormat(format: String):
	match format:
		"left":
			dialog_format = "left"
		"middle":
			dialog_format = "middle"
		"right":
			dialog_format = "right"

func _on_button_pressed():
	if isTalking:
		stop_talking()
		completeDisplaying()
	else:
		next_dialog()

#entry point
func anim_text():
	#print("yahoooooooooo")
	isTalking = true
	$Timerdisplaytext.start()

func anim_text_narration():
	dialog_format = "center"
	isTalking = true
	$Timerdisplaytext.start()
	pass

func next_dialog():
	$Panel_dialog/dialog_text.clear()
	temp = ""
	node_global_dialog.doDialog()

func stop_talking():
	$Timerdisplaytext.stop()
	isTalking = false
	
func completeDisplaying():
	var temp = ""
	for huruf in node_global_dialog.arrTextToDisplay:
		temp = temp + huruf
	$Panel_dialog/dialog_text.append_text(temp) 
	pass

func _on_timerdisplaytext_timeout():
	var arrTextToDisplay :Array = node_global_dialog.arrTextToDisplay
	match dialog_format:
		"left":
			if arrTextToDisplay.size() != 0:
				temp = temp + arrTextToDisplay.front()
				$Panel_dialog/dialog_text.text = temp
				#"[left]"+temp+"[/left]" 
				#append_text("[center]"+temp+"[/center]")
				arrTextToDisplay.remove_at(0)
			else:
				stop_talking()
		"middle":
			if arrTextToDisplay.size() != 0:
				temp = temp + arrTextToDisplay.front()
				
			pass
		"right":
			pass

func changeBackground():
	pass

func fadeIn():
	#print("masuk fadein")
	#if GlobalEnvironment._hud_element != null:
		#dialog_hud = GlobalEnvironment._hud_element.find_child("dialog", true, false)
	#else:
		#printerr("hud element tidak ditemukan")
	
	#if (dialog_hud) != null:
		#dialog_hud.find_child("fade").play("fade_in")
	#printerr("tf"+str(GlobalEnvironment._dialog_scene))
	#print("treee"+str(GlobalEnvironment._dialog_scene))
	GlobalEnvironment._dialog_scene.find_child("fade").play("fade_in")
	#while GlobalEnvironment._dialog_scene.find_child("fade").is_playing():
		#print(GlobalEnvironment._dialog_scene.find_child("fade").is_playing())
		#OS.delay_msec(1000)
		#pass
	#job_done.emit()
	
func fadeOut():
	#$fade.play("fade_out")
	pass
	
func applyShake():
	current_shake_strength = base_shake_strenght
	
func shakeFx() -> Vector2:
	return Vector2(rng_shake.randf_range(-current_shake_strength, current_shake_strength), rng_shake.randf_range(-current_shake_strength, current_shake_strength))

func playSfx():
	pass

func _on_fade_animation_finished(anim_name: StringName) -> void:
	fade_finished.emit()
	printerr("ngirim sinyal(dialog scene script)")
