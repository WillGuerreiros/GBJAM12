extends CharacterBody2D
class_name Player



@onready var spriteanim: AnimatedSprite2D = $spriteanim
@onready var player: Player = $"."




func _physics_process(delta: float) -> void:
	move_and_slide()
