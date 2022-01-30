extends Node
class_name Page

signal page_changed(page)
const DEFUALT_ID: String = "Continue"

export(String, MULTILINE) var text_description

const CardData = preload("res://Prototype/CardData.gd")

var _card_data = {}

var next_page: Node


# Called when the node enters the scene tree for the first time.
func _ready():
	set_card_data()
	self.add_to_group("pages")


# Transitions to the next page specified by the next_page
func _change_page():
	emit_signal("page_changed", self.next_page)


# Override to Specify next_page and apply any state logic
# Side is a string represented as either "left" or "right"
func take_action(card_name: String, side: String):
	# This should be a node, or null for "Continue"
	var card: Node = self.get_node_or_null(NodePath(card_name))

	# Defualt : continue action
	if card == null:
		# Continue to the next child in the list
		var next_idx = self.get_index() + 1

		# We're at the end of the book
		if next_idx >= self.get_parent().get_child_count():
			pass
		# Otherwise, go to the next page
		else:
			self.next_page = self.get_parent().get_child(next_idx)
			print("Next page is null, continuing to next page")

	# Card : We have a card as a child with the card name
	else:
		if side == "left":
			self.next_page = card.get_node(card.continue_left)
		elif side == "right":
			self.next_page = card.get_node(card.continue_right)

	if self.next_page == null:
		print("Error: Next page is still null!")

	_change_page()


# Override to specify unique text based on card state conditions
func set_card_data():
	self._card_data = {}

	for child in self.get_children():
		self._card_data[child.name] = CardData.new(  # The left action  # The right action
			child.name, child.left_text, child.right_text, child.continue_left, child.continue_right
		)

	if len(self._card_data) == 0:
		self._card_data[DEFUALT_ID] = CardData.new(
			DEFUALT_ID, "Go on...", "Go on...", NodePath(), NodePath()
		)


func get_story():
	return self.text_description


func get_cards():
	return self._card_data.values()
