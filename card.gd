extends PanelContainer

export var card_id: String = "default"
export var card_left_text: String = ""
export var card_right_text: String = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	self.set_card_type("Continue")

	# Don't know why this doesn't set the size of the card while in hand
	self.rect_scale = Vector2(0.75, 0.75)


func good_action():
	get_tree().call_group("CardManager", "card_action", "left", self.card_id)


func bad_action():
	get_tree().call_group("CardManager", "card_action", "right", self.card_id)


func _on_Card_gui_input(event):
	if event.is_pressed():
		get_tree().call_group("MouseCards", "new_card_mouse_hover", self.duplicate(), self)
		self.hide()
	else:
		# Hide text from the decisions
		# This is pretty buggy, it only works against cards in the row
		var card_slots = get_parent().get_parent().get_parent().get_node("VBoxContainer/CardSlots")
		card_slots.get_node("DecisionAreaLeft").hide_text()
		card_slots.get_node("DecisionAreaRight").hide_text()


func set_card_type(type: String):
	# Hide all the children
	for child in $Card.get_children():
		child.hide()

	# Show the requested child
	$Card.get_node(type).show()

	$TextContainer/VBoxContainer/BannerText.text = type
