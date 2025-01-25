class_name BubbleController
extends RigidBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@export var breathForce : float
@export var maxBreathDist : float
@export var max_speed : float

var mousePos : Vector2
var distFromMouse : float

var canMove : bool

const RSE_ON_PLAYER_DEATH = preload("res://Data/RSE_OnPlayerDeath.tres")

func _ready() -> void:
	RSE_ON_PLAYER_DEATH.triggered.connect(start_death_anim)

func start_death_anim():
	animated_sprite_2d.play("death")

func _process(delta: float) -> void:
	mousePos = get_global_mouse_position()
	distFromMouse = mousePos.distance_to(position)

func _physics_process(delta: float) -> void:
	if canMove && distFromMouse < maxBreathDist:
		var force : float = lerpf(0, breathForce, maxBreathDist / distFromMouse)
		var moveDir : Vector2 = (position - mousePos).normalized()
		
		apply_force(moveDir * force)
		apply_torque(2500)
		
		linear_velocity = linear_velocity.limit_length(max_speed)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		canMove = event.is_pressed()
