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
			var current_chapter = self.get_parent().get_index()
			self.next_page = self.get_parent().get_parent().get_child(current_chapter + 1).get_child(
				0
			)
			print("Next page is null, continuing to next chapter")
		# Otherwise, go to the next page in the chapter
		else:
			self.next_page = self.get_parent().get_child(next_idx)
			print("Next page is null, continuing to next page")

	emit_signal("page_changed", self.next_page)


# Override to Specify next_page and apply any state logic
# Side is a string represented as either "left" or "right"
func take_action(card: String, side: String):
	# If we have no cards
	if len(cards) == 0 and self.continue_left != null and self.continue_right != null:
		# If continue_default is set (making a jump to a new page)
		if continue_default:
			self.next_page = get_node_or_null(self.continue_default)
		# Otherwise, left and right should be set
		else:
			if side == "left":
				self.next_page = get_node_or_null(self.continue_left)
				print(self.continue_left)
			elif side == "right":
				self.next_page = get_node_or_null(self.continue_right)
				print(self.continue_right)
			else:
				print("error")

	_change_page()


# Override to specify unique text based on card state conditions
func set_card_data():
	_card_data = {}
	if len(cards) == 0:
		_card_data["Continue"] = CardData.new(
			"Continue", "", "", continue_default, continue_default
		)
	if len(cards) == 1:
		_card_data[cards[0]] = CardData.new(
			cards[0],
			card_consultations[0][0],
			card_consultations[0][1],
			continue_left,
			continue_right
		)


func get_story():
	return self.text_description


func get_cards():
	return _card_data.values()
