extends Control

signal button_play_pressed
signal button_settings_pressed
signal button_exit_pressed

func _on_button_play_pressed() -> void:
	button_play_pressed.emit()

func _on_button_settings_pressed() -> void:
	button_settings_pressed.emit()

func _on_button_exit_pressed() -> void:
	button_exit_pressed.emit()
