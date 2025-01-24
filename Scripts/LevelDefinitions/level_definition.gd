class_name LevelDefinition
extends Resource

@export var index : int
@export var level : PackedScene

@export var available : bool = false:
	get:
		return available
	set(value):
		available = value
		changed.emit()
