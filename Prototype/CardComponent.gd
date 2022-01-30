extends Node

export(String, MULTILINE) var left_text
export(String, MULTILINE) var right_text

export(NodePath) var continue_left
export(NodePath) var continue_right


func get_id():
	return self.name
