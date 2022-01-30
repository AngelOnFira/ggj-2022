extends Control

export var decision: String = "default"


func _on_DecisionArea_mouse_entered():
	self.get_tree().call_group("MouseCards", "enter_area", self.decision, self)


func _on_DecisionArea_mouse_exited():
	self.get_tree().call_group("MouseCards", "exit_area", self)


func show_text():
	$CardFlavour.show()


func hide_text():
	$CardFlavour.hide()


func set_text(text: String):
	$CardFlavour.text = text


func get_text():
	return $CardFlavour.text
