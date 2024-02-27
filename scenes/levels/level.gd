extends Node2D

signal level_ended

func _ready() -> void:
	%Player.player_died.connect(game_over.bind())
	

func game_over() -> void:
	level_ended.emit()
	
