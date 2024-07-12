extends Node

var arrTextToDisplay = []

# Called when the node enters the scene tree for the first time.
func _ready():
	$Button.show()
	#connect("gui_input", on_panel_clicked)
	pass # Replace with function body.

#func _input(event):
	#if event is InputEventMouseButton:
		#if event.pressed:
			#print("hey")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func process_text(textdialog : String) -> Array:
	var array :Array = []
	for huruf in textdialog:
		array.append(str(huruf))
	return array

func _on_button_pressed():
	arrTextToDisplay = process_text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
	anim_text()
	
func anim_text():
	$Timerdisplaytext.start()

func _on_timerdisplaytext_timeout():
	if arrTextToDisplay.size() != 0:
		$Panel/dialog_text.append_text(str(arrTextToDisplay.front()))
		arrTextToDisplay.remove_at(0)
	else:
		$Timerdisplaytext.stop()
		new_text_dialog()

func new_text_dialog():
	pass
