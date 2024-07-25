extends Node2D
@onready var global_env = get_node("/root/GlobalEnvironment")

signal playerAroundVending(boolean : bool)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		global_env.isPlayerInVending = true
		playerAroundVending.emit(true)
		#$CanvasLayer/ButtonInteract.visible = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		global_env.isPlayerInVending = false
		playerAroundVending.emit(false)
		#$CanvasLayer/ButtonInteract.visible = false
		
