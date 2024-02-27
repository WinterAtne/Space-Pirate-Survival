extends Node2D
class_name Level

signal level_ended

func _ready() -> void:
	%Player.player_died.connect(game_over.bind())
	

func game_over() -> void:
	level_ended.emit()
	
