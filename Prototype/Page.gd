extends Node
class_name Page

signal page_changed(page)

export(String, MULTILINE) var text_description
export(Array, String) var cards
export(Array, Array, String, MULTILINE) var card_consultations

export(NodePath) var continue_left
export(NodePath) var continue_right
export(NodePath) var continue_default

const CardData = preload("res://Prototype/CardData.gd")

var _card_data = {}

var next_page: Node

# Called when the node enters the scene tree for the first time.
func _ready():
	set_card_data()
	self.add_to_group("pages")

# Transitions to the next page specified by the next_page
func _change_page():
	#janky book keeping here
	# If next page is null, we need to continue to the next child in the list
	if self.next_page == null:
		# Continue to the next child in the list
		var next_idx = self.get_index() + 1

		# If we are at the end of the list, go to the next chapter
		if next_idx >= self.get_parent().get_child_count():
			next_idx = 0
			# TODO: Go to next chapter instead of looping to index 0

		self.next_page = self.get_parent().get_child(next_idx)

	emit_signal("page_changed", self.next_page)

# Override to Specify next_page and apply any state logic
# Side is a string represented as either "left" or "right"
func take_action(card: String, side: String):
	# If we have no cards, and a default is specified, go to that page
	if len(cards) == 0:
		if continue_default:
			next_page = get_node_or_null(continue_default)

	if len(cards) == 1:
		if side == "left":
			next_page = get_node_or_null(continue_left)
		else:
			next_page = get_node_or_null(continue_right)

	_change_page()

# Override to specify unique text based on card state conditions
func set_card_data():
	_card_data = {}
	if len(cards) == 0:
		_card_data["Continue"] = CardData.new("Continue", "", "", continue_default, continue_default)
	if len(cards) == 1:
		_card_data[cards[0]] = CardData.new(cards[0], card_consultations[1], card_consultations[2], continue_left, continue_right)
	
func get_story():
	return self.text_description

func get_cards():
		return _card_data.values()
