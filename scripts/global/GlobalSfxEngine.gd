extends Node

var sfx_player : AudioStreamPlayer = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func onFinished():
	print("sfx finished")

func playSfx(sfx_type: String):
	if sfx_player == null:
		sfx_player = AudioStreamPlayer.new()
		sfx_player.name = "root_sfx"
		get_tree().root.add_child(sfx_player)
		sfx_player.connect("finished", onFinished)
		
	match sfx_type:
		"yes_confirm":
			sfx_player.stream = GlobalEnvironment.sfx_ui_asset_dictionary.get("sfx_ui_button_click_yes")
			sfx_player.play()
		"cancel_confirm":
			sfx_player.stream = GlobalEnvironment.sfx_ui_asset_dictionary.get("sfx_ui_button_click_cancel")
			sfx_player.play()
		"default":
			sfx_player.stream = GlobalEnvironment.sfx_ui_asset_dictionary.get("sfx_ui_button_click")
			sfx_player.play()
		_:
			pass
	#sfx_player.emit_signal("finished")
	
