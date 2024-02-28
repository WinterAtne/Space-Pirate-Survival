extends RigidBody2D

@export var speed : float = 2000

func _choose_target(player_position : Vector2) -> void:
	var force_direction : Vector2 = position.direction_to(-player_position)
	apply_central_force(force_direction * speed)
	

func damage() -> void:
	queue_free()
	
