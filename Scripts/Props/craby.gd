extends Node2D

@export var attack_delay : float = 5

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start(attack_delay)
	animation_player.play("idle")

func _on_timer_timeout() -> void:
	animation_player.play("attack")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "attack":
		timer.start(attack_delay)
		animation_player.play("idle")
