extends RigidBody2D

@export var mousePos : Vector2

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		mousePos = event.position
