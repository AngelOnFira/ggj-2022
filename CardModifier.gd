extends Node

var child_balance = 0
var stable_balance = 0
var family_balance = 0
var cub_balance = 0

func _ready():
	pass

func update_card(page, card, side):
	if card == "Child":
		if card == "Child" and side == "left":
			child_balance -= 1
		if card == "Child" and side == "right":
			child_balance += 1

		if child_balance == 0:
			get_node("Card").get_node("Curious1").visible = false
			get_node("Card").get_node("Curious2").visible = false
			get_node("Card").get_node("Curious3").visible = false
		if child_balance == 1:
			get_node("Card").get_node("Curious1").visible = true
			get_node("Card").get_node("Curious2").visible = false
			get_node("Card").get_node("Curious3").visible = false
		if child_balance == 2:
			get_node("Card").get_node("Curious1").visible = true
			get_node("Card").get_node("Curious2").visible = true
			get_node("Card").get_node("Curious3").visible = false
		if child_balance == 3:
			get_node("Card").get_node("Curious1").visible = true
			get_node("Card").get_node("Curious2").visible = true
			get_node("Card").get_node("Curious3").visible = true


		if child_balance == -1:
			get_node("Frame").get_node("Fear2").visible = true
			get_node("Card").get_node("Curious2").visible = false
			get_node("Card").get_node("Curious3").visible = false
		if child_balance == -2:
			get_node("Frame").get_node("Fear2").visible = true
			get_node("Card").get_node("Curious2").visible = true
			get_node("Card").get_node("Curious3").visible = false
		if child_balance == -3:
			get_node("Frame").get_node("Fear2").visible = true
			get_node("Card").get_node("Curious2").visible = true
			get_node("Card").get_node("Curious3").visible = true
	

	if card == "Cub" and side == "left":
		cub_balance -= 1
	if card == "Cub" and side == "right":
		cub_balance += 1

	if card == "Family" and side == "left":
		family_balance -= 1
	if card == "Family" and side == "right":
		family_balance += 1

	if card == "Stablemaster" and side == "left":
		family_balance -= 1
	if card == "Stablemaster" and side == "right":
		family_balance += 1