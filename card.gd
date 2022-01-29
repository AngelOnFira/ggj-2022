extends PanelContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta):
#	pass
	
func good_action():
	get_tree().call_group("CardManager","card_action","good",self)
	pass
	
func bad_action():
	get_tree().call_group("CardManager","card_action","bad",self)
	pass
