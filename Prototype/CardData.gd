extends Node
class_name CardData

var left_text: String
var right_text: String
var left_pointer: NodePath
var right_pointer: NodePath
var id: String


func _init(id, left_text, right_text, left_pointer, right_pointer):
	self.left_text = left_text
	self.right_text = right_text
	self.left_pointer = left_pointer
	self.right_pointer = right_pointer
	self.id = id


func print_data():
	print(self.left_text)
	print(self.right_text)
	print(self.left_pointer)
	print(self.right_pointer)
	print(self.id)
