extends RigidBody2D

const acceleration : float = 5.0

func _physics_process(delta) -> void:
	if Input.is_action_pressed("accelerate"):
		var mouse_position : Vector2 = get_viewport().get_mouse_position()
		mouse_position = mouse_position - ((get_viewport().get_visible_rect().size / 2))
		var force_direction : Vector2 = position.direction_to(mouse_position)
		
		apply_central_force(force_direction * acceleration)
		
	

func damage() -> void:
	queue_free()
	
