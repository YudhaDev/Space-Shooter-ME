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
	#printerr("masuk ready dealogue_scene")
	GlobalEnvironment._hud_element.find_child("dialog", true, false)
	#node_global_dialog.connect("animate_the_text", anim_text)
	dialog_left_format = GlobalEnvironment._dialog_scene.find_child("left_format", true, false)
	dialog_middle_format = GlobalEnvironment._dialog_scene.find_child("middle_format", true, false)
	dialog_right_format = GlobalEnvironment._dialog_scene.find_child("right_format", true, false)
	ScenarioParser.connect("doSomething", doSomething)
	#printerr("done ready dealogue_scene")

func doSomething(string_command, value):
	printerr("string command: "+string_command)
	match str(string_command).to_lower():
		"fade_in":
			fadeIn()
		"fade_out":
			fadeOut()
		"narration":
			middleFormat()
		"conversation":
			node_global_dialog.dialogStart(node_global_dialog.process_text(value))
			anim_text()
		"background":
			changeBackground(value)
		"sfx":
			#play sfx
			#printerr("get children: "+str(GlobalEnvironment._audio_element.get_children()))
			var sfx_ui :AudioStreamPlayer = GlobalEnvironment._audio_element.get_child(0)
			sfx_ui.stream = GlobalEnvironment.sfx_asset_dictionary.get(str(value))
			sfx_ui.play()
			job_done.emit()
			
		"delay":
			#delay the next
			OS.delay_msec(int(value))
			job_done.emit()
		_:
			printerr("scenario parser command not recognized: " + string_command)

func changeBackground(val):
	var bgDictionary = GlobalEnvironment.bg_asset_dictionary
	if bgDictionary.has(str(val)):
		var bg_texturerect : TextureRect = GlobalEnvironment._dialog_scene.find_child("bg", true, false)
		bg_texturerect.texture = bgDictionary[val]
	else:
		printerr("scene dialog, no bg in dictionary")
	job_done.emit()

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
	job_done.emit()

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
	isTalking = true
	$Timerdisplaytext.start()

#func anim_text_narration():
	#dialog_format = "center"
	#isTalking = true
	#$Timerdisplaytext.start()
	#pass

func next_dialog():
	match dialog_format:
		"left":
			dialog_middle_format.find_child("left_dialog_text", true, false).clear()
		"middle":
			dialog_middle_format.find_child("middle_text_dialog", true, false).clear()
		"right":
			dialog_middle_format.find_child("right_dialog_text", true, false).clear()
			pass
	temp = ""
	#node_global_dialog.doDialog()
	job_done.emit()

func stop_talking():
	GlobalEnvironment._dialog_scene.find_child("Timerdisplaytext", true, false).stop()
	#$Timerdisplaytext.stop()
	isTalking = false
	
func completeDisplaying():
	var temp = ""
	for huruf in node_global_dialog.arrTextToDisplay:
		temp = temp + huruf
	$Panel_dialog/dialog_text.append_text(temp) 
	pass

func _on_timerdisplaytext_timeout():
	var arrTextToDisplay :Array = node_global_dialog.getArray()
	match dialog_format:
		"left":
			if arrTextToDisplay.size() != 0:
				temp = temp + arrTextToDisplay.front()
				var middle_text_dialog : RichTextLabel= dialog_middle_format.find_child("middle_text_dialog", true, false)
				middle_text_dialog.text = temp	
				#$Panel_dialog/dialog_text.text = temp
				#"[left]"+temp+"[/left]" 
				#append_text("[center]"+temp+"[/center]")
				arrTextToDisplay.remove_at(0)
			else:
				stop_talking()
				next_dialog()
		"middle":
			#print("pppp" +str(arrTextToDisplay.size()))
			if arrTextToDisplay.size() != 0:
				temp = temp + arrTextToDisplay.front()
				var middle_text_dialog : RichTextLabel= dialog_middle_format.find_child("middle_text_dialog", true, false)
				middle_text_dialog.text = temp
				arrTextToDisplay.remove_at(0)
			else:
				stop_talking()
				next_dialog()
				#job_done.emit()
				
		"right":
			pass

func fadeIn():
	GlobalEnvironment._dialog_scene.find_child("fade").play("fade_in")
	
func fadeOut():
	#$fade.play("fade_out")
	(GlobalEnvironment._dialog_scene.find_child("fade") as AnimationPlayer).play("fade_out")
	
func applyShake():
	current_shake_strength = base_shake_strenght
	
func shakeFx() -> Vector2:
	return Vector2(rng_shake.randf_range(-current_shake_strength, current_shake_strength), rng_shake.randf_range(-current_shake_strength, current_shake_strength))

func playSfx():
	pass

func _on_fade_animation_finished(anim_name: StringName) -> void:
	fade_finished.emit()
	printerr("ngirim sinyal(dialog scene script)")
