extends Node
@onready var global_env = get_node("/root/GlobalEnvironment")

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		global_env.isPlayerInBonfire = true


func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		global_env.isPlayerInBonfire = false
