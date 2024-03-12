extends RigidBody2D
class_name Player

const acceleration : float = 5.0
const torpedo_cost : float = -0.5
const acceleration_cost : float = -0.005

@onready var energy_label : Label = %HUD/Energy
@onready var control_locked_hud : Label = %HUD/ConrolLocked

@export var torpedo : PackedScene

@export var max_energy : float = 10
@onready var current_energy : float

signal player_died

func _ready():
	#This prevents a bug where the player shoots the moment they start the level
	#Due to technically still clicking the start button when the level starts
	set_physics_process(false)
	for n in 4:
		await get_tree().physics_frame
		
	set_physics_process(true)
	
	current_energy = max_energy
	

func _physics_process(delta) -> void:
	if (current_energy == 0):
		return
		
	
	var mouse_position : Vector2 = get_viewport().get_mouse_position()
	mouse_position = mouse_position - ((get_viewport().get_visible_rect().size / 2))
	var facing : Vector2 = position.direction_to(mouse_position)
	
	if Input.is_action_pressed("accelerate"):
		give_energy(acceleration_cost)
		apply_central_force(facing * acceleration)
		
	
	if Input.is_action_just_pressed("fire"):
		fire_torpedo(facing)
		
	

func fire_torpedo(facing : Vector2) -> void:
	give_energy(torpedo_cost)
	GlobalAudio.audio_players[1].play() #fire_torpedo
	var instanced_torpedo = torpedo.instantiate()
	get_parent().add_child(instanced_torpedo)
	instanced_torpedo.position = facing * 10 + global_position;
	
	instanced_torpedo._go_towards(facing)
	

func damage() -> void:
	player_died.emit()
	GlobalAudio.audio_players[0].play() #player_death
	queue_free()
	

func _exit_tree():
	damage()
	

func give_energy(amount : float) -> void:
	current_energy += amount
	if current_energy > max_energy:
		current_energy = max_energy
		
	
	if current_energy <= 0 and not control_locked_hud.visible:
		control_locked_hud.visible = true
		current_energy = 0
		
	else:
		control_locked_hud.visible = false
		
	
	energy_label.text = "%0.2f" %current_energy
	
	


