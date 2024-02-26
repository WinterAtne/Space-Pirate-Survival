extends RigidBody2D

const acceleration : float = 5.0
const torpedo_speed : float = 10000

@export var torpedo : PackedScene

func _physics_process(delta) -> void:
	var mouse_position : Vector2 = get_viewport().get_mouse_position()
	mouse_position = mouse_position - ((get_viewport().get_visible_rect().size / 2))
	var facing : Vector2 = position.direction_to(mouse_position)
	
	if Input.is_action_pressed("accelerate"):
		apply_central_force(facing * acceleration)
		
	
	if Input.is_action_just_pressed("fire"):
		fire_torpedo(facing)
	

func fire_torpedo(facing : Vector2) -> void:
	var instanced_torpedo = torpedo.instantiate()
	get_parent().add_child(instanced_torpedo)
	instanced_torpedo.position = facing * 16 + global_position;
	
	instanced_torpedo.apply_central_force(facing * torpedo_speed)
	

func damage() -> void:
	queue_free()
	
