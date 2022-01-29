extends Node


# export var cards = []
export(String, MULTILINE) var text_description
var next_node: Node

# This links from one node to the next. Should work regarless of the type of
# element. For example, a DecisionElement should be able to link to a
# StoryElement.
var next_node_lookup = {
	
}

var decision_dictionary: Dictionary = {} 


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func callback():
	pass
	

func get_next_node():
	# Check if name is in the dictionary
	if self.name in self.next_node_lookup:
		return self.next_node_lookup[self.name]
	else:
		return ""
	
func get_story():
	return self.text_description

