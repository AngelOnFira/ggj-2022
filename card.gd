extends PanelContainer

export var card_id: String = "Continue"
export var card_left_text: String = ""
export var card_right_text: String = ""

var balance = 0

# Called when the node enters the scene tree for the first time.
func _ready():
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


# Set the type (id) of card to change the art
func set_card_type(id: String, balance: int):
	# Hide all the children
	for child in $Cards.get_children():
		child.hide()

	print("Trying to show ", id)

	# Show the requested child
	var active_card = $Cards.get_node(id)
	for child in active_card.get_children():
		child.hide()

	var new_balance = String(clamp(balance, -3, 3))
	active_card.get_node(new_balance).show()
	active_card.show()

	$TextContainer/VBoxContainer/BannerText.text = id
