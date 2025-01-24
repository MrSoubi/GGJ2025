extends Control

signal button_go_back_to_main_menu_pressed

func _on_button_exit_pressed() -> void:
	button_go_back_to_main_menu_pressed.emit()
