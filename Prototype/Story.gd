extends Node

var current_page:Page = null

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

	for chapter in self.get_children():
		# Pages
		
		# Start with the first story_element
		var next_page_name = chapter.get_children()[0].name

	# Loop through the story_elements until there are no more
		self.current_page = self.find_node(next_page_name)

		# Print the story text
		print("\t", self.current_page.get_story())
	
		#Debug
		# Print each card and the options in those cards
		if current_page.get_cards() != []:
			for card in current_page.get_cards():
				print(card.id)
				print("\t>", card.left_text, "(%s)" % [card.left_pointer])
				print("\t>", card.right_text, "(%s)" % [card.left_pointer])
				print("")

		
		
		# XXX: Debug; Goto the next page in the story, regardless of choice
#		if next_page_name == "":
#			# Get current page index
#			var current_page_index = chapter.get_children().find(current_page)
#
#			# Check if there is a next page
#			if current_page_index + 1 < len(chapter.get_children()):
#				var next_page = chapter.get_child(current_page_index + 1)
#				next_page_name = next_page.name
#			else:
#				# There is no next page, so we are done
#				break
			

		# Slow down so we can see all the debug text without Godot clipping
		# it
#		yield(get_tree().create_timer(0.05), "timeout")
