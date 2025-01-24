extends RigidBody2D

@export var breathForce : float
@export var maxBreathDist : float

var mousePos : Vector2
var distFromMouse : float

func _process(delta: float) -> void:
	mousePos = get_global_mouse_position()
	distFromMouse = mousePos.distance_to(position)

func _physics_process(delta: float) -> void:
	if distFromMouse < maxBreathDist:
		var force : float = lerpf(0, breathForce, maxBreathDist / distFromMouse)
		var moveDir : Vector2 = (position - mousePos).normalized()

		apply_force(moveDir * force)
