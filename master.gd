extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	for page in self.get_tree().get_nodes_in_group("pages"):
		page.connect("page_changed",self,"update_page")
	# Replace with function body.
	#self.get_tree().call_group("pages","connect","page_changed",self,"update_page")
	$Story.current_page.take_action("Continue","left")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func card_action(action:String,card:String):
	print("group_call on : CardManager -- card_action -- ",action," ",card)
	pass

func update_page(page):
	print("test")
	print(page)
	pass

