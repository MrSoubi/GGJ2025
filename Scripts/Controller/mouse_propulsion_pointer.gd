extends Node2D

var target : BubbleController

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite
@onready var ventilation_particles: GPUParticles2D = $VentilationParticles
@onready var sfx: AudioStreamPlayer = $AudioStreamPlayer

func _ready() -> void:
	animated_sprite.stop()
	ventilation_particles.emitting = false

var tween
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed():
			animated_sprite.play()
			ventilation_particles.emitting = true
			if tween != null:
				tween.kill()
			tween = create_tween()
			tween.tween_property(sfx,"volume_db",0,1)
		else:
			animated_sprite.stop()
			ventilation_particles.emitting = false
			if tween != null:
				tween.kill()
			tween = create_tween()
			tween.tween_property(sfx,"volume_db",-80,4)

func _process(delta: float) -> void:
	if target != null:
		look_at(target.position)
		
	position = get_global_mouse_position()


func _on_bubble_spawner_bubble_spawned(bubble: BubbleController) -> void:
	target = bubble
	sfx.volume_db = -80
	sfx.play()
