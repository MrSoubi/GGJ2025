extends RigidBody2D

@export var breathForce : float
@export var maxBreathDist : float

var mousePos : Vector2
var distFromMouse : float

var canMove : bool

func _process(delta: float) -> void:
	mousePos = get_global_mouse_position()
	distFromMouse = mousePos.distance_to(position)

func _physics_process(delta: float) -> void:
	if canMove && distFromMouse < maxBreathDist:
		var force : float = lerpf(0, breathForce, maxBreathDist / distFromMouse)
		var moveDir : Vector2 = (position - mousePos).normalized()

		apply_force(moveDir * force)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		canMove = event.is_pressed()
