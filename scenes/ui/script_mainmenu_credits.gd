extends Control

func _on_closecreditbtn_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_released():
			#tutup ui credit
			GlobalSfxEngine.playSfx("default")
			visible = false
