extends RigidBody2D

var target : BubbleController
var speed : float = 100

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	animation_player.play("idle")

func _process(delta: float) -> void:
	if target != null:
		var direction : Vector2 = (target.position - position).normalized()
		linear_velocity = direction * speed

func _on_player_detection_body_entered(body: Node2D) -> void:
	if body is BubbleController:
		target = body
		animation_player.play("follow")


func _on_player_detection_body_exited(body: Node2D) -> void:
	if body is BubbleController:
		target = null
		animation_player.play("idle")
		linear_velocity = Vector2.ZERO
