class_name ButtonLevel
extends Button

@export var level_index : int

signal level_button_pressed(level_index : int)

func _on_pressed() -> void:
	level_button_pressed.emit(level_index)
