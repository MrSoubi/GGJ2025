extends Node

@onready var main_menu: CanvasLayer = $MainMenu
@onready var level_selection: CanvasLayer = $LevelSelection
@onready var pause_menu: CanvasLayer = $PauseMenu
@onready var level_instance: Node = $Levels
@onready var transition_layer: Fader = $TransitionLayer

@export var levels : Array[LevelDefinition]

const RSE_LEVEL_START = preload("res://Data/RSE_LevelStart.tres")
const RSE_GOAL_REACHED = preload("res://Data/RSE_GoalReached.tres")
const RSE_GAME_STARTED = preload("res://Data/RSE_GameStarted.tres")
const RSE_ENTERED_MAIN_MENU = preload("res://Data/RSE_EnteredMainMenu.tres")
const RSE_GAME_PAUSED = preload("res://Data/RSE_GamePaused.tres")
const RSE_GAME_UNPAUSED = preload("res://Data/RSE_GameUnpaused.tres")

var current_level
var current_level_index : int

func _ready() -> void:
	RSE_GOAL_REACHED.triggered.connect(go_to_next_level)
	main_menu.visible = true
	level_selection.visible = false
	pause_menu.visible = false
	get_tree().paused = true

func enable_main_menu() -> void:
	RSE_ENTERED_MAIN_MENU.triggered.emit()
	
	transition_layer.transition()
	await transition_layer.on_transition_finished
	
	main_menu.visible = true
	level_selection.visible = false
	pause_menu.visible = false
	get_tree().paused = true

func enable_level_selection_menu() -> void:
	transition_layer.transition()
	await transition_layer.on_transition_finished
	
	main_menu.visible = false
	level_selection.visible = true
	pause_menu.visible = false
	get_tree().paused = true

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		if pause_menu.visible :
			RSE_GAME_UNPAUSED.triggered.emit()
			pause_menu.visible = false
			get_tree().paused = false
		else:
			RSE_GAME_PAUSED.triggered.emit()
			pause_menu.visible = true
			get_tree().paused = true

func init_levels() -> void :
	for level in levels:
		level.available = false
	
	levels[0].available = true

func go_to_next_level() -> void:
	transition_layer.transition()
	await transition_layer.on_transition_finished
	
	if current_level:
		current_level.queue_free()
	
	if current_level_index >= levels.size() :
		enable_main_menu()
	else:
		current_level_index += 1
		var next_level_definition = get_level_definition_from_index(current_level_index)
		next_level_definition.available = true
		start_level(next_level_definition)

func launch_starting_cinematic():
	pass

func handle_end_game():
	pass

func start_level(level : LevelDefinition):
	main_menu.visible = false
	level_selection.visible = false
	pause_menu.visible = false
	get_tree().paused = false
	current_level_index = level.index
	current_level = level.level.instantiate()
	level_instance.add_child(current_level)
	RSE_LEVEL_START.triggered.emit()

func _on_main_menu_button_exit_pressed() -> void:
	get_tree().quit()

func _on_main_menu_button_play_pressed() -> void:
	enable_level_selection_menu()

func _on_main_menu_button_settings_pressed() -> void:
	pass # Replace with function body.

func _on_level_selection_button_go_back_to_main_menu_pressed() -> void:
	enable_main_menu()

func _on_level_selection_level_selected(level_index: int) -> void:
	RSE_GAME_STARTED.triggered.emit()
	
	transition_layer.transition()
	await transition_layer.on_transition_finished
	
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
	if current_level:
		current_level.queue_free()
	enable_main_menu()
