extends CharacterBody2D
class_name Player


@onready var spriteanim: AnimatedSprite2D = $spriteanim
@onready var player: Player = $"."

enum states {IDLE_DOWN, PICKUP_DOWN, WALK_DOWN}


@export var currentState :states
@export var speed: float 
@export var accel: float

func _ready() -> void:
	pass

func _physics_process(_delta: float) -> void:
	
	if Input.is_action_pressed("down_button") :
		currentState = states.WALK_DOWN
	elif Input.is_action_just_released("down_button"):
		currentState = states.IDLE_DOWN
	
	match currentState:
		states.IDLE_DOWN:
			idle_down_function()
		states.PICKUP_DOWN:
			pickup_down_function()
		states.WALK_DOWN:
			walk_down_function()
	move_and_slide()

func change_state(newState):
	currentState = newState
	pass

func idle_down_function():
	spriteanim.play("idle_animation")
	if player.velocity > Vector2.ZERO:
		print(player.velocity)
		player.velocity -= player.velocity*accel

func walk_down_function():
	spriteanim.play("walk_down_animation")
	if velocity.y < speed:
		player.velocity.y += 1 + velocity.y*accel
		print(player.velocity)
	

func pickup_down_function():
	pass
