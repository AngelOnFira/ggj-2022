extends "res://Prototype/CardBehaviour.gd"

var ELEMENT_TYPE = "DecisionElement";

# Don't reorder this list?
# "Cub", "Child", "Blade", "Hunger", "Family"
export(Array, Array, String, MULTILINE) var cards

func get_story():
	return self.text_description

func get_next_node():
	return self.next_node_lookup[self.name]
