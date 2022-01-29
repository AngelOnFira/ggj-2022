extends "res://Prototype/CardBehaviour.gd"

var ELEMENT_TYPE = "StoryElement";

func get_story():
	return self.text_description

func get_next_node():
	return next_node_lookup[self.name]
