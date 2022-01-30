extends Node2D

var is_in_area: bool = false
var deck_cards: Array = []
var child_cards: Array = []
var previous_theta: float = 0.0
var action: String = ""


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	self.set_global_position(get_viewport().get_mouse_position())
	var t = get_viewport().get_mouse_position().x / get_viewport_rect().size.x
	var theta = PI / 4.0 * (t) - PI / 4.0 * (1.0 - t)

	var temp_transform = Transform(self.transform)
	temp_transform.basis = Basis(Vector3(0, 0, 1), theta - previous_theta) * temp_transform.basis
	self.transform = Transform2D(temp_transform)
	self.previous_theta = theta

	if Input.is_action_just_released("mouse_button_left"):
		for child in self.child_cards:
			if self.is_in_area:
				get_tree().call_group("CardManager", "card_action", self.action, child.card_id)
			self.remove_child(child)
		for child_dup in self.deck_cards:
			child_dup.show()

		deck_cards = []
		child_cards = []

		# Hide text from the decisions
		# This is pretty buggy, it only works against cards in the row
		var card_slots = get_parent().get_node("VBoxContainer/CardSlots")
		card_slots.get_node("DecisionAreaLeft").hide_text()
		card_slots.get_node("DecisionAreaRight").hide_text()


func enter_area(action_parm: String, caller_node: Node):
	if len(deck_cards) > 0:
		self.action = action_parm
		self.is_in_area = true


func exit_area(caller_node: Node):
	if len(deck_cards) > 0:
		self.action = ""
		self.is_in_area = false


# A card has just been picked up
func new_card_mouse_hover(card: Control, deck_card: Control):
	# Set the position to mouse
	card.set_position(Vector2(-card.get_rect().size.x / 2, -card.get_rect().size.y / 2))

	# Add the card and the duplicate to arrays
	self.deck_cards.append(deck_card)
	self.child_cards.append(card)

	self.add_child(card)
	self.action = ""
	self.is_in_area = false

	# Set the text on the decisions
	var left_decision = get_parent().get_node("VBoxContainer/CardSlots/DecisionAreaLeft")
	left_decision.set_text(card.card_left_text)
	left_decision.show_text()

	var right_decision = get_parent().get_node("VBoxContainer/CardSlots/DecisionAreaRight")
	right_decision.set_text(card.card_right_text)
	right_decision.show_text()
