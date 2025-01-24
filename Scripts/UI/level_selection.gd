extends Control

signal button_go_back_to_main_menu_pressed
signal level_selected(level_index : int)

func _on_button_exit_pressed() -> void:
	button_go_back_to_main_menu_pressed.emit()

func _on_grid_container_button_level_pressed(level_index : int) -> void:
	level_selected.emit(level_index)
