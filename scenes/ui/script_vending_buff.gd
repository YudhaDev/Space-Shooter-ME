extends Control

var isHover1 = false
var isHover2 = false
@onready var global_env = get_node("/root/GlobalEnvironment")

var buff_selected = -1
var buff_dictionary = {
	"attack" : "",
	"movement": "",
	"projectile_speed":"",
	"projectile_bounce":"",
	"projectile_penetration": "",
	"projectile-spread":""
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if buff_selected!=-1:
		if event is InputEventMouseButton:
			if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
				#beli buff
				pass

func populateDictionary():
	buff_dictionary.get("attack")
	pass


func _on_buff_1_mouse_entered() -> void:
	buff_selected = 0


func _on_buff_1_mouse_exited() -> void:
	buff_selected = -1


func _on_buff_2_mouse_entered() -> void:
	buff_selected = 1


func _on_buff_2_mouse_exited() -> void:
	buff_selected = -1


func _on_buff_3_mouse_entered() -> void:
	buff_selected = 2


func _on_buff_3_mouse_exited() -> void:
	buff_selected = -1


func _on_buff_4_mouse_entered() -> void:
	buff_selected = 3


func _on_buff_4_mouse_exited() -> void:
	buff_selected = -1


func _on_buff_5_mouse_entered() -> void:
	buff_selected = 4


func _on_buff_5_mouse_exited() -> void:
	buff_selected = -1


func _on_buff_6_mouse_entered() -> void:
	buff_selected = 5


func _on_buff_6_mouse_exited() -> void:
	buff_selected = -1
