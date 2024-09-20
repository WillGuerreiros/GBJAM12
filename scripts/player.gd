extends CharacterBody2D
class_name Player


@onready var spriteanim: AnimatedSprite2D = $spriteanim
@onready var player: Player = $"."

enum states {
	IDLE_DOWN, PICKUP_DOWN, WALK_DOWN,
	IDLE_UP, PICKUP_UP, WALK_UP,
	IDLE_LEFT, PICKUP_LEFT, WALK_LEFT,
	IDLE_RIGHT, PICKUP_RIGHT, WALK_RIGHT,
	 }

@export var currentState :states
@export var speed: float 
var direction : Vector2

func _ready() -> void:
	pass

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("left_button","right_button","up_button","down_button").normalized()
	match_direction(direction)
	move_and_slide()

func match_direction(direction):
	match direction:
		Vector2.UP:
			velocity = Vector2.UP*speed
			spriteanim.play("walk_up_animation")
		Vector2.DOWN:
			velocity = Vector2.DOWN*speed
			spriteanim.play("walk_down_animation")
		Vector2.LEFT:
			spriteanim.flip_h = true
			spriteanim.play("walk_side_animation")
			velocity = Vector2.LEFT*speed
		Vector2.RIGHT:
			spriteanim.flip_h = false
			spriteanim.play("walk_side_animation")
			velocity = Vector2.RIGHT*speed
		Vector2.ZERO:
			velocity = Vector2.ZERO*speed
			spriteanim.play("idle_down_animation")
