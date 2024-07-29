extends Node

var scenarioParser = null

var scenario = [
	["x:x:background", "sky01"],
	["x:x:fade_in", "1000"],
	["x:x:narration",""],
	["drone01:middle:conversation", "“KABAR BAIK BESTIES, IFRIT24 BUKA CABANG BARU NICH!”"],
	["x:x:x", "“LETAKNYA DI PINGGIR TENGGARA KOTA, KILOMETER 13!"],
	["x:x:x", "“SKUY! BELANJA IRIT DAN CEPAT, HANYA DI IFRIT24!”"],
	["x:x:x", "“SKUY! BELANJA IRIT DAN CEPAT, HANYA DI IFRIT24!”"],
	["x:x:sfx", "ckrak"],
	["x:x:delay", "1000"],
	["x:x:fade-out", "1000"],
]
var scene_dialog = [
	["main_cara1:left:conversation", "Sensei ada yang bisa kubantu?"],
	["main_cara1:left:conversation", "Aku ada disini untuk membantumu."],
	["main_cara1:left:conversation", "Jangan malu-malu untuk meminta bantuan."],
	["main_cara1:left:end", ""]
]

func startScenario():
	var json = JSON.new()
	var error = json.parse(JSON.stringify(scenario))
	if error == OK:
		var jsoned = json.data
		#print(jsoned)
	else:
		printerr("gagal parsing json scenario")
	
	scenarioParser = load("res://scripts/scenario/scenario_parser.gd")
	var parser = scenarioParser.new()
	parser.parse(scenario)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
