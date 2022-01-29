extends Node


# export var cards = []
export(String, MULTILINE) var text_description
var next_node: Node

# This links from one node to the next. Should work regarless of the type of
# element. For example, a DecisionElement should be able to link to a
# StoryElement.
var next_node_lookup = {
	"TownStory": "VillageBoundaries",
	"VillageBoundaries": "BrotherSaying",
	"BrotherSaying": "WarmthSun",
	"WarmthSun": "EdgeForest",
	"EdgeForest": "BirdSongs",
	"BirdSongs": "HungerMonster",
	"HungerMonster": "",
}

var decision_dictionary: Dictionary = {} 


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func callback():
	pass
	
