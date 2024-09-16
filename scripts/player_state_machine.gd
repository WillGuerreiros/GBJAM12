extends Node
class_name Player_state_machine

@export var initial_state : State

var current_state: State
var states:Dictionary = {}

func _ready() -> void:
	for child in get_children(): #loop para colocar os estados no dicionario de estados
		if child is State:
			states[child.name.to_lower()] = child #to_lower() serve para deixar tudo em minusculo
			print(states)


func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)
