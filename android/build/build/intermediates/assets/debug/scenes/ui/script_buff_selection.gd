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

func generateBuffOption():
	
	pass

func _on_button_4_pressed():
	var tampung = global_environment.pickBuff()
	for item in tampung:
		var split = item.split(":")
		var build_string = "%s | %s" % [split[0], split[1]]
		
		var button := Button.new()
		button.text = build_string
		button.pressed.connect(dynamic_buttons_on_pressed.bind(item))
		$VBoxContainer.add_child(button)
	pass # Replace with function body.

func dynamic_buttons_on_pressed(buff):
	print("buff %s terpilih." % buff.split(":")[1])
	pass
