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
@export var accel: float

func _ready() -> void:
	pass

func _physics_process(_delta: float) -> void:
	
	if Input.is_action_pressed("down_button") :
		currentState = states.WALK_DOWN
	elif Input.is_action_just_released("down_button"):
		currentState = states.IDLE_DOWN
	elif Input.is_action_just_pressed("up_button"):
		currentState = states.WALK_UP
	elif Input.is_action_just_released("up_button"):
		currentState = states.IDLE_UP
	elif Input.is_action_just_pressed("left_button"):
		currentState = states.WALK_LEFT
	elif Input.is_action_just_released("left_button"):
		currentState = states.IDLE_LEFT
	elif Input.is_action_just_pressed("right_button"):
		currentState = states.WALK_RIGHT
	elif Input.is_action_just_released("right_button"):
		currentState = states.IDLE_RIGHT
	
	match currentState:
		states.IDLE_DOWN:
			idle_down_function()
		states.PICKUP_DOWN:
			pickup_down_function()
		states.WALK_DOWN:
			walk_down_function(_delta)
		states.IDLE_UP:
			idle_up_function()
		states.PICKUP_UP:
			pickup_up_function()
		states.WALK_UP:
			walk_up_function(_delta)
		states.IDLE_LEFT:
			idle_lef_function()
		states.PICKUP_LEFT:
			pickup_left_function()
		states.WALK_LEFT:
			walk_left_function(_delta)
		states.IDLE_RIGHT:
			idle_right_function()
		states.PICKUP_RIGHT:
			pickup_right_function()
		states.WALK_RIGHT:
			walk_right_function(_delta)
	move_and_slide()

func change_state(newState):
	currentState = newState
	pass

func idle_down_function():
	spriteanim.play("idle_down_animation")
	player.velocity = Vector2.ZERO
	spriteanim.flip_v = false

func walk_down_function(_delta):
	spriteanim.play("walk_down_animation")
	spriteanim.flip_v = false
	if velocity.y < speed:
		velocity += Vector2.DOWN * accel * _delta
		print(velocity)


func pickup_down_function():
	pass

func idle_up_function():
	velocity = Vector2.ZERO
	spriteanim.play("idle_down_animation")
	spriteanim.flip_v = true
	pass

func pickup_up_function():
	pass

func walk_up_function(_delta):
	spriteanim.play("walk_down_animation")
	spriteanim.flip_v = true
	if velocity.y > -speed:
		velocity += Vector2.UP*accel*_delta
		print(player.velocity)

func idle_lef_function():
	spriteanim.play("idle_down_animation")
	player.velocity = Vector2.ZERO

func pickup_left_function():
	pass

func walk_left_function(_delta):
	if velocity.x > -speed:
		velocity += Vector2.LEFT*_delta*accel
		print(velocity)

func idle_right_function():
	spriteanim.play("idle_down_animation")
	player.velocity = Vector2.ZERO

func pickup_right_function():
	pass

func walk_right_function(_delta):
	if velocity.x < speed:
		velocity += Vector2.RIGHT*_delta*accel
		print(velocity)
