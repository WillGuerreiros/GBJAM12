extends CharacterBody2D


@export var speed :float = 100
@export var acceleration: float = 100


func _physics_process(delta: float) -> void:
	var direction: Vector2 = Input.get_vector("left_button","right_button","up_button","down_button")
	print(direction)
	velocity.x = move_toward(velocity.x,speed*direction.x,acceleration)
	velocity.y = move_toward(velocity.y,speed*direction.y,acceleration)
	move_and_slide()
