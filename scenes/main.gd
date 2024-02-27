extends Node2D

@export var level : PackedScene

var current_level : Node2D

func _on_start_button_down():
	%MainMenu.visible = false
	%Background.set_process(false)
	
	current_level = level.instantiate()
	add_child(current_level)
	
	
