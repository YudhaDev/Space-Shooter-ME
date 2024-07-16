extends Node

var _buff_selection_scene = preload("res://scenes/ui/buff_selection.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	#Buka select buff
	var ui_obj = _buff_selection_scene.instantiate()
	get_tree().root.get_node("level/UI").add_child(ui_obj)
