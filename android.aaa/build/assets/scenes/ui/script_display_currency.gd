extends Node

@onready var currency = get_node("/root/GlobalCurrencies")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel/Label.text = str(currency.buff_currency)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Panel/Label.text = str(currency.buff_currency)
	
