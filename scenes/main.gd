extends Node2D

@export var levels : Array[PackedScene] = []

var current_level_index : int
var current_level : Level

func _on_start_button_down():
	%MainMenu.visible = false
	%Background.set_process(false)
	
	
	current_level_index = 0
	load_level(levels[current_level_index])
	

#this seemingly useless function is here in case we add more than one level
#or a death screen or something
func restart_level() -> void:
	load_level(levels[current_level_index])
	

func load_level(new_level : PackedScene) -> void:
	if current_level:
		current_level.queue_free()
		#the level is pretty big so we should wait a hot sec while it gets deleted
		await get_tree().process_frame
		
	
	current_level = new_level.instantiate()
	add_child(current_level)
	current_level.level_ended.connect(restart_level.bind())
	
