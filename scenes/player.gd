extends RigidBody2D
class_name Player

const acceleration : float = 5.0

@export var torpedo : PackedScene

@export var max_energy : float = 10
@onready var current_energy : float = max_energy

signal player_died

func _physics_process(delta) -> void:
	var mouse_position : Vector2 = get_viewport().get_mouse_position()
	mouse_position = mouse_position - ((get_viewport().get_visible_rect().size / 2))
	var facing : Vector2 = position.direction_to(mouse_position)
	
	if Input.is_action_pressed("accelerate"):
		give_energy(-0.01)
		apply_central_force(facing * acceleration)
		
	
	if Input.is_action_just_pressed("fire"):
		fire_torpedo(facing)
	

func fire_torpedo(facing : Vector2) -> void:
	give_energy(-1)
	var instanced_torpedo = torpedo.instantiate()
	get_parent().add_child(instanced_torpedo)
	instanced_torpedo.position = facing * 10 + global_position;
	
	instanced_torpedo._go_towards(facing)
	

func damage() -> void:
	player_died.emit()
	queue_free()
	

func give_energy(amount : int) -> void:
	current_energy += amount
	if 0 >= current_energy:
		damage()
		
	elif current_energy > max_energy:
		current_energy = max_energy
		
	
	print(current_energy)
	


