extends CharacterBody2D
class_name Player



@onready var spriteanim: AnimatedSprite2D = $spriteanim
@onready var player: Player = $"."

var direction: Vector2

func _physics_process(delta: float) -> void:
	pass
