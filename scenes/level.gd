extends Node2D

#Tampung
var vacuum_pack:PackedScene = load("res://scenes/enemy_1.tscn")
var player_projectiles_pack:PackedScene = load("res://scenes/projectile.tscn")
var targeting_obj = null
var current_enemies = []

func _on_timer_timeout():
	#instansiasi
	var vacuum_obj = vacuum_pack.instantiate()
	$"Enemy Vacuums Parent".add_child(vacuum_obj)
	#print("timer sinyal")
	
func _ready():
	current_enemies = $enemies.get_children()
	$CanvasLayer/Control/dialogue_box.start()
	
func _physics_process(delta):
	if targeting_obj != null:
		$player.get_child(0).look_at(targeting_obj.global_position)
	
func checkingEnemies():
	
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


func _on_timer_check_enemy_timeout():
	current_enemies = $enemies.get_children()
	if current_enemies.size() == 0:
		print("Next Stage")
		$UI/buff_selection.show()
	pass # Replace with function body.
