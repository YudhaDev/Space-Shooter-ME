extends CharacterBody2D

@export var player_speed:float = 1
#signal player_projectiles(pos)
signal _player_targeting(obj)

var _projectile_scene = preload("res://scenes/projectile.tscn")
var _detected_enemies := []

func _ready():
	pass
	#position = Vector2(400, 400)

func _physics_process(_delta):
	#Untuk control
	var direction = Input.get_vector("left","right","up","down")
	#print(direction)
	#$".".position += direction * player_speed * delta
	$".".position += direction * player_speed
	#$".".velocity = direction * player_speed * delta
	#spawnProjectile()
	#
	#
#func spawnProjectile():
	#var direction = Vector2.RIGHT.rotated(global_rotation)
	#var projectile = _projectile_scene.instantiate()
	#projectile.direction = direction

func checkTargeting():
	var closest_enemy_distance:float = 1000000000.0
	var closest_enemy_obj = null
	if _detected_enemies.size() != 0:
		for i in _detected_enemies.size():
			print("object position:"+str(_detected_enemies[i].global_position))
			var closest_enemy_distance_temp = global_position.distance_to(_detected_enemies[i].global_position)
			if closest_enemy_distance_temp < closest_enemy_distance:
				closest_enemy_distance = closest_enemy_distance_temp
				closest_enemy_obj = _detected_enemies[i]
	print("object closes: "+str(closest_enemy_obj))
	return closest_enemy_obj

func _process(delta):
	if Input.is_action_just_pressed("shoot"):	
		#player_projectiles.emit($PlayerProjectilesPawnMarker1.global_position)
		var projectile_obj = _projectile_scene.instantiate()
		projectile_obj.setup($PlayerProjectilesPawnMarker1.global_transform)
		get_tree().root.add_child(projectile_obj)
		print("ditekan")

func _on_timer_projectiles_player_timeout():
	#tembak projectiles
	#player_projectiles.emit($PlayerProjectilesPawnMarker1.global_position)
	pass

func _on_detecting_enemy_body_entered(body):
	print("body"+str(body))
	_detected_enemies.append(body)
	for i in _detected_enemies.size():
		print(str(i)+"enemy"+str(_detected_enemies[i]))
	pass # Replace with function body.


func _on_detecting_enemy_body_exited(body):
	print("body"+str(body))
	_detected_enemies.erase(body)	
	for i in _detected_enemies.size():
		print(str(i)+"enemy"+str(_detected_enemies[i]))
	
	#for i in _detected_enemies:
		#if _detected_enemies[i] == body:
	pass # Replace with function body.


func _on_timer_targeting_timeout():
	_player_targeting.emit(checkTargeting())
	pass # Replace with function body.
