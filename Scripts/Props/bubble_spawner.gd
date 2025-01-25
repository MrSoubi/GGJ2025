extends Node2D

signal bubble_spawned(bubble: BubbleController)

const BUBBLE = preload("res://Scenes/Controller/Bubble.tscn")
const RSE_LEVEL_START = preload("res://Data/RSE_LevelStart.tres")

@onready var debug_label: Label = $DebugLabel

func _ready() -> void:
	debug_label.visible = false
	RSE_LEVEL_START.triggered.connect(spawn_bubble)

func spawn_bubble() -> void :
	var bubble = BUBBLE.instantiate()
	get_parent().add_child.call_deferred(bubble)
	bubble.global_position = global_position
	bubble_spawned.emit(bubble)
