extends Node

#Ships
@export var ships : Array[PackedScene] = []

#Spawn Parameters
@export var player : Node2D
const offset_from_center : float = 180

func _on_timer_timeout():
	var ship :Node2D = ships.pick_random().instantiate()
	get_parent().add_child(ship)
	ship.position = Vector2(
		randf_range(-1, 1), 
		randf_range(-1, 1))
	
	ship.position = ship.position.direction_to(Vector2.ZERO) * offset_from_center
	
	
