extends State
class_name Moving_player_state

@onready var playerUsado = get_tree().get_first_node_in_group("Player")

func _ready() -> void:
	pass

func enter():
	print("entrou no estado moving")


func update(_delta):
	if playerUsado:
		playerUsado.spriteanim.play("walk_down")
