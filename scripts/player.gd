extends CharacterBody2D
class_name Player


@onready var spriteanim: AnimatedSprite2D = $spriteanim
@onready var player: Player = $"."

var state = ["idle_down","pickup_down","walk_down"]


func _ready() -> void:
	pass

func _physics_process(_delta: float) -> void:
	check_states()
	move_and_slide()

func check_states():
	pass
