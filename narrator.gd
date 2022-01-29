extends PanelContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta):
#	pass

# clears field of all text
func clear():
	$TextLabel.text = ""
	
# appends text to the rich text label
# defualt is center align
# text : text to be appended
# align : align option for text based on bbcode_text (defualt "center")
func append_text(text:String ,align:String ="center"):
	var insert_text = "[" + align + "]" + text + "[/" + align + "]"
	$TextLabel.text = $TextLabel.text + "\n" + insert_text
	pass
