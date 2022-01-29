extends Control

var PlayerCard:PackedScene = preload("res://Card.tscn")
var CardContainerPath:NodePath = NodePath("PlayerCards/HBoxContainer")
var current_page

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
	pass

func update_page(page):
	self.current_page = page

	# Remove existing cards
	#var cards = get_node(CardContainerPath)
	for child in get_node(CardContainerPath).cards.get_children():
		child.queue_free()
	
	# TODO Add new cards then update page text
	# for card in self.current_page

