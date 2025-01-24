extends Node2D

const RSE_GOAL_REACHED = preload("res://Data/RSE_GoalReached.tres")
@onready var debug_label: Label = $DebugLabel

func _ready() -> void:
	debug_label.visible = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is BubbleController:
		finish_level.call_deferred()

func finish_level():
	RSE_GOAL_REACHED.triggered.emit()
