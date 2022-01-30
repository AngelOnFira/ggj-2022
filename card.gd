extends PanelContainer

export var card_id: String = "default"
export var card_left_text: String = ""
export var card_right_text: String = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	self.set_card_type("Continue")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta):
#	pass


func good_action():
	get_tree().call_group("CardManager", "card_action", "left", self.card_id)
	pass


func bad_action():
	get_tree().call_group("CardManager", "card_action", "right", self.card_id)
	pass


func _on_Card_gui_input(event):
	if event.is_pressed():
		get_tree().call_group("MouseCards", "new_card_mouse_hover", self.duplicate(), self)
		self.hide()
	pass  # Replace with function body.


func set_card_type(type: String):
	# Hide all the children
	for child in $Card.get_children():
		child.hide()

	# Show the requested child
	$Card.get_node(type).show()

	$TextContainer/VBoxContainer/BannerText.text = type
