extends Node


const LEVEL_SELECTION = preload("res://Scenes/UI/level_selection.tscn")
const MAIN_MENU = preload("res://Scenes/UI/main_menu.tscn")
const PAUSE_MENU = preload("res://Scenes/UI/pause_menu.tscn")

func _ready() -> void:
	var main_menu = MAIN_MENU.instantiate()
	add_child(main_menu)
