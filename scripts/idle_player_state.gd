extends State
class_name Idle_player_state

@onready var playerUsado: CharacterBody2D


func enter():
	print("entrou no estado player idle")
	playerUsado = get_tree().get_first_node_in_group("Player")

func update(delta):
	if playerUsado:
		playerUsado.spriteanim.play("idle")
