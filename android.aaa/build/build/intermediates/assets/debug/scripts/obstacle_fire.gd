extends Area2D

var _base_obstacle_damage = 5
var loop_timer = 0
var max_loop_timer = 3
var _player_body = null
var _obstacle_type = "spike" # spike, fire

func damage_overtime(body):
	body.getHurt(_base_obstacle_damage)
	pass
	
func damage_attime():
	pass

func _on_body_entered(body):
	#print("masuk")
	if body.is_in_group("player"):
		_player_body = body
		if $TimerDamageOverTime.is_stopped():
			$TimerDamageOverTime.autostart = true
			$TimerDamageOverTime.start()
			#damage_overtime(body)


func _on_body_exited(body):
	pass # Replace with function body.

func _on_timer_damage_over_time_timeout():
	print("fire timer"+ str(loop_timer))
	if loop_timer < max_loop_timer :
		if _player_body != null :
			damage_overtime(_player_body)
		loop_timer +=1
	else :
		loop_timer = 0
		$TimerDamageOverTime.stop()
