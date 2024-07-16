extends Node
@onready var global_env = get_node("/root/GlobalEnvironment")
var _buff_selection_scene = preload("res://scenes/ui/buff_selection.tscn")

signal openVendingUI
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_button_pressed() -> void:
	print("masuk klik"+ str(global_env.isPlayerInVending))
	if global_env.isPlayerInVending:
		openVendingUI.emit()
		pass
	elif global_env.isPlayerInBonfire:
		pass
	elif global_env.isPlayerInBillboard:
		pass
