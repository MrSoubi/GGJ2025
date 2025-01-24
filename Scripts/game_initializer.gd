extends Node

@onready var main_menu: Control = $MainMenu
@onready var level_selection: Control = $LevelSelection
@onready var pause_menu: Control = $PauseMenu

func _ready() -> void:
	main_menu.visible = true
	level_selection.visible = false
	pause_menu.visible = false

func _on_main_menu_button_exit_pressed() -> void:
	get_tree().exit()

func _on_main_menu_button_play_pressed() -> void:
	level_selection.visible = true
	main_menu.visible = false

func _on_main_menu_button_settings_pressed() -> void:
	pass # Replace with function body.


func _on_level_selection_button_go_back_to_main_menu_pressed() -> void:
	level_selection.visible = false
	main_menu.visible = true
