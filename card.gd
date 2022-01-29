extends PanelContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	
	# Set the CardSprite to scale properly to the container
	# why : 	cannot use textureRect as it has no maximum, sprite does not interfer
	#		but you can proably use textureRect, with this script
	var sprite_height : float = float($CardSprite.get_texture().get_height())
	var sprite_width : float = float($CardSprite.get_texture().get_width())
	var container_height :float = self.get_size().y
	var container_width :float = self.get_size().x
	var scale : Vector2 = Vector2(container_width/sprite_width,container_height/sprite_height)
	$CardSprite.apply_scale(scale)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta):
#	pass
	
func good_action():
	get_tree().call_group("CardManager","card_action","good",self)
	pass
	
func bad_action():
	get_tree().call_group("CardManager","card_action","bad",self)
	pass
