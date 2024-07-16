extends Area2D

var _base_obstacle_damage = 10
var _obstacle_type = "spike" # spike, fire

func damage_overtime():
	pass
	
func damage_attime():
	pass

func _on_body_entered(body):
	if body.is_in_group("player"):
		#lukai player
		body.getHurt(_base_obstacle_damage)


func _on_body_exited(body):
	pass # Replace with function body.
