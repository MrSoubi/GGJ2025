extends Area2D

@export var force : float = 10
var target : BubbleController
@onready var sfx: AudioStreamPlayer = $SFX

func _ready() -> void:
	sfx.volume_db = -80
	sfx.play()

func _on_body_entered(body: Node2D) -> void:
	if body is BubbleController:
		target = body
		start_sound()

func _on_body_exited(body: Node2D) -> void:
	if body is BubbleController:
		target = null
		stop_sound()
	
func _physics_process(delta: float) -> void:
	var direction = self.global_transform.basis_xform(Vector2.RIGHT)
	if target:
		target.apply_force(direction * force)

func start_sound():
	var tween := create_tween()
	tween.tween_property(sfx,"volume_db",0,0.5)

func stop_sound():
	var tween := create_tween()
	tween.tween_property(sfx,"volume_db",-80,2)
