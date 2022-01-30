extends Node


func _ready():
	pass

func play():
	var i = round(rand_range(0, 2))
	var selected = get_child(i)
	selected.play()
