extends Node2D

#Tampung
var vacuum_pack:PackedScene = load("res://scenes/enemy_1.tscn")
var player_projectiles_pack:PackedScene = load("res://scenes/projectile.tscn")
var targeting_obj = null

func _on_timer_timeout():
	#instansiasi
	var vacuum_obj = vacuum_pack.instantiate()
	$"Enemy Vacuums Parent".add_child(vacuum_obj)
	#print("timer sinyal")
	
func _ready():
	$Control/dialogue_box.start()
	pass
func _physics_process(delta):
	if targeting_obj != null:
		$player.get_child(0).look_at(targeting_obj.global_position)
	pass
	

#func _on_player_player_projectiles(pos):
	##print(pos)
	##print("player menembak")
	#
	##spawn projectile
	#var player_projectile_obj = player_projectiles_pack.instantiate()
	#$"Timer Projectiles Player".add_child(player_projectile_obj)
	#player_projectile_obj.position = pos


func _on_player__player_targeting(obj):
	targeting_obj = obj
	pass # Replace with function body.
