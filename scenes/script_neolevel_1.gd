extends Node2D

@onready var global_dialog = get_node("/root/GlobalDialogScene")
@onready var scenario1 = preload("res://scripts/scenario/scenario_prologue.gd")

var scene_dialog = [
	["main_cara1:left:conversation", "Sensei ada yang bisa kubantu?"],
	["main_cara1:left:conversation", "Aku ada disini untuk membantumu."],
	["main_cara1:left:conversation", "Jangan malu-malu untuk meminta bantuan."],
	["main_cara1:left:end", ""]
]

func _ready() -> void:
	#global_dialog.dialogStart(scene_dialog)
	var scenario = scenario1.new()
	scenario.startScenario()
	pass