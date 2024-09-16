extends CharacterBody2D
class_name Player


@onready var spriteanim: AnimatedSprite2D = $spriteanim
@onready var player: Player = $"."


func _ready() -> void:
	pass

func _physics_process(_delta: float) -> void:
	move_and_slide()
