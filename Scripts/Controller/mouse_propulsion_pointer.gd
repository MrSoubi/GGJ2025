extends Node2D

var target : BubbleController

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite
@onready var ventilation_particles: GPUParticles2D = $VentilationParticles

func _ready() -> void:
	animated_sprite.stop()
	ventilation_particles.emitting = false


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed():
			animated_sprite.play()
			ventilation_particles.emitting = true
		else:
			animated_sprite.stop()
			ventilation_particles.emitting = false

func _process(delta: float) -> void:
	if target != null:
		look_at(target.position)
		
	position = get_global_mouse_position()


func _on_bubble_spawner_bubble_spawned(bubble: BubbleController) -> void:
	target = bubble
