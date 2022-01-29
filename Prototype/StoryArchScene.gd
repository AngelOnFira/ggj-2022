extends Node2D

func _ready():
	# Make sure each child has a script, and the expected members
	for child in self.get_children():
		print("")
		
		# Check for script
		if child.get_script() == null:
			print("Error! {child} has no script!".format({"child": child.name}))
			continue
			
		# Check for cards
		if child.cards == []:
			print("Error! {child} has no cards!".format({"child": child.name}))
			
		# Check for description
		if child.text_description == "":
			print("Error! {child} has no text_description!".format({"child": child.name}))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
