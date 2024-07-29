extends Node

var scenario_dialog_engine = preload("res://scenes/ui/script_dialogue_scene.gd").new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func parse(array : Array):
	for arr in array:
		var format = arr[0].split(":")
		var value = arr[1]
		
		match format[2]:
			"fade_in":
				scenario_dialog_engine.fadeIn()
			"fade_out":
				scenario_dialog_engine.fadeOut()
			"narration":
				scenario_dialog_engine.
			"background":
				#set background
				pass
			"x":
				#do nothing
				pass
			"":
				#do nothing
				pass
	pass
