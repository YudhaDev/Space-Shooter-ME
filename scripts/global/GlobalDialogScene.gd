extends Node

signal animate_the_text()
signal end_the_conversation()

var scene_dialog_template = [
	"img_chara:posisi:jenis_dialog:dialognya"
]

var currentSceneToPlay = null
var sceneIndex = 0

var arrTextToDisplay = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func dialogStart(arraySceneDialog: Array):
	currentSceneToPlay = arraySceneDialog
	doDialog()
	#var _thread = Thread.new()
	#_thread.start(threadDialog)
	#thread.start(threadDialog.bind(arraySceneDialog))
	#pass

func doDialog():
	var splitted_dialog = currentSceneToPlay[sceneIndex][0].split(":")
	if splitted_dialog[2] == "conversation":
		arrTextToDisplay = process_text(currentSceneToPlay[sceneIndex][1])
		print("masuk")
		animate_the_text.emit()
	elif splitted_dialog[2] == "branching":
		pass
	elif splitted_dialog[2] == "end":
		end_the_conversation.emit()
	sceneIndex +=1

func process_text(textdialog : String) -> Array:
	var array :Array = []
	for huruf in textdialog:
		array.append(str(huruf))
	return array
