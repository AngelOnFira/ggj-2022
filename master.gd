extends Control

var player_card: PackedScene = preload("res://Card.tscn")

const CARD_CONTAINER_PATH: NodePath = NodePath("PlayerCards/HBoxContainer")
const NARRATOR: NodePath = NodePath("VBoxContainer/Narrator")
const DECISION_LEFT: NodePath = NodePath("VBoxContainer/CardSlots/DecisionAreaLeft")
const DECISION_RIGHT: NodePath = NodePath("VBoxContainer/CardSlots/DecisionAreaRight")

var current_page: Page = null

var balances = {
	"Child": 0,
	"Family": 0,
	"Stablemaster": 0,
	"Cub": 0,
	"Continue":0
}
var child_balance = 0
var stable_balance = 0
var family_balance = 0
var cub_balance = 0

func _ready():
	for page in self.get_tree().get_nodes_in_group("pages"):
		page.connect("page_changed", self, "update_page")
		page.connect("action_taken", $SFXHandler, "play")
		page.connect("action_taken", self, "set_card_balance")

	# Start the game by getting the first page
	self.update_page($Story.initial_page())
	var narrator = self.get_node(self.NARRATOR)
	narrator.clear()


# Signal reciever from a card getting a button pressed
func card_action(action: String, card: String):
	print("group_call on : CardManager -- card_action -- ", action, " ", card)
	self.current_page.take_action(card, action)
	pass


# Rebuild the scene with a new page
func update_page(page: Page):
	self.current_page = page
	$PageTurnSFX.play()

	var cards_container = self.get_node(self.CARD_CONTAINER_PATH)
	var narrator = self.get_node(self.NARRATOR)
	var cards_to_add = []
	var decision_left = self.get_node(self.DECISION_LEFT)
	var decision_right = self.get_node(self.DECISION_RIGHT)

	# Reset the text on each of the decision boxes
	get_tree().call_group("decisions", "hide_text")

	# Reset the narrator
	#narrator.clear()
	narrator.append_text(page.get_story())

	# Remove existing cards
	for child in cards_container.get_children():
		child.queue_free()

	# Add new cards
	print("master.gd -- Initiating Cards ")
	for page_card in page.get_cards():
		var card = player_card.instance()
		card.card_id = page_card.id
		card.card_left_text = page_card.left_text
		card.card_right_text = page_card.right_text
		cards_container.add_child(card)
		card.rect_scale = Vector2(0.5, 0.5)

		# Set the art on the card
		card.set_card_type(card.card_id, balances[card.card_id])

		print("master.gd creating --- ", page_card)

#	if page == null:
#		var card = player_card.instance()
#		card.card_id = "Continue"
#		#TODO : add the continue card textures here
#		cards_container.add_child(card)
#	else:
#		print("master.gd -- Initiating Cards ")
#		for page_card in page.get_cards():
#			var card = player_card.instance()
#			card.card_id = page_card.id
#			cards_container.add_child(card)
#			print("master.gd creating --- ",page_card)


func set_card_balance(page, card, side):
	if side == "left":
		balances[card] -= 1
	if side == "right":
		balances[card] +=1
