extends Control

signal resume_button_pressed
signal to_main_menu_button_pressed

const RSE_GAME_UNPAUSED = preload("res://Data/RSE_GameUnpaused.tres")

func _on_button_resume_pressed() -> void:
	RSE_GAME_UNPAUSED.triggered.emit()
	resume_button_pressed.emit()
	

func _on_button_to_main_menu_pressed() -> void:
	RSE_GAME_UNPAUSED.triggered.emit()
	to_main_menu_button_pressed.emit()
	
