extends Control

var pause_ui_selected = ""
signal pauseEventSignal(pause_ui_selected: String)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if pause_ui_selected == "quit":
			if event.is_released() && event.button_index ==MOUSE_BUTTON_LEFT:
				$"pause-menu".visible = false
				$"pause-menu-quit-confirmation".visible = true
		elif pause_ui_selected == "cancel":
			if event.is_released() && event.button_index ==MOUSE_BUTTON_LEFT:
				$"pause-menu".visible = true
				$"pause-menu-quit-confirmation".visible = false
		elif pause_ui_selected == "yes":
			if event.is_released() && event.button_index ==MOUSE_BUTTON_LEFT:
				get_tree().quit()
			
		elif event.is_released() && event.button_index ==MOUSE_BUTTON_LEFT:
			pauseEventSignal.emit(pause_ui_selected)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_closepausebtn_mouse_entered() -> void:
	pause_ui_selected = "close"


func _on_closepausebtn_mouse_exited() -> void:
	pause_ui_selected = ""


func _on_resume_mouse_entered() -> void:
	pause_ui_selected = "resume"


func _on_resume_mouse_exited() -> void:
	pause_ui_selected = ""


func _on_quit_mouse_entered() -> void:
	pause_ui_selected = "quit"


func _on_quit_mouse_exited() -> void:
	pause_ui_selected = ""


func _on_cancel_mouse_entered() -> void:
	pause_ui_selected = "cancel"


func _on_cancel_mouse_exited() -> void:
	pause_ui_selected = ""


func _on_yes_mouse_entered() -> void:
	pause_ui_selected = "yes"


func _on_yes_mouse_exited() -> void:
	pause_ui_selected = ""
