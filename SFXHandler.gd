extends Node


func _ready():
	$SolemnMusic.play()

func play(page, card, side):
	if page == "Hooves":
		$SolemnMusic.stop()
		$DungeonMusic.play()
	if page == "Mules":
		$DungeonMusic.stop()
		$NatureMusic.play()
