extends Node
@onready var node_global_dialog = get_node("/root/GlobalDialogScene")

var isTalking : bool = false
var temp :String = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	node_global_dialog.connect("animate_the_text", anim_text)
	
	#$Button.show()
	#connect("gui_input", on_panel_clicked)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	resizePanelDialog()
	pass

func resizePanelDialog():
	var text :RichTextLabel = $Panel_dialog/dialog_text
	var panel :Panel = $Panel_dialog
	
	var texty = text.size.y
	panel.size.y = texty + 30

func _on_button_pressed():
	if isTalking:
		stop_talking()
		completeDisplaying()
	else:
		next_dialog()
	
func anim_text():
	#print("yahoooooooooo")
	isTalking = true
	$Timerdisplaytext.start()

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
	if arrTextToDisplay.size() != 0:
		temp = temp + arrTextToDisplay.front()
		$Panel_dialog/dialog_text.text = temp
		#"[left]"+temp+"[/left]" 
		#append_text("[center]"+temp+"[/center]")
		arrTextToDisplay.remove_at(0)
	else:
		stop_talking()

#func new_text_dialog():
	#pass
