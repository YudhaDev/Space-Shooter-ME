extends Node

@onready var global_env = get_node("/root/GlobalEnvironment")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#cek deket bonfire atau nggk
	if global_env.isPlayerInBonfire == true:
		$ButtonSelectBuff.visible = true
	else:
		$ButtonSelectBuff.visible = false
