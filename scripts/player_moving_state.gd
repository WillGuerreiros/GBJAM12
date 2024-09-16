extends State
class_name Moving_player_state

@onready var playerUsado = get_tree().get_first_node_in_group("Player")
@export var speed: float 
var moveDir : Vector2

func _ready() -> void:
	pass

func enter():
	print("entrou no estado moving")


func update(_delta):
	if playerUsado:
		playerUsado.spriteanim.play("walk_down")
	
func  physics_update(_delta:float):
	if Input.is_action_pressed("right_button"):
		playerUsado.velocity = speed*Vector2.RIGHT
	elif Input.is_action_pressed("left_button"):
		playerUsado.velocity = speed*Vector2.LEFT
	elif Input.is_action_pressed("up_button"):
		playerUsado.velocity = speed*Vector2.UP
	elif Input.is_action_pressed("down_button"):
		playerUsado.velocity = speed*Vector2.DOWN
	else:
		playerUsado.velocity = Vector2.ZERO
