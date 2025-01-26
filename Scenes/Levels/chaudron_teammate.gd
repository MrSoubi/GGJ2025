extends Sprite2D

var has_spawned : bool = false
@export var team_mate : PackedScene
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is BubbleController:
		spawn_bubble()

func spawn_bubble():
	if not has_spawned:
		has_spawned = true
		var new_team_mate = team_mate.instantiate()
		add_child(new_team_mate)
		audio_stream_player.play()
	
