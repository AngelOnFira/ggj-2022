extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var deck_cards:Array = []
var child_cards:Array = []
var previous_theta = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	self.set_global_position(get_viewport().get_mouse_position())
	var t = get_viewport().get_mouse_position().x/get_viewport_rect().size.x
	var theta = PI/4.0 *(t) - PI/4.0*(1.0-t)
	
	var temp_transform = Transform(self.transform)
	temp_transform.basis = Basis(Vector3(0,0,1),theta-previous_theta) * temp_transform.basis
	self.transform = Transform2D(temp_transform)
	self.previous_theta = theta
	
	
	if Input.is_action_just_released("mouse_button_left"):
		print("test")
		for child in self.child_cards:
			self.remove_child(child)
		for child_dup in self.deck_cards:
			child_dup.show()
		
		deck_cards = []
		child_cards = []
	

func new_card_mouse_hover(card:Control,deck_card:Control):
	#var position:Vector2 = Vector2(0,0)
	
	card.set_position(Vector2(-card.get_rect().size.x/2,-card.get_rect().size.y/2))
	self.deck_cards.append(deck_card)
	self.child_cards.append(card)
	self.add_child(card)
