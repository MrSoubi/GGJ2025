extends Area2D

@export var force : float = 10
var target : BubbleController

func _on_body_entered(body: Node2D) -> void:
	if body is BubbleController:
		target = body

func _on_body_exited(body: Node2D) -> void:
	if body is BubbleController:
		target = null
	
func _physics_process(delta: float) -> void:
	var direction = self.global_transform.basis_xform(Vector2.LEFT)
	if target:
		target.apply_force(direction * force)
