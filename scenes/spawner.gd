extends Node

@export var ship : PackedScene

var speed : Vector2 = Vector2(5000, 6000)

@onready var play_area : Vector2 = (get_viewport().get_visible_rect().size / 2)
var spawn_distance : float
@export var spawn_distance_offset : float = 50

@export var min_wait_time : float = 1.2
@export var wait_time_step : float = 0.1

func _ready():
	var min_distance = (play_area.x if play_area.x > play_area.y else play_area.y)
	
	spawn_distance = min_distance + spawn_distance_offset
	

func _on_timer_timeout() -> void:
	var instanced_ship = ship.instantiate()
	get_parent().add_child(instanced_ship)
	
	var position_direction := Vector2(randf_range(-1.0,1.0), randf_range(-1.0,1.0)).normalized()
	instanced_ship.position = position_direction * spawn_distance;
	
	var target := Vector2(randf_range(-play_area.x,play_area.x), 
		randf_range(-play_area.y,play_area.y))
	
	var this_speed : float = randf_range(speed.x, speed.y)
	
	instanced_ship.apply_central_force(instanced_ship.position.direction_to(target) * this_speed)
	
	if $Timer.wait_time > min_wait_time:
		$Timer.wait_time -= wait_time_step
	
