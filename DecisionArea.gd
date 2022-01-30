extends Control

export var decision: String = "default"
var showing_text = false

func _process(delta):
	if !showing_text:
		self.get_node("CPUParticles2D").emitting = false
		$AnimationPlayer.stop()

func _on_DecisionArea_mouse_entered():
	self.get_tree().call_group("MouseCards", "enter_area", self.decision, self)
	if showing_text:
		self.get_node("CPUParticles2D").emitting = true
		$AnimationPlayer.play("Pulse")


func _on_DecisionArea_mouse_exited():
	self.get_tree().call_group("MouseCards", "exit_area", self)



func show_text():
	$CardFlavour.show()
	showing_text = true
	

func hide_text():
	$CardFlavour.hide()
	showing_text = false


func set_text(text: String):
	$CardFlavour.text = text


func get_text():
	return $CardFlavour.text
