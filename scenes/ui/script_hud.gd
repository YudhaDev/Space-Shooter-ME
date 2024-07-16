extends Control


var ui_selected = ""

signal pressed_button(ui_selected:String)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
func _input(event: InputEvent) -> void:
	if ui_selected != "":
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT && event.is_released():
				pressed_button.emit(ui_selected)
				
		#match ui_selected:
			#"pause":
				#if event is InputEventMouseButton:
					#if event.button_index == MOUSE_BUTTON_LEFT:
						#if event.pressed:
							#pressed_button.emit(ui_selected)
							#print("masuk pause")
							#
			#"skip":
				##is on dialog
				#if event is InputEventMouseButton:
					#if event.button_index == MOUSE_BUTTON_LEFT:
						#if event.pressed:
							#pressed_button.emit(ui_selected)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_pausebtn_mouse_entered() -> void:
	ui_selected = "pause"

func _on_pausebtn_mouse_exited() -> void:
	ui_selected = ""

func _on_skipdialogbtn_mouse_entered() -> void:
	ui_selected = "skip"

func _on_skipdialogbtn_mouse_exited() -> void:
	ui_selected = ""
