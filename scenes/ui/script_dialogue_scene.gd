extends Node
@onready var node_global_dialog = get_node("/root/GlobalDialogScene")

var isTalking : bool = false
var temp :String = ""

#screen shake parameters
var base_shake_strenght: float = 30.0
var shake_fade: float = 5
var rng_shake = RandomNumberGenerator.new()
var current_shake_strength: float = 0.0

var dialog_hud = null #dialog element di main_level_scene
var dialog

var dialog_format = "left"

# Called when the node enters the scene tree for the first time.
func _ready():
	node_global_dialog.connect("animate_the_text", anim_text)
	
	#$Button.show()
	#connect("gui_input", on_panel_clicked)
	pass # Replace with function body.

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
	#find_child("fade", true, false).play("fade_in")
	#print("bjir")
	#print("arsiparis "+str(find_child("fade", false, true)))
	
	#print(str(GlobalEnvironment._hud_element))
	
	if GlobalEnvironment._hud_element != null:
		dialog_hud = GlobalEnvironment._hud_element.find_child("dialog", true, false)
	else:
		printerr("hud element tidak ditemukan")
	
	if (dialog_hud) != null:
		dialog_hud.find_child("fade").play("fade_in")
		print(dialog_hud.find_child("fade"))
	
func fadeOut():
	#$fade.play("fade_out")
	pass
	
func applyShake():
	current_shake_strength = base_shake_strenght
	
func shakeFx() -> Vector2:
	return Vector2(rng_shake.randf_range(-current_shake_strength, current_shake_strength), rng_shake.randf_range(-current_shake_strength, current_shake_strength))

func playSfx():
	pass
