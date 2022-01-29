extends Control

var player_card:PackedScene = preload("res://Card.tscn")

const CARD_CONTAINER_PATH:NodePath = NodePath("PlayerCards/HBoxContainer")
const NARRATOR:NodePath = NodePath("VBoxContainer/Narrator")

var current_page:Page = null

# Called when the node enters the scene tree for the first time.
func _ready():
	for page in self.get_tree().get_nodes_in_group("pages"):
		page.connect("page_changed",self,"update_page")

	# Replace with function body.
	# self.get_tree().call_group("pages","connect","page_changed",self,"update_page")
	self.update_page($Story.current_page)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func card_action(action:String,card:String):
	print("group_call on : CardManager -- card_action -- ",action," ",card)
	self.current_page.take_action(card,action)
	pass

func update_page(page:Page):
	self.current_page = page
	var cards_container = self.get_node(self.CARD_CONTAINER_PATH)
	var narrator = self.get_node(self.NARRATOR)
	var cards_to_add = []
	
	narrator.clear()
	narrator.append_text(page.get_story())

	# Remove existing cards
	for child in cards_container.get_children():
		child.queue_free()
		
	if page == null:
		var card = player_card.instance()
		card.card_id = "Continue"
		#TODO : add the continue card textures here
		cards_container.add_child(card)
	else:
		for page_card in page.get_cards():
			var card = player_card.instance()
			card.card_id = page_card.id
			cards_container.add_child(card)
		pass
	
	# TODO Add new cards then update page text
	# for card in self.current_page

