extends Panel


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("gui_input", onclickme)
	pass # Replace with function body.

func onclickme():
	print("hehhy")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
