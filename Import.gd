tool
extends Node

export var run_import = false setget do_run_import
# onready var card_script = preload("res://Prototype/CardComponent.gd")

var file

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
# 	print("test2")
# 	add_child(Node.new()).set_owner(get_tree().get_edited_scene_root())

func import():
	var file = File.new()
	file.open("res://Prototype/Story/FullStory.json", file.READ)
	var json = file.get_as_text()
	var json_result = JSON.parse(json)
	file.close()

	for child in get_children():
		child.free()

	var regex = RegEx.new()
	# regex.compile("\(\\d+)")
	
	for page in json_result.result["passages"]:
		# For each one

		# Create a node
		var node = Node.new()
		


		# Set the name
		node.name = page["name"]
		
		# Attach stript
		node.set_script(load("res://Prototype/Page.gd"))
		
		# Set the text
		node.text_description = page["text"]

		# Add to tree
		add_child(node)
		node.set_owner(get_tree().get_edited_scene_root())
		
		# End of story
		if !page.has("links"):
			continue

		# Continue
		if len(page["links"]) == 1:
			var new_card = Node.new()

			new_card.set_script(load("res://Prototype/CardComponent.gd"))
			
			new_card.left_text = "Go on..."
			new_card.right_text = "Go on..."
			new_card.continue_left = NodePath("../../" + page["links"][0]["link"])
			new_card.continue_right = NodePath("../../" + page["links"][0]["link"])
			new_card.name = "Continue"

			# Add the card
			node.add_child(new_card)
			new_card.set_owner(get_tree().get_edited_scene_root())

		# Should be even, multiple cards
		else:
			for i in range(len(page["links"]) / 2):
				var new_card = Node.new()

				var first_card = page["links"][i * 2]
				var second_card = page["links"][i * 2 + 1]

				new_card.set_script(load("res://Prototype/CardComponent.gd"))
				
				new_card.left_text = first_card["name"].split(")")[1]
				new_card.right_text = second_card["name"].split(")")[1]
				new_card.continue_left = NodePath("../../" + first_card["link"])
				new_card.continue_right = NodePath("../../" + second_card["link"])
				new_card.name = first_card["name"].split("(")[1].split(")")[0].strip_edges()

				# Add the card
				node.add_child(new_card)
				new_card.set_owner(get_tree().get_edited_scene_root())


		

func do_run_import(val):
	if run_import == val:
	    return
	elif val:
	    import()
		
	run_import = val