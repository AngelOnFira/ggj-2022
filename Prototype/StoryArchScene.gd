extends Node2D

func _ready():
	# Make sure each child has a script, and the expected members
	for child in self.get_children():
		print("")
		
		# Check for script
		# if child.get_script() == null:
		# 	print("Error! {child} has no script!".format({"child": child.name}))
		# 	continue
			
		# Check for cards
		# if child.cards == []:
		# 	print("Error! {child} has no cards!".format({"child": child.name}))
			
		# Check for description
		# if child.text_description == "":
		# 	print("Error! {child} has no text_description!".format({"child": child.name}))

		# Other tests
		# - Each StoryElement should be in next_node_lookup
		# - Make sure no nodes share the same name
		# - Make sure that each script is of a certain type
		# - Make sure the cards of each decision element follow the structure
		#   - Array of elements, each element should have 3 of its own, first
		#     element should be a valid card

	print("")
	print("Story Begins!")
	print("")

	for page in self.get_children():
		# Pages
		
		# Start with the first story_element
		var next_element_name = page.get_children()[0].name

		# Loop through the story_elements until there are no more
		while true:
			var this_element = self.find_node(next_element_name)

			if this_element.ELEMENT_TYPE == "DecisionElement":
				print("DecisionElement:")
				print("----------------")
			elif this_element.ELEMENT_TYPE == "StoryElement":
				print("StoryElement:")
				print("-------------")


			print("\t", this_element.get_story())
			print("")


			if this_element.ELEMENT_TYPE == "DecisionElement":
				print("\tCard options:")
				for card in this_element.cards:
					print("\t- {card}".format({"card": card}))
				print("")

			next_element_name = this_element.get_next_node()

			if next_element_name == "":
				break

			# Slow down so we can see all the debug text without Godot clipping
			# it
			yield(get_tree().create_timer(0.05), "timeout")

