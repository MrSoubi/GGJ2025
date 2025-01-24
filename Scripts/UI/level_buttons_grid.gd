extends GridContainer

signal button_level_pressed(level_index : int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for button in get_children():
		if button is ButtonLevel:
			button.level_button_pressed.connect(send_level_selected)

func send_level_selected(level_index : int):
	button_level_pressed.emit(level_index)
