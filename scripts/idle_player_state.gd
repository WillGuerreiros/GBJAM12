extends State
class_name Idle_player_state

@onready var playerUsado: CharacterBody2D


func enter():
	print("entrou no estado player idle")
	playerUsado = get_tree().get_first_node_in_group("Player")

func update(delta):
	if playerUsado:
		playerUsado.spriteanim.play("idle")
	
func physics_update(_delta:float):
	if Input.is_action_just_pressed("left_button") or Input.is_action_just_pressed("right_button") or Input.is_action_just_pressed("up_button") or Input.is_action_just_pressed("down_button"):
		print("apertou botao")
		transitioned.emit(self,"Moving_player_state")
		
