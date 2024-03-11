extends RigidBody2D

@export var speed : float = 2000
@export var drop : PackedScene

var death_queued : bool = false

func _choose_target(player_position : Vector2) -> void:
	var force_direction : Vector2 = position.direction_to(-player_position)
	apply_central_force(force_direction * speed)
	

func _go_towards(direction : Vector2) -> void:
	apply_central_force(direction * speed)
	

func damage() -> void:
	if death_queued:
		return
		
	else:
		death_queued = true
		
	
	if drop:
		var drop_inst : RigidBody2D = drop.instantiate()
		drop_inst.global_position = global_position
		get_parent().add_child.call_deferred(drop_inst)
	
	queue_free()
	
