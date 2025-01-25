extends Camera2D

# Le Node2D que la caméra doit suivre
@export var target: Node2D

# La distance minimale entre la caméra et le target avant de commencer à suivre
@export var target_offset: Vector2 = Vector2.ZERO

# Vitesse de suivi de la caméra (1.0 signifie un suivi instantané, des valeurs plus faibles permettent un effet de "lissage")
@export var smoothness: float = 0.1

func _ready():
	# Si un target est spécifié, on commence à le suivre
	if target:
		position = target.position + offset

func _process(delta):
	if target:
		# Calculer la position de la caméra pour suivre le target
		var target_position = target.position + offset
		
		# Application du lissage pour rendre le mouvement plus fluide
		position = position.lerp(target_position, smoothness)


func _on_bubble_spawner_bubble_spawned(bubble: BubbleController) -> void:
	target = bubble
