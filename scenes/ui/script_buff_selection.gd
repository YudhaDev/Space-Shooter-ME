extends Control
@export var toLevel = 0
@onready var global_environment = get_node("/root/GlobalEnvironment")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	match toLevel:
		0:
			get_tree().change_scene_to_file("res://scenes/level1.tscn")
			pass
		1:
			get_tree().change_scene_to_file("res://scenes/level2.tscn")			
			pass
		_:
			pass
	print("button 1 pressed")
	pass # Replace with function body.


func _on_close_button_pressed():
	queue_free()


func _on_button_4_pressed():
	var tampung = global_environment.maxedBuffExclusion()
	print(str(tampung))
	pass # Replace with function body.
