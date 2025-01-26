extends RigidBody2D

func _ready() -> void:
	var force : Vector2
	force.x = 10000
	force.y = 10000
	apply_force(force)

func shake() -> void:
	print("shake")
	var force : Vector2
	force.x = randf_range(-1, 1) * 50000
	force.y = randf_range(-1, 0) * 50000
	apply_force(force)

func _on_mouse_entered() -> void:
	print("test")
	shake()
