extends Node

#the workaround i needed to do to get this to work is utterly insane

var levels : Array[Level_Data] = []
const level_data_list : Level_Data_Lists = preload("res://assets/resources/level_data_lists.tres") 

func _ready():
	for l in level_data_list.levels:
		levels.append(l)
		
	
