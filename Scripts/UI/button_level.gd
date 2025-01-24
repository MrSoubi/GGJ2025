class_name ButtonLevel
extends Button

@export var level_definition : LevelDefinition

signal level_button_pressed(level_index : int)

func _ready() -> void:
	disabled = not level_definition.available
	level_definition.changed.connect(update_visuals)

func _on_pressed() -> void:
	level_button_pressed.emit(level_definition.index)

func update_visuals():
	disabled = not level_definition.available
