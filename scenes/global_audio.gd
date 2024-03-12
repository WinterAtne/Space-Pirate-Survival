extends Node

var audio_players :Array[AudioStreamPlayer2D]
@onready var children : Array[Node] = self.get_children()

func _ready():
	for _i in children:
		if _i is AudioStreamPlayer2D:
			audio_players.append(_i)
			
		
	
