extends Control

export var decision: String = "default"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_DecisionArea_mouse_entered():
	self.get_tree().call_group("MouseCards", "enter_area", self.decision, self)
	pass  # Replace with function body.


func _on_DecisionArea_mouse_exited():
	self.get_tree().call_group("MouseCards", "exit_area", self)
	pass  # Replace with function body.


func show_text():
	$CardFlavour.show()
	pass


func hide_text():
	$CardFlavour.hide()
	pass


func set_text(text: String):
	$CardFlavour.text = text
	pass


func get_text():
	return $CardFlavour.text
	pass
