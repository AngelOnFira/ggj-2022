extends PanelContainer

var text_in_field: String = ""
var current_text: String = ""
var text_to_add: Array = []
var culmitive_delta: float = 0.0
export var update_speed: float = 0
var current_index_in_text_to_add: int = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var update_flag: bool = false
	self.culmitive_delta = self.culmitive_delta + delta
	if culmitive_delta > update_speed:
		self.culmitive_delta = self.culmitive_delta - self.update_speed
		update_flag = true

	if len(text_to_add) <= 0:
		return

	if self.current_index_in_text_to_add >= len(self.text_to_add[0]["text"]):
		self.current_index_in_text_to_add = 0
		self.current_text = (
			"["
			+ text_to_add[0]["format"]
			+ "]"
			+ cumulate_string(text_to_add[0]["text"], 0, len(text_to_add[0]["text"]) - 1)
			+ "[/"
			+ text_to_add[0]["format"]
			+ "]"
		)
		self.text_in_field = self.text_in_field + self.current_text + "\n\n"
		self.current_text = ""
		self.text_to_add.pop_front()

	if update_flag and len(self.text_to_add) > 0:
		var temp = cumulate_string(text_to_add[0]["text"], 0, self.current_index_in_text_to_add)
		self.current_text = (
			"["
			+ text_to_add[0]["format"]
			+ "]"
			+ cumulate_string(text_to_add[0]["text"], 0, self.current_index_in_text_to_add)
			+ "[/"
			+ text_to_add[0]["format"]
			+ "]"
			+ "\n\n"
		)

		self.current_index_in_text_to_add = self.current_index_in_text_to_add + 1
		update_flag = false

	$TextLabel.bbcode_text = self.text_in_field + self.current_text


func cumulate_string(array: PoolStringArray, start: int, end: int, delimiter: String = " "):
	var text = ""
	if len(array) <= 0:
		return text
	if len(array) < end or end < 0:
		end = len(array) - 1
	if len(array) < start or start <= 0:
		start = 0

	for i in range(start, end + 1):
		text = text + delimiter + String(array[i])

	return text


# clears field of all text
func clear():
	$TextLabel.text = ""


# appends text to the rich text label
# defualt is center align
# text : text to be appended
# align : align option for text based on bbcode_text (defualt "center")
func append_text(text: String, align: String = "b"):
	#var insert_text = "[" + align + "]" + text + "[/" + align + "]"
	#$TextLabel.bbcode_text = $TextLabel.text + "\n" + insert_text
	text_to_add.append({"format": align, "text": text.split(" ")})
	pass
