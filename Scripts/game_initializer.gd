extends Node

@onready var main_menu: Control = $MainMenu
@onready var level_selection: Control = $LevelSelection
@onready var pause_menu: Control = $PauseMenu
@onready var level_instance: Node = $Levels

@export var levels : Array[LevelDefinition]

var current_level

func _ready() -> void:
	main_menu.visible = true
	level_selection.visible = false
	pause_menu.visible = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		if pause_menu.visible :
			pause_menu.visible = false
			get_tree().paused = false
		
		else:
			pause_menu.visible = true
			get_tree().paused = true
			

func init_levels() -> void :
	for level in levels:
		level.available = false
	
	levels[0].available = true

func start_level(level : LevelDefinition):
	main_menu.visible = false
	level_selection.visible = false
	pause_menu.visible = false
	current_level = level.level.instantiate()
	level_instance.add_child(current_level)

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

func _on_level_selection_level_selected(level_index: int) -> void:
	var level_selected : LevelDefinition = get_level_definition_from_index(level_index)
	if level_selected.available:
		start_level(level_selected)

func get_level_definition_from_index(level_index : int) -> LevelDefinition:
	for level in levels:
		if level.index == level_index:
			return level
	
	return null

func _on_pause_menu_resume_button_pressed() -> void:
	get_tree().paused = false
	pause_menu.visible = false

func _on_pause_menu_to_main_menu_button_pressed() -> void:
	current_level.queue_free()
	get_tree().paused = false
	pause_menu.visible = false
	main_menu.visible = true
