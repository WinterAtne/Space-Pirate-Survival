extends Node2D

@export var levels : Array[PackedScene] = []

var current_level_index : int = 0
var current_level : Level

func start_level() -> void:
	%MainMenu.visible = false
	%DeathScreen.visible = false
	%Background.set_process(false)
	
	current_level = levels[current_level_index].instantiate()
	add_child(current_level)
	current_level.level_ended.connect(end_level.bind())
	

func end_level() -> void:
	%MainMenu.visible = false
	%DeathScreen.visible = true
	%Background.set_process(true)
	
	if current_level:
		current_level.queue_free()
		
	

func _on_start_button_down() -> void:
	current_level_index = 0
	start_level()
	

func restart_level() -> void:
	start_level()
	

func start_next_level() -> void:
	current_level_index += 1
	start_level()
	

func select_and_start_level(index : int) -> void:
	current_level_index = index
	start_level()
	
