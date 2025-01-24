extends Control

signal resume_button_pressed
signal to_main_menu_button_pressed

func _on_button_resume_pressed() -> void:
	resume_button_pressed.emit()

func _on_button_to_main_menu_pressed() -> void:
	to_main_menu_button_pressed.emit()
